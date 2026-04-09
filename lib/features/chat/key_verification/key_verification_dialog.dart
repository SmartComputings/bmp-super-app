import 'dart:convert';
import 'dart:ui';

import 'package:bmp/shared/utils/adaptive_loader_widget.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:matrix/encryption.dart';
import 'package:matrix/matrix.dart';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/adaptive_dialog_action.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';

class KeyVerificationDialog extends StatefulWidget {
  Future<void> show(BuildContext context) => showAdaptiveDialog(
        context: context,
        builder: (context) => this,
        barrierDismissible: false,
      );

  final KeyVerification request;

  const KeyVerificationDialog({
    super.key,
    required this.request,
  });

  @override
  KeyVerificationPageState createState() => KeyVerificationPageState();
}

class KeyVerificationPageState extends State<KeyVerificationDialog> {
  void Function()? originalOnUpdate;
  List<dynamic>? sasEmoji; // Make nullable to avoid LateInitializationError
  bool _isLoadingEmoji = true; // Add loading state

  // Fallback emoji list in case the JSON file is not available
  static const List<Map<String, dynamic>> _fallbackEmojis = [
    {'number': 0, 'emoji': '🦄', 'name': 'Unicorn'},
    {'number': 1, 'emoji': '🐘', 'name': 'Elephant'},
    {'number': 2, 'emoji': '🦒', 'name': 'Giraffe'},
    {'number': 3, 'emoji': '🦘', 'name': 'Kangaroo'},
    {'number': 4, 'emoji': '🦛', 'name': 'Hippopotamus'},
    {'number': 5, 'emoji': '🦏', 'name': 'Rhinoceros'},
    {'number': 6, 'emoji': '🦒', 'name': 'Giraffe'},
    {'number': 7, 'emoji': '🦘', 'name': 'Kangaroo'},
  ];

  @override
  void initState() {
    originalOnUpdate = widget.request.onUpdate;
    widget.request.onUpdate = () {
      originalOnUpdate?.call();
      setState(() {});
    };
    widget.request.client.getProfileFromUserId(widget.request.userId).then((p) {
      profile = p;
      setState(() {});
    });

    // Try to load the emoji file, fallback to built-in list if it fails
    rootBundle.loadString('assets/sas-emoji.json').then((e) {
      try {
        sasEmoji = json.decode(e);
        _isLoadingEmoji = false;
        setState(() {});
      } catch (parseError) {
        // Handle JSON parsing error - use fallback
        sasEmoji = _fallbackEmojis;
        _isLoadingEmoji = false;
        setState(() {});
      }
    }).catchError((error) {
      // Handle error loading emoji data (file not found, etc.) - use fallback
      sasEmoji = _fallbackEmojis;
      _isLoadingEmoji = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.request.onUpdate =
        originalOnUpdate; // don't want to get updates anymore
    if (![KeyVerificationState.error, KeyVerificationState.done]
        .contains(widget.request.state)) {
      widget.request.cancel('m.user');
    }
    super.dispose();
  }

  Profile? profile;

  Future<void> checkInput(String input) async {
    if (input.isEmpty) return;

    final valid = await showFutureLoadingDialog(
      context: context,
      future: () async {
        // make sure the loading spinner shows before we test the keys
        await Future.delayed(const Duration(milliseconds: 100));
        var valid = false;
        try {
          await widget.request.openSSSS(keyOrPassphrase: input);
          valid = true;
        } catch (_) {
          valid = false;
        }
        return valid;
      },
    );
    if (valid.error != null) {
      await showOkAlertDialog(
        useRootNavigator: false,
        context: context,
            dialogType: DialogType.warning,
        title: L10n.of(context).incorrectPassphraseOrKey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    User? user;
    final directChatId =
        widget.request.client.getDirectChatFromUserId(widget.request.userId);
    if (directChatId != null) {
      user = widget.request.client
          .getRoomById(directChatId)!
          .unsafeGetUserFromMemoryOrFallback(widget.request.userId);
    }
    final displayName =
        user?.calcDisplayname() ?? widget.request.userId.localpart!;
    var title = Text(L10n.of(context).verifyTitle);
    Widget body = const SizedBox.shrink(); // Initialize with default value
    final buttons = <Widget>[];

    switch (widget.request.state) {
      case KeyVerificationState.showQRSuccess:
      case KeyVerificationState.confirmQRScan:
        throw L10n.of(context).notImplemented;
      case KeyVerificationState.askSSSS:
        // prompt the user for their ssss passphrase / key
        final textEditingController = TextEditingController();
        String input;
        body = Container(
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                L10n.of(context).askSSSSSign,
                style: const TextStyle(fontSize: 20),
              ),
              Container(height: 10),
              TextField(
                controller: textEditingController,
                autofocus: false,
                autocorrect: false,
                onSubmitted: (s) {
                  input = s;
                  checkInput(input);
                },
                minLines: 1,
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: L10n.of(context).passphraseOrKey,
                  prefixStyle: TextStyle(color: theme.colorScheme.primary),
                  suffixStyle: TextStyle(color: theme.colorScheme.primary),
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
        );
        buttons.add(
          AdaptiveDialogAction(
            child: Text(
              L10n.of(context).submit,
            ),
            onPressed: () => checkInput(textEditingController.text),
          ),
        );
        buttons.add(
          AdaptiveDialogAction(
            child: Text(
              L10n.of(context).skip,
            ),
            onPressed: () => widget.request.openSSSS(skip: true),
          ),
        );
        break;
      case KeyVerificationState.askAccept:
        title = Text(L10n.of(context).newVerificationRequest);
        body = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Avatar(
              mxContent: user?.avatarUrl,
              name: displayName,
              size: Avatar.defaultSize * 2,
            ),
            const SizedBox(height: 16),
            Text(
              L10n.of(context).askVerificationRequest(displayName),
            ),
          ],
        );
        buttons.add(
          AdaptiveDialogAction(
            onPressed: () {
              widget.request.rejectVerification();
              Navigator.of(context, rootNavigator: false).pop();
            },
            child: Text(
              L10n.of(context).reject,
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        );
        buttons.add(
          AdaptiveDialogAction(
            onPressed: () => widget.request.acceptVerification(),
            child: Text(L10n.of(context).accept),
          ),
        );
        break;
      case KeyVerificationState.askChoice:
      case KeyVerificationState.waitingAccept:
        body = Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.center,
                children: [
                  Avatar(
                    mxContent: user?.avatarUrl,
                    name: displayName,
                  ),
                  AppLoadingWidget(),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                L10n.of(context).waitingPartnerAcceptRequest,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
        buttons.add(
          AdaptiveDialogAction(
            onPressed: () {
              widget.request.cancel('m.user');
              Navigator.of(context, rootNavigator: false).pop();
            },
            child: Text(L10n.of(context).cancel),
          ),
        );

        break;
      case KeyVerificationState.askSas:
        TextSpan compareWidget;
        // maybe add a button to switch between the two and only determine default
        // view for if "emoji" is a present sasType or not?

        if (widget.request.sasTypes.contains('emoji')) {
          title = Text(
            L10n.of(context).compareEmojiMatch,
            maxLines: 1,
            style: const TextStyle(fontSize: 16),
          );

          // Handle loading state and null sasEmoji
          if (_isLoadingEmoji || sasEmoji == null) {
            // Show loading indicator while emoji data is being loaded
            body = Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 16),
                const  AdaptiveLoaderWidget(),
                const SizedBox(height: 16),
                Text(
                  L10n.of(context).loadingEmojiVerification,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                          theme.colorScheme.onSurface.withValues(alpha: 0.7),),
                ),
              ],
            );
            break;
          }

          compareWidget = TextSpan(
            children: widget.request.sasEmojis
                .map((e) => WidgetSpan(child: _Emoji(e, sasEmoji)))
                .toList(),
          );
        } else {
          title = Text(L10n.of(context).compareNumbersMatch);
          final numbers = widget.request.sasNumbers;
          final numbstr = '${numbers[0]}-${numbers[1]}-${numbers[2]}';
          compareWidget =
              TextSpan(text: numbstr, style: const TextStyle(fontSize: 40));
        }

        // Only set body if we have the compareWidget (not in loading state)
        if (!_isLoadingEmoji && sasEmoji != null) {
          body = Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text.rich(
                compareWidget,
                textAlign: TextAlign.center,
              ),
            ],
          );
        } else if (widget.request.sasTypes.contains('emoji')) {
          // Fallback for emoji verification when data is not ready
          body = Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 16),
              const  AdaptiveLoaderWidget(),
              const SizedBox(height: 16),
              Text(
                L10n.of(context).preparingEmojiVerification,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),),
              ),
            ],
          );
        } else {
          // Fallback for number verification
          body = Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text.rich(
                compareWidget,
                textAlign: TextAlign.center,
              ),
            ],
          );
        }
        buttons.add(
          AdaptiveDialogAction(
            onPressed: () {
              widget.request.rejectSas();
              Navigator.of(context, rootNavigator: false).pop();
            },
            child: Text(
              L10n.of(context).theyDontMatch,
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        );
        buttons.add(
          AdaptiveDialogAction(
            onPressed: () => widget.request.acceptSas(),
            child: Text(L10n.of(context).theyMatch),
          ),
        );
        break;
      case KeyVerificationState.waitingSas:
        final acceptText = widget.request.sasTypes.contains('emoji')
            ? L10n.of(context).waitingPartnerEmoji
            : L10n.of(context).waitingPartnerNumbers;
        body = Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 16),
            const  AdaptiveLoaderWidget(),
            const SizedBox(height: 16),
            Text(
              acceptText,
              textAlign: TextAlign.center,
            ),
          ],
        );
        break;
      case KeyVerificationState.done:
        title = Text(L10n.of(context).verifySuccess);
        body = const Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Icons.verified_outlined,
            color: Colors.green,
            size: 128.0,
          ),
        );
        buttons.add(
          AdaptiveDialogAction(
            child: Text(
              L10n.of(context).close,
            ),
            onPressed: () => Navigator.of(context, rootNavigator: false).pop(),
          ),
        );
        break;
      case KeyVerificationState.error:
        // Provide user-friendly error messages
        String errorMessage;
        String titleMessage;
        
        if (widget.request.canceledCode == 'm.mismatched_sas') {
          titleMessage = L10n.of(context).verificationFailed;
          errorMessage = L10n.of(context).verificationCodesDontMatch;
        } else if (widget.request.canceledCode == 'm.user') {
          titleMessage = L10n.of(context).verificationCancelled;
          errorMessage = L10n.of(context).otherUserCancelledVerification;
        } else if (widget.request.canceledCode == 'm.timeout') {
          titleMessage = L10n.of(context).verificationTimeout;
          errorMessage = L10n.of(context).verificationTimedOut;
        } else if (widget.request.canceledCode == 'm.unknown_transaction') {
          titleMessage = L10n.of(context).verificationError;
          errorMessage = L10n.of(context).unknownVerificationTransaction;
        } else if (widget.request.canceledCode == 'm.unknown_method') {
          titleMessage = L10n.of(context).methodNotSupported;
          errorMessage = L10n.of(context).verificationMethodNotSupported;
        } else if (widget.request.canceledCode == 'm.unexpected_message') {
          titleMessage = L10n.of(context).verificationError;
          errorMessage = L10n.of(context).unexpectedMessageReceived;
        } else if (widget.request.canceledCode == 'm.key_mismatch') {
          titleMessage = L10n.of(context).keyVerificationFailed;
          errorMessage = L10n.of(context).keysCouldNotBeVerified;
        } else if (widget.request.canceledCode == 'm.user_mismatch') {
          titleMessage = L10n.of(context).userVerificationFailed;
          errorMessage = L10n.of(context).userIdentityCouldNotBeVerified;
        } else if (widget.request.canceledCode == 'm.invalid_message') {
          titleMessage = L10n.of(context).invalidMessage;
          errorMessage = L10n.of(context).invalidMessageReceived;
        } else if (widget.request.canceledCode == 'm.accepted') {
          titleMessage = L10n.of(context).alreadyVerified;
          errorMessage = L10n.of(context).verificationAlreadyAccepted;
        } else {
          titleMessage = L10n.of(context).verificationCancelled;
          errorMessage = L10n.of(context).verificationCancelledByOtherUser;
        }
        
        title = Text(titleMessage);

        body = Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 16),
            Icon(
              widget.request.canceledCode == 'm.user' 
                ? Icons.cancel_outlined
                : widget.request.canceledCode == 'm.mismatched_sas'
                  ? Icons.close
                  : Icons.error_outline,
              color: widget.request.canceledCode == 'm.user'
                ? Colors.orange
                : theme.colorScheme.error,
              size: 64.0,
            ),
            const SizedBox(height: 16),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        );

        // Add a "Try Again" button for certain error types
        if (widget.request.canceledCode == 'm.mismatched_sas' ||
            widget.request.canceledCode == 'm.timeout' ||
            widget.request.canceledCode == 'm.unknown_method') {
          buttons.add(
            AdaptiveDialogAction(
              child: Text(
                L10n.of(context).tryAgain,
                style: TextStyle(color: theme.colorScheme.primary),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: false).pop();
                // The user can start a new verification from the chat
              },
            ),
          );
        }

        buttons.add(
          AdaptiveDialogAction(
            child: Text(
              L10n.of(context).close,
            ),
            onPressed: () => Navigator.of(context, rootNavigator: false).pop(),
          ),
        );
        break;
    }

    return AlertDialog.adaptive(
      title: title,
      content: SizedBox(
        height: 256,
        width: 256,
        child: ListView(
          children: [body],
        ),
      ),
      actions: buttons,
    );
  }
}

class _Emoji extends StatelessWidget {
  final KeyVerificationEmoji emoji;
  final List<dynamic>? sasEmoji;

  const _Emoji(this.emoji, this.sasEmoji);

  String getLocalizedName() {
    final sasEmoji = this.sasEmoji;
    if (sasEmoji == null) {
      // asset is still being loaded
      return emoji.name;
    }
    final translations = Map<String, String?>.from(
      sasEmoji[emoji.number]['translated_descriptions'],
    );
    translations['en'] = emoji.name;
    for (final locale in PlatformDispatcher.instance.locales) {
      final wantLocaleParts = locale.toString().split('_');
      final wantLanguage = wantLocaleParts.removeAt(0);
      for (final haveLocale in translations.keys) {
        final haveLocaleParts = haveLocale.split('_');
        final haveLanguage = haveLocaleParts.removeAt(0);
        if (haveLanguage == wantLanguage &&
            (Set.from(haveLocaleParts)..removeAll(wantLocaleParts)).isEmpty &&
            (translations[haveLocale]?.isNotEmpty ?? false)) {
          return translations[haveLocale]!;
        }
      }
    }
    return emoji.name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(emoji.emoji, style: const TextStyle(fontSize: 50)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(getLocalizedName()),
        ),
        const SizedBox(height: 10, width: 5),
      ],
    );
  }
}
