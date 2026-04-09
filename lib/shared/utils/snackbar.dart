import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

enum SnackbarType { success, warning, error, info }

class CustomSnackbar extends StatelessWidget {
  final String title;
  final String message;
  final SnackbarType type;
  final VoidCallback? onClose;

  const CustomSnackbar({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.onClose,
  });

  static void show(
    BuildContext context, {
    String? title,
    required String message,
    required SnackbarType type,
    VoidCallback? onClose,
  }) {
    if (!context.mounted) return;
    
    final defaultTitle = _getDefaultTitle(type);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomSnackbar(
          title: title ?? defaultTitle,
          message: message,
          type: type,
          onClose: onClose,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        padding: EdgeInsets.zero,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static String _getDefaultTitle(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return 'Success';
      case SnackbarType.warning:
        return 'Warning';
      case SnackbarType.error:
        return 'Error';
      case SnackbarType.info:
        return 'Info';
    }
  }

  Color get backgroundColor {
    switch (type) {
      case SnackbarType.success:
        return const Color(0x99145317);
      case SnackbarType.warning:
        return const Color(0x7FDA771B);
      case SnackbarType.error:
        return const Color.fromRGBO(246, 61, 61, 0.4);
   
      case SnackbarType.info:
        return const Color(0x7F5E9BFC);
    }
  }

  IconData get icon {
    switch (type) {
      case SnackbarType.success:
        return Icons.check_circle;
      case SnackbarType.warning:
        return Icons.warning;
      case SnackbarType.error:
        return Icons.error;
      case SnackbarType.info:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: context.screenWidth*0.06,),
           SizedBox(width: context.screenWidth*0.05,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: type == SnackbarType.success
                        ? const Color(0xFFF3F7F8)
                        : Colors.white,
                    fontSize: context.screenWidth*0.04,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  message,
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize:context.screenWidth*0.03,
                    fontFamily: 'Neometric',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (context.mounted) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }
              onClose?.call();
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
