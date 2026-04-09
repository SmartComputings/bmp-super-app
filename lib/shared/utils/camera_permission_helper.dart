import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import '../../core/localization/l10n.dart';

class CameraPermissionHelper {
  static Future<bool> requestCameraPermission(BuildContext context) async {
    final status = await Permission.camera.status;
    
    if (status.isGranted) {
      return true;
    }
    
    if (status.isDenied) {
      final result = await Permission.camera.request();
      return result.isGranted;
    }
    
    if (status.isPermanentlyDenied) {
      final shouldOpenSettings = await _showPermissionDialog(context);
      if (shouldOpenSettings) {
        await openAppSettings();
      }
      return false;
    }
    
    return false;
  }
  
  static Future<bool> _showPermissionDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L10n.of(context)!.accessRequired),
        content: Text(
          L10n.of(context)!.cameraAccessRequired,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(L10n.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(L10n.of(context)!.openSettings),
          ),
        ],
      ),
    ) ?? false;
  }
}