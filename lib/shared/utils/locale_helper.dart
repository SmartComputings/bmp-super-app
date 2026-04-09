// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LocaleHelper {
//   static const String _localeKey = 'app_locale';

//   /// Save current locale to SharedPreferences
//   static Future<void> saveLocale(Locale locale) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       String localeCode = locale.languageCode;
      
//       // Handle special cases
//       if (locale.countryCode != null && locale.countryCode!.isNotEmpty) {
//         if (locale.languageCode == 'pt' && locale.countryCode == 'BR') {
//           localeCode = 'pt-BR';
//         } else if (locale.languageCode == 'pt' && locale.countryCode == 'PT') {
//           localeCode = 'pt-PT';
//         }
//       }
      
//       if (locale.scriptCode == 'Hant') {
//         if (locale.languageCode == 'zh') {
//           localeCode = 'zh-Hant';
//         } else if (locale.languageCode == 'yue') {
//           localeCode = 'yue-Hant';
//         }
//       }
      
//       await prefs.setString(_localeKey, localeCode);
//       print('✅ Locale saved: $localeCode (from ${locale.toString()})');
//     } catch (e) {
//       print('❌ Failed to save locale: $e');
//     }
//   }

//   /// Get saved locale from SharedPreferences
//   static Future<String> getLocale() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getString(_localeKey) ?? 'en';
//     } catch (e) {
//       return 'en';
//     }
//   }
// }
