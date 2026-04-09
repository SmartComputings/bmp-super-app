import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

enum OkCancelResult { ok, cancel }
enum DialogType { success, warning, error, logout }

Future<OkCancelResult?> showOkCancelAlertDialog({
  required BuildContext context,
  required String title,
  required DialogType dialogType,
  String? message,
  String? okLabel,
  String? cancelLabel,
  bool useRootNavigator = true,
}) {
  Color backgroundColor;
  IconData icon;

  switch (dialogType) {
    case DialogType.success:
      backgroundColor = const  Color(0xFF17A31A);
      icon = Icons.check;
      break;
    case DialogType.warning:
      backgroundColor = const  Color(0xFFC95C16);
      icon = Icons.warning_amber_rounded;
      break;
    case DialogType.error:
      backgroundColor = const Color(0xFFF63D3D);
      icon = Icons.close;
      break;
    case DialogType.logout:
      backgroundColor = const Color(0xFFF63D3D); // Red color
      icon = Icons.warning_amber_rounded; // Warning icon
      break;
  }

  return showAdaptiveDialog<OkCancelResult>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.screenWidth * 0.95,
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.06,
          vertical: context.screenHeight * 0.04,
        ),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.00, 0.75),
            end: Alignment(1.05, 0.32),
            colors: [Color(0xFFA912BF), Color(0xFF131EBF)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Container(
                  width: context.screenWidth * 0.15,
                  height: context.screenWidth * 0.15,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: backgroundColor,
                    size: context.screenWidth * 0.08,
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.017),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFF3F7F8),
                    fontSize: context.screenWidth * 0.04,
                    fontFamily: 'Neometric',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (message != null) ...[
                  SizedBox(height: context.screenHeight * 0.01),
                  SelectableLinkify(
                    text: message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFC6D4DB),
                      fontSize: context.screenWidth * 0.035,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                    ),
                    linkStyle: const TextStyle(
                      color: Color(0xFF3976F8),
                    ),
                    options: const LinkifyOptions(humanize: false),
                    onOpen: (url) =>
                        UrlLauncher(context, url.url).launchUrl(),
                  ),
                ],
              ],
            ),
            SizedBox(height: context.screenHeight * 0.03),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: context.screenHeight * 0.05,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context)
                        .pop<OkCancelResult>(OkCancelResult.ok),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.screenWidth * 0.25),
                      ),
                      padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        okLabel ?? L10n.of(context).ok,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.04,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.012),
                SizedBox(
                  width: double.infinity,
                  height: context.screenHeight * 0.05,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .pop<OkCancelResult>(OkCancelResult.cancel),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1929FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.screenWidth * 0.25),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        cancelLabel ?? L10n.of(context).cancel,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.04,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Future<OkCancelResult?> showOkAlertDialog({
  required BuildContext context,
  required String title,
  required DialogType dialogType,
  String? message,
  String? okLabel,
  bool useRootNavigator = true,
}) {
  Color backgroundColor;
  IconData icon;

  switch (dialogType) {
    case DialogType.success:
      backgroundColor = const  Color(0xFF17A31A);
      icon = Icons.check;
      break;
    case DialogType.warning:
      backgroundColor = const  Color(0xFFC95C16);
      icon = Icons.warning_amber_rounded;
      break;
    case DialogType.error:
      backgroundColor = const Color(0xFFF63D3D);
      icon = Icons.close;
      break;
    case DialogType.logout:
      backgroundColor = const Color(0xFFF63D3D); // Red color
      icon = Icons.warning_amber_rounded; // Warning icon
      break;
  }

  return showAdaptiveDialog<OkCancelResult>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.screenWidth * 0.95,
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.06,
          vertical: context.screenHeight * 0.04,
        ),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.00, 0.75),
            end: Alignment(1.05, 0.32),
            colors: [Color(0xFFA912BF), Color(0xFF131EBF)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Container(
                  width: context.screenWidth * 0.15,
                  height: context.screenWidth * 0.15,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: backgroundColor,
                    size: context.screenWidth * 0.08,
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.017),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFF3F7F8),
                    fontSize: context.screenWidth * 0.04,
                    fontFamily: 'Neometric',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (message != null) ...[
                  SizedBox(height: context.screenHeight * 0.01),
                  SelectableLinkify(
                    text: message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFC6D4DB),
                      fontSize: context.screenWidth * 0.035,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                    ),
                    linkStyle: const TextStyle(
                      color: Color(0xFF3976F8),
                    ),
                    options: const LinkifyOptions(humanize: false),
                    onOpen: (url) =>
                        UrlLauncher(context, url.url).launchUrl(),
                  ),
                ],
              ],
            ),
            SizedBox(height: context.screenHeight * 0.03),
            SizedBox(
              width: double.infinity,
              height: context.screenHeight * 0.05,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pop<OkCancelResult>(OkCancelResult.ok),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1929FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.screenWidth * 0.25),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    okLabel ?? L10n.of(context).close,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.screenWidth * 0.04,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
