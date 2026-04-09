import 'package:flutter/material.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/adaptive_dialog_action.dart';

class ChatEulaDefaults {
  static const String isChatTermsAcceptedKey = 'isChatTermsAccepted';
  
  static const String eulaTitle = 'Terms & Conditions';
  
  static const String eulaContent = '''
By using the Chat feature, you agree to the following terms:

• No abusive content is allowed.
• No harassment or bullying is allowed.
• No illegal content is allowed.
• Users violating these rules may be banned or blocked from the service.

Please accept these terms to continue using the chat.
''';
}

Future<bool?> showChatEulaDialog({
  required BuildContext context,
  bool isReadOnly = false,
}) async {
  return await showDialog<bool>(
    context: context,
    barrierDismissible: isReadOnly,
    builder: (context) => ChatEulaDialog(isReadOnly: isReadOnly),
  );
}

class ChatEulaDialog extends StatelessWidget {
  final bool isReadOnly;

  const ChatEulaDialog({
    super.key,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return AlertDialog.adaptive(
      title: const Text(
        ChatEulaDefaults.eulaTitle,
        textAlign: TextAlign.center,
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          child: Text(
            ChatEulaDefaults.eulaContent,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.9),
            ),
          ),
        ),
      ),
      actions: isReadOnly
          ? [
              AdaptiveDialogAction(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(L10n.of(context).close),
              ),
            ]
          : [
              AdaptiveDialogAction(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  L10n.of(context).decline,
                  style: TextStyle(color: theme.colorScheme.error),
                ),
              ),
              AdaptiveDialogAction(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(L10n.of(context).accept),
              ),
            ],
    );
  }
}
