import 'package:bmp/core/localization/l10n.dart';
// Finance providers removed

import 'package:bmp/shared/providers/check_username_provider.dart';
import 'package:bmp/shared/providers/subscription_provider.dart';
import 'package:bmp/shared/providers/username_provider.dart';
import 'package:bmp/shared/utils/session_cleaner.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogoutHelper {
  static Future<void> showLogoutConfirmation(BuildContext context) async {
    final result = await showOkCancelAlertDialog(
      dialogType: DialogType.warning,
      context: context,
      title: L10n.of(context).logout,
      message: L10n.of(context).logoutConfirmMessage,
      okLabel: L10n.of(context).logout,
      cancelLabel: L10n.of(context).cancel,
    );

    if (result == OkCancelResult.ok) {
      try {
        final matrix = Matrix.of(context);

        // Capture providers before async operation
        // final walletProvider = context.read<WalletProvider>();
        // final payCryptoProvider = context.read<PayCryptoProvider>();
        // final liquidationProvider = context.read<LiquidationProvider>();
        // final virtualAccountProvider = context.read<VirtualAccountProvider>();
        // final customerProvider = context.read<CustomerProvider>();

        final usernameProvider = context.read<UsernameProvider>();
        final subscriptionProvider = context.read<SubscriptionProvider>();
        final checkUsernameProvider = context.read<CheckUsernameProvider>();

        await showFutureLoadingDialog(
          context: context,
          future: () async {
            // Step 1: Clear all provider states
            try {
              print('🧹 Step 1: Clearing all provider states...');
              try{
                await matrix.client.logout();
              }
              catch(e){}
              // walletProvider.clearAllCache();
              // payCryptoProvider.clearKycData();
              // liquidationProvider.clearAllCache();
              // virtualAccountProvider.clearAllCache();
              // customerProvider.clearAllCustomerDataAndCloseBox(context: context);

              
              await usernameProvider.clearUsername();
              
              await subscriptionProvider.clearSubscription();
              
              await checkUsernameProvider.clearAll();

              
              print('✅ All providers cleared');
            } catch (e) {
              print('⚠️ Failed to clear providers: $e');
            }

            // Step 2: Matrix logout
            print('🔐 Step 2: Performing Matrix logout...');
            await matrix.client.logout();
            print('✅ Matrix logout completed');
            
            print('✅ Logout completed successfully!');
            return true;
          },
        );
        if (context.mounted) {
          context.go('/home');
        }
      } catch (e) {
        if (context.mounted) {
          context.go('/home');
        }
      }
    }
  }
}
