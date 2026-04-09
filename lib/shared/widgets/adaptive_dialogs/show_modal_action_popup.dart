import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showModalActionPopup<T>({
  required BuildContext context,
  required List<AdaptiveModalAction<T>> actions,
  String? title,
  String? message,
  String? cancelLabel,
  bool useRootNavigator = true,
}) {
  final theme = Theme.of(context);

  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.windows:
    case TargetPlatform.linux:
      return showModalBottomSheet<T>(
        context: context,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        useRootNavigator: useRootNavigator,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxWidth: context.screenWidth*1,
          maxHeight: MediaQuery.of(context).size.height - 32,
        ),
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: const Color(0xff7216BF).withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(
              color: const Color(0xff7216BF).withOpacity(1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              if (title != null)
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (message != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: actions.map((action) => _buildOptionCard(
                  context: context,
                  icon: _getIconData(action),
                  label: action.label,
                  isDestructive: action.isDestructive,
                  isDefaultAction: action.isDefaultAction,
                  onTap: () => Navigator.of(context).pop<T>(action.value),
                ),).toList(),
              ),
              if (cancelLabel != null)...[
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(null),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        cancelLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 60),
            ],
          ),
        ),
      );
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return showCupertinoModalPopup<T>(
        context: context,
        useRootNavigator: useRootNavigator,
        builder: (context) => ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 512),
          child: CupertinoActionSheet(
            title: title == null ? null : Text(title),
            message: message == null ? null : Text(message),
            cancelButton: cancelLabel == null
                ? null
                : CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(null),
                    child: Text(cancelLabel),
                  ),
            actions: actions
                .map(
                  (action) => CupertinoActionSheetAction(
                    isDestructiveAction: action.isDestructive,
                    isDefaultAction: action.isDefaultAction,
                    onPressed: () => Navigator.of(context).pop<T>(action.value),
                    child: Text(action.label, maxLines: 1),
                  ),
                )
                .toList(),
          ),
        ),
      );
  }
}

IconData _getIconData(AdaptiveModalAction action) {
  if (action.icon != null) {
    return action.icon!.icon!;
  }
  return Icons.help_outline;
}

Widget _buildOptionCard({
  required BuildContext context,
  required IconData icon,
  required String label,
  required VoidCallback onTap,
  bool isDestructive = false,
  bool isDefaultAction = false,
}) {
  final iconColor = isDestructive ? Colors.red : Colors.white;
  final textColor = isDestructive ? Colors.red : Colors.white;
  final borderColor = isDefaultAction 
      ? Colors.white.withOpacity(0.6) 
      : Colors.white.withOpacity(0.2);
  
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: context.screenWidth*0.22,
      height: context.screenHeight*0.14,
      decoration: BoxDecoration(
        color: const Color(0xFF1B1C30).withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: isDefaultAction ? 2 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: isDefaultAction ? FontWeight.w600 : FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

class AdaptiveModalAction<T> {
  final String label;
  final T value;
  Icon? icon;
  final bool isDefaultAction;
  final bool isDestructive;

  AdaptiveModalAction({
    required this.label,
    required this.value,
    this.icon,
    this.isDefaultAction = false,
    this.isDestructive = false,
  });
}
