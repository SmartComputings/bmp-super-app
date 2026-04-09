import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/adaptive_dialog_action.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/dialog_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

Future<String?> showTextInputDialog({
  required BuildContext context,
  required String title,
  String? message,
  String? okLabel,
  String? cancelLabel,
  bool useRootNavigator = true,
  String? hintText,
  String? labelText,
  String? initialText,
  String? prefixText,
  String? suffixText,
  bool obscureText = false,
  bool isDestructive = false,
  int? minLines,
  int? maxLines,
  String? Function(String input)? validator,
  TextInputType? keyboardType,
  int? maxLength,
  bool autocorrect = true,
}) {
  final controller = TextEditingController(text: initialText);
  return showAdaptiveDialog<String>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      final error = ValueNotifier<String?>(null);
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 512),
          padding: const EdgeInsets.all(24),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(-0.00, 0.75),
              end: Alignment(1.05, 0.32),
              colors: [Color(0xFFA912BF), Color(0xFF131EBF)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Work Sans',
                ),
              ),
              const SizedBox(height: 16),
              // Message (if provided)
              if (message != null) ...[
                SelectableLinkify(
                  text: message,
                  textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
                  style: const TextStyle(color: Colors.white70),
                  linkStyle: const TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                  ),
                  options: const LinkifyOptions(humanize: false),
                  onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
                ),
                const SizedBox(height: 16),
              ],
              // Text Field with white border
              ValueListenableBuilder<String?>(
                valueListenable: error,
                builder: (context, error, _) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller,
                      obscureText: obscureText,
                      autofocus: true,
                      minLines: minLines ?? 1,
                      maxLines: maxLines ?? 1,
                      maxLength: maxLength,
                      keyboardType: keyboardType,
                      autocorrect: autocorrect,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Work Sans',
                      ),
                      decoration: InputDecoration(
                        hintText: hintText,
                        labelText: labelText,
                        prefixText: prefixText,
                        suffixText: suffixText,
                        errorText: error,
                        hintStyle: const TextStyle(color: Colors.white54),
                        labelStyle: const TextStyle(color: Colors.white70),
                        errorStyle: const TextStyle(color: Colors.redAccent),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        counterStyle: const TextStyle(color: Colors.white70),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Cancel button
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(null),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      cancelLabel ?? L10n.of(context).cancel,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Work Sans',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // OK button
                  ElevatedButton(
                    onPressed: () {
                      final input = controller.text;
                      final errorText = validator?.call(input);
                      if (errorText != null) {
                        error.value = errorText;
                        return;
                      }
                      Navigator.of(context).pop<String>(input);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1929FF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      okLabel ?? L10n.of(context).ok,
                      style: TextStyle(
                        color: isDestructive ? Colors.redAccent : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Work Sans',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
