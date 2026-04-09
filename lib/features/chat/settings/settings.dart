import 'dart:async';
import 'dart:convert';

import 'package:bmp/core/config/api_config.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/logout_action.dart';
import 'package:bmp/shared/utils/file_selector.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_modal_action_popup.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_text_input_dialog.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bootstrap/bootstrap_dialog.dart';
import 'settings_view.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsController createState() => SettingsController();
}

class SettingsController extends State<Settings> {
  Future<Profile>? profileFuture;
  bool profileUpdated = false;
  int _versionTapCount = 0;
  String? localDisplayName; // Make it public by removing underscore

  void updateProfile() => setState(() {
        profileUpdated = true;
        profileFuture = null;
      });

  void onVersionTap(BuildContext context) {
    _versionTapCount++;
    if (_versionTapCount >= 7) {
      _versionTapCount = 0;
      final environment = ApiConfig.baseUrl == 'https://apis.be-mindpower.net/api' ? 'Prod' : 'Dev';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$environment URL: ${ApiConfig.baseUrl}'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void setDisplaynameAction() async {
  final profile = await profileFuture;
  final input = await showTextInputDialog(
    useRootNavigator: false,
    context: context,
    title: L10n.of(context).editDisplayname,
    okLabel: L10n.of(context).ok,
    cancelLabel: L10n.of(context).cancel,
    initialText:
        localDisplayName ?? profile?.displayName ?? Matrix.of(context).client.userID!.localpart,
  );
  if (input == null) return;

  final matrix = Matrix.of(context);
  final userId = matrix.client.userID!;

  final success = await showFutureLoadingDialog(
    context: context,
    future: () => matrix.client.httpClient.put(
      Uri.parse("${matrix.client.homeserver}/_matrix/client/v3/profile/$userId/displayname"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${matrix.client.accessToken}',
      },
      body: jsonEncode({"displayname": input}),
    ),
  );

  if (success.error == null) {
    setState(() {
      localDisplayName = input;
      profileFuture = null;
      profileUpdated = true;
    });
  }
}


  void logoutActionPerform() => logoutAction(context);

  void deleteAccountAction() async {
    if (await showOkCancelAlertDialog(
          useRootNavigator: false,
          context: context,
          title: L10n.of(context).warning,
          message: L10n.of(context).deactivateAccountWarning,
          okLabel: L10n.of(context).ok,
          cancelLabel: L10n.of(context).cancel,
          dialogType: DialogType.warning,
        ) ==
        OkCancelResult.cancel) {
      return;
    }
    final supposedMxid = Matrix.of(context).client.userID!;
    final mxid = await showTextInputDialog(
      useRootNavigator: false,
      context: context,
      title: L10n.of(context).confirmMatrixId,
      validator: (text) => text == supposedMxid
          ? null
          : L10n.of(context).supposedMxid(supposedMxid),
      isDestructive: true,
      okLabel: L10n.of(context).delete,
      cancelLabel: L10n.of(context).cancel,
    );
    if (mxid == null || mxid.isEmpty || mxid != supposedMxid) {
      return;
    }
    final input = await showTextInputDialog(
      useRootNavigator: false,
      context: context,
      title: L10n.of(context).pleaseEnterYourPassword,
      okLabel: L10n.of(context).ok,
      cancelLabel: L10n.of(context).cancel,
      isDestructive: true,
      obscureText: true,
      hintText: '******',
      minLines: 1,
      maxLines: 1,
    );
    if (input == null) return;
    await showFutureLoadingDialog(
      context: context,
      future: () => Matrix.of(context).client.deactivateAccount(
            auth: AuthenticationPassword(
              password: input,
              identifier: AuthenticationUserIdentifier(
                user: Matrix.of(context).client.userID!,
              ),
            ),
          ),
    );
  }

  void setAvatarAction() async {
    final profile = await profileFuture;
    final actions = [
      if (PlatformInfos.isMobile)
        AdaptiveModalAction(
          value: AvatarAction.camera,
          label: L10n.of(context).openCamera,
          isDefaultAction: true,
          icon: const Icon(Icons.camera_alt_outlined),
        ),
      AdaptiveModalAction(
        value: AvatarAction.file,
        label: L10n.of(context).openGallery,
        icon: const Icon(Icons.photo_outlined),
      ),
      if (profile?.avatarUrl != null)
        AdaptiveModalAction(
          value: AvatarAction.remove,
          label: L10n.of(context).removeYourAvatar,
          isDestructive: true,
          icon: const Icon(Icons.delete_outlined),
        ),
    ];
    final action = actions.length == 1
        ? actions.single.value
        : await showModalActionPopup<AvatarAction>(
            context: context,
            title: L10n.of(context).changeYourAvatar,
            cancelLabel: L10n.of(context).cancel,
            actions: actions,
          );
    if (action == null) return;
    final matrix = Matrix.of(context);
    if (action == AvatarAction.remove) {
      final success = await showFutureLoadingDialog(
        context: context,
        future: () => matrix.client.setAvatar(null),
      );
      if (success.error == null) {
        updateProfile();
      }
      return;
    }
    MatrixFile file;
    if (PlatformInfos.isMobile) {
      final result = await ImagePicker().pickImage(
        source: action == AvatarAction.camera
            ? ImageSource.camera
            : ImageSource.gallery,
        imageQuality: 50,
      );
      if (result == null) return;
      file = MatrixFile(
        bytes: await result.readAsBytes(),
        name: result.path,
      );
    } else {
      final result = await selectFiles(
        context,
        type: FileSelectorType.images,
      );
      final pickedFile = result.firstOrNull;
      if (pickedFile == null) return;
      file = MatrixFile(
        bytes: await pickedFile.readAsBytes(),
        name: pickedFile.name,
      );
    }
    final success = await showFutureLoadingDialog(
      context: context,
      future: () => matrix.client.setAvatar(file),
    );
    if (success.error == null) {
      updateProfile();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => checkBootstrap());
    _loadLocalDisplayName();
    super.initState();
  }

  void _loadLocalDisplayName() async {
    final matrix = Matrix.of(context);
    final userId = matrix.client.userID;
    if (userId != null) {
      final prefs = await SharedPreferences.getInstance();
      final savedName = prefs.getString('local_display_name_$userId');
      if (savedName != null) {
        setState(() {
          localDisplayName = savedName;
        });
      }
    }
  }

  void checkBootstrap() async {
    final client = Matrix.of(context).client;
    if (!client.encryptionEnabled) return;
    await client.accountDataLoading;
    await client.userDeviceKeysLoading;
    if (client.prevBatch == null) {
      await client.onSync.stream.first;
    }
    final crossSigning =
        await client.encryption?.crossSigning.isCached() ?? false;
    final needsBootstrap =
        await client.encryption?.keyManager.isCached() == false ||
            client.encryption?.crossSigning.enabled == false ||
            crossSigning == false;
    final isUnknownSession = client.isUnknownSession;
    setState(() {
      showChatBackupBanner = needsBootstrap || isUnknownSession;
    });
  }

  bool? crossSigningCached;
  bool? showChatBackupBanner;

  void firstRunBootstrapAction(bool? enabled) async {
    // Only show bootstrap dialog when user explicitly enables chat backup
    if (enabled == true && showChatBackupBanner == true) {
      final success = await BootstrapDialog(
        client: Matrix.of(context).client,
      ).show(context);

      // Reset the encryption message flag if bootstrap was successful
      if (success == true) {
        try {
          Matrix.of(context).store.setBool('encryption_message_shown', false);
        } catch (e) {
          // Ignore errors when setting the flag
        }
      }

      checkBootstrap();
    } else if (enabled == false) {
      // User disabled chat backup - just update the state
      checkBootstrap();
    } else if (showChatBackupBanner != true) {
      // Chat backup is already enabled
      showOkAlertDialog(
        context: context,
            dialogType: DialogType.success,
        title: L10n.of(context).chatBackup,
        message: L10n.of(context).onlineKeyBackupEnabled,
        okLabel: L10n.of(context).close,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    profileFuture ??= client.getProfileFromUserId(
      client.userID!,
    );
    return SettingsView(this);
  }
}

enum AvatarAction { camera, file, remove }
