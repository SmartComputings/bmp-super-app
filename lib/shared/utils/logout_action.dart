import 'package:bmp/core/localization/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bmp/shared/providers/check_username_provider.dart';
import 'package:bmp/shared/providers/subscription_provider.dart';
import 'package:bmp/shared/providers/username_provider.dart';
import 'package:bmp/shared/utils/session_cleaner.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';

/// Flag to prevent multiple simultaneous logout calls
bool _isLoggingOut = false;

Future<void> logoutAction(BuildContext context) async {
  // Prevent multiple simultaneous logout calls (fixes double loader issue)
  if (_isLoggingOut) {
    Logs().w('Logout already in progress, ignoring duplicate call');
    return;
  }

  if (!context.mounted) return;

  final dialogueResult = await showOkCancelAlertDialog(
    useRootNavigator: false,
    context: context,
    title: L10n.of(context).areYouSureYouWantToLogout,
    message: L10n.of(context).noBackupWarning,
    okLabel: L10n.of(context).logout,
    cancelLabel: L10n.of(context).cancel,
    dialogType: DialogType.logout,
  );

  if (dialogueResult != OkCancelResult.ok) {
    return;
  }

  // Set flag to prevent duplicate calls
  _isLoggingOut = true;

  // Save Matrix reference and username before any async operations
  final matrix = Matrix.of(context);
  final username = matrix.client.userID;

  // Capture all providers BEFORE entering the async future to avoid widget deactivation error
  // "Looking up a deactivated widget's ancestor is unsafe"
  UsernameProvider? usernameProvider;
  CheckUsernameProvider? checkUsernameProvider;

  try {
    usernameProvider = context.read<UsernameProvider>();
  } catch (_) {}
  try {
    checkUsernameProvider = context.read<CheckUsernameProvider>();
  } catch (_) {}

  if (!context.mounted) {
    _isLoggingOut = false;
    return;
  }

  // Wrap ALL logout operations in a single loading dialog to avoid double loader
  final result = await showFutureLoadingDialog(
    context: context,
    delay: false, // Show loader immediately for better UX
    future: () async {
      // Clear all provider states using pre-captured references
      // This avoids "Looking up a deactivated widget's ancestor" error
      // Finance providers cleared - module removed
      try {
        await usernameProvider?.clearUsername();
      } catch (e) {
        debugPrint('⚠️ Failed to clear UsernameProvider: $e');
      }
      try {
        await usernameProvider?.clearUsername();
      } catch (e) {
        debugPrint('⚠️ Failed to clear UsernameProvider: $e');
      }
      try {
        // await subscriptionProvider?.clearSubscription();
      } catch (e) {
        debugPrint('⚠️ Failed to clear SubscriptionProvider: $e');
      }
      try {
        await checkUsernameProvider?.clearAll();
      } catch (e) {
        debugPrint('⚠️ Failed to clear CheckUsernameProvider: $e');
      }
      debugPrint('🧹 DEBUG: All available provider states cleared');

      // Logout API call removed - finance module removed

      // Clear ALL user data comprehensively
      await SessionCleaner.clearAllUserData();

      // Backup recovery key before Matrix logout (it will be deleted)
      String? recoveryKey;
      try {
        final userId = matrix.client.userID;
        if (userId != null) {
          final storage = FlutterSecureStorage();
          final keyName = 'ssss_recovery_key_$userId';
          recoveryKey = await storage.read(key: keyName);
          if (recoveryKey != null) {
            debugPrint('💾 Backed up recovery key before logout');
          }
        }
      } catch (e) {
        debugPrint('⚠️ Failed to backup recovery key: $e');
      }

      // Sign out from Firebase (phone auth)
      try {
        await FirebaseAuth.instance.signOut();
        debugPrint('🔥 Firebase sign-out successful');
      } catch (e) {
        debugPrint('⚠️ Firebase sign-out failed: $e');
      }

      // Finally, logout from Matrix client (this clears everything)
      await matrix.client.logout();

      // Restore recovery key after Matrix logout
      if (recoveryKey != null) {
        try {
          final userId = username; // Use saved username
          if (userId != null) {
            final storage = FlutterSecureStorage();
            final keyName = 'ssss_recovery_key_$userId';
            await storage.write(key: keyName, value: recoveryKey);
            debugPrint('✅ Restored recovery key after logout');
          }
        } catch (e) {
          debugPrint('⚠️ Failed to restore recovery key: $e');
        }
      }
    },
  );

  // Reset flag after logout completes
  _isLoggingOut = false;

  if (result.error == null && context.mounted) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.go('/welcome');
      }
    });
  }
}

Future<void> clearProvidersData(BuildContext context) async {
  try {
    final usernameProvider = context.read<UsernameProvider>();
    await usernameProvider.clearUsername();
  } catch (e) {
    debugPrint('⚠️ UsernameProvider not available: $e');
  }

  try {
    final subscriptionProvider = context.read<SubscriptionProvider>();
    await subscriptionProvider.clearSubscription();
  } catch (e) {
    debugPrint('⚠️ SubscriptionProvider not available: $e');
  }

  debugPrint('🧹 DEBUG: All available provider states cleared');
}
/// Force logout without confirmation dialog (used for session expiry)
Future<void> forceLogout(BuildContext context) async {
  if (_isLoggingOut) {
    Logs().w('Force logout already in progress, ignoring duplicate call');
    return;
  }

  // Inform the user their session has expired before logging out
  if (context.mounted) {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ctx.screenWidth * 0.05),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment(-0.00, 0.75),
              end: Alignment(1.05, 0.32),
              colors: [Color(0xFFA912BF), Color(0xFF131EBF)],
            ),
            borderRadius: BorderRadius.circular(ctx.screenWidth * 0.05),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: ctx.screenWidth * 0.06,
            vertical: ctx.screenHeight * 0.035,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: ctx.screenWidth * 0.14,
                height: ctx.screenWidth * 0.14,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.white,
                  size: ctx.screenWidth * 0.07,
                ),
              ),
              SizedBox(height: ctx.screenHeight * 0.02),
              Text(
                 L10n.of(context).sessionExpired,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ctx.screenWidth * 0.05,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: ctx.screenHeight * 0.012),
              Text(
                L10n.of(context).sessionExpiredMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: ctx.screenWidth * 0.035,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(height: ctx.screenHeight * 0.03),
              SizedBox(
                width: double.infinity,
                height: ctx.screenHeight * 0.05,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1929FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ctx.screenWidth * 0.25),
                    ),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      vertical: ctx.screenHeight * 0.01,
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ctx.screenWidth * 0.04,
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

  _isLoggingOut = true;

  // Save Matrix reference and username before any async operations
  final matrix = Matrix.of(context);
  final username = matrix.client.userID;

  // Capture all providers BEFORE entering async operations to avoid widget deactivation error
  // "Looking up a deactivated widget's ancestor is unsafe"
  UsernameProvider? usernameProvider;
  CheckUsernameProvider? checkUsernameProvider;

  try {
    usernameProvider = context.read<UsernameProvider>();
  } catch (_) {}
  try {
    checkUsernameProvider = context.read<CheckUsernameProvider>();
  } catch (_) {}

  try {
    // Clear all provider states using pre-captured references
    // This avoids "Looking up a deactivated widget's ancestor" error
    // Finance providers cleared - module removed
    try {
      await usernameProvider?.clearUsername();
    } catch (e) {
      debugPrint('⚠️ Failed to clear UsernameProvider: $e');
    }
    try {
      await checkUsernameProvider?.clearAll();
    } catch (e) {
      debugPrint('⚠️ Failed to clear CheckUsernameProvider: $e');
    }
    debugPrint('🧹 DEBUG: All available provider states cleared');

    // Logout API call removed - finance module removed

    // Clear ALL user data comprehensively
    await SessionCleaner.clearAllUserData();

    // Backup recovery key before Matrix logout (it will be deleted)
    String? recoveryKey;
    try {
      final userId = matrix.client.userID;
      if (userId != null) {
        final storage = FlutterSecureStorage();
        final keyName = 'ssss_recovery_key_$userId';
        recoveryKey = await storage.read(key: keyName);
        if (recoveryKey != null) {
          debugPrint('💾 Backed up recovery key before force logout');
        }
      }
    } catch (e) {
      debugPrint('⚠️ Failed to backup recovery key: $e');
    }

    // Sign out from Firebase (phone auth)
    try {
      await FirebaseAuth.instance.signOut();
      debugPrint('🔥 Firebase sign-out successful');
    } catch (e) {
      debugPrint('⚠️ Firebase sign-out failed: $e');
    }

    // Finally, logout from Matrix client (this clears everything)
    await matrix.client.logout();

    // Restore recovery key after Matrix logout
    if (recoveryKey != null) {
      try {
        final userId = username; // Use saved username
        if (userId != null) {
          final storage = FlutterSecureStorage();
          final keyName = 'ssss_recovery_key_$userId';
          await storage.write(key: keyName, value: recoveryKey);
          debugPrint('✅ Restored recovery key after force logout');
        }
      } catch (e) {
        debugPrint('⚠️ Failed to restore recovery key: $e');
      }
    }

    if (context.mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.go('/welcome');
        }
      });
    }
  } catch (e) {
    debugPrint('❌ Error during force logout: $e');
  } finally {
    _isLoggingOut = false;
  }
}
