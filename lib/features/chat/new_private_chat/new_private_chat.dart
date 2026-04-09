import 'dart:async';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/new_private_chat/new_private_chat_view.dart';
import 'package:bmp/features/chat/new_private_chat/qr_scanner_modal_private.dart';
import 'package:bmp/shared/utils/bmp_share.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/user_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

class NewPrivateChat extends StatefulWidget {
  const NewPrivateChat({super.key});

  @override
  NewPrivateChatController createState() => NewPrivateChatController();
}

class NewPrivateChatController extends State<NewPrivateChat> {
  final TextEditingController controller = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    textFieldFocus.dispose();
    super.dispose();
  }

  Future<List<Profile>>? searchResponse;

  Timer? _searchCoolDown;

  static const Duration _coolDown = Duration(milliseconds: 500);

  void searchUsers([String? input]) async {
    final searchTerm = input ?? controller.text;
    if (searchTerm.isEmpty) {
      _searchCoolDown?.cancel();
      setState(() {
        searchResponse = _searchCoolDown = null;
      });
      return;
    }

    _searchCoolDown?.cancel();
    _searchCoolDown = Timer(_coolDown, () {
      setState(() {
        searchResponse = _searchUser(searchTerm);
      });
    });
  }

  Future<List<Profile>> _searchUser(String searchTerm) async {
    final result =
        await Matrix.of(context).client.searchUserDirectory(searchTerm);
    final profiles = result.results;

    if (searchTerm.isValidMatrixId &&
        searchTerm.sigil == '@' &&
        !profiles.any((profile) => profile.userId == searchTerm)) {
      profiles.add(Profile(userId: searchTerm));
    }

    return profiles;
  }

  void inviteAction() => BmpShare.shareInviteLink(context);

  void openScannerAction() async {
    if (PlatformInfos.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      if (info.version.sdkInt < 21) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).unsupportedVersion,
          message: L10n.of(context).unsupportedAndroidVersionLong,
          type: SnackbarType.warning,
        );
        return;
      }
    }
    await showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: QrScannerModal(
          onScan: (link) async {
            Navigator.of(context).pop();
          print(L10n.of(context).qrCodeScanned(link));
          if (link.startsWith('@') && link.contains(':')) {
            final parts = link.substring(1).split(':');
            final username = parts[0];
            final server = parts[1];
            print(L10n.of(context).usernameServer(username, server));
            
            final profile = Profile(userId: link);
            openUserModal(profile);
          } else if (link.contains('/#/@') && link.contains(':')) {
            final userIdStart = link.indexOf('/#/@') + 3;
            final userId = link.substring(userIdStart);
            final parts = userId.substring(1).split(':');
            final username = parts[0];
            final server = parts[1];
            print(L10n.of(context).extractedUserId(userId));
            print(L10n.of(context).usernameServer(username, server));
            
            final profile = Profile(userId: userId);
            openUserModal(profile);
          } else {
            print(L10n.of(context).matrixUrlDetected);
            UrlLauncher(context, link).openMatrixToUrl();
          }
        },
        ),
      ),
    );
  }

  void copyUserId() async {
    await Clipboard.setData(
      ClipboardData(text: Matrix.of(context).client.userID!),
    ); if (mounted) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).copied,
      message: L10n.of(context).copiedToClipboard,
      type: SnackbarType.success,
    );}
  }

  void openUserModal(Profile profile) {
    showAdaptiveDialog(
      context: context,
      builder: (dialogContext) => UserDialog(
        profile,
        onStartConversation: (String roomId) {
          controller.clear();
          if (mounted) {
            GoRouter.of(context).go('/rooms/$roomId');
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => NewPrivateChatView(this);
}
