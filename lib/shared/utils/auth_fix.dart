import 'package:shared_preferences/shared_preferences.dart';
import 'package:matrix/matrix.dart';
import 'package:flutter/material.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/data/services/security_shared_service.dart';
// SecurityService removed


class AuthFix {
  static Future<bool> fixAuthenticationState(BuildContext context, Client client) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      print('🔍 ${L10n.of(context).authFixCheckingClient} - ${L10n.of(context).isLogged}: ${client.isLogged()}, ${L10n.of(context).userID}: ${client.userID}');
      
      // Check if user is logged in
      if (client.isLogged() && client.userID != null) {
        final storedMatrixId = prefs.getString('matrix_id');
        print('🔍 ${L10n.of(context).authFixStoredMatrixId}: $storedMatrixId');
        
        // Always fix if matrix_id is missing or different
        if (storedMatrixId == null || storedMatrixId != client.userID) {
          print('🔧 ${L10n.of(context).authFixFixingMatrixId} $storedMatrixId ${L10n.of(context).to} ${client.userID}');
          
          // Store the correct matrix_id
          await prefs.setString('matrix_id', client.userID!);
          
          // Generate security tokens
          final username = client.userID!.replaceFirst('@', '').split(':')[0];
          print('🔧 ${L10n.of(context).authFixGeneratingTokens}: $username');
          
          final tokenResult = await SecuritySharedService.generateToken(username);
          
          if (tokenResult.success && tokenResult.data != null) {
            await prefs.setString('security_token', tokenResult.data!['token']);
            print('✅ ${L10n.of(context).authFixJwtTokenGenerated}');
            
            final csrfResult = await SecuritySharedService.getCsrfToken(username);
            if (csrfResult.success && csrfResult.data != null) {
              await prefs.setString('csrf_token', csrfResult.data!['csrfToken']);
              print('✅ ${L10n.of(context).authFixCsrfTokenGenerated}');
            } else {
              print('  ${L10n.of(context).authFixCsrfTokenFailed}: ${csrfResult.message}');
            }
          } else {
            print('  ${L10n.of(context).authFixJwtTokenFailed}: ${tokenResult.message}');
          }
          
          return true;
        } else {
          print('✅ ${L10n.of(context).authFixMatrixIdCorrect}');
        }
      } else {
        print('⚠️ ${L10n.of(context).authFixClientNotLoggedIn}');
      }
      
      return false;
    } catch (e) {
      print('  ${L10n.of(context).authFixException}: $e');
      return false;
    }
  }
}