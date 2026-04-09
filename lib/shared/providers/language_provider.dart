import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Country {
  final String name;
  final String code;
  final String flag;
  final String languageName;

  Country({
    required this.name,
    required this.code,
    required this.flag,
    required this.languageName,
  });
}

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en'); // Default English
  String _currentCountryCode = 'US';
  Country? _selectedCountry;

  Locale get currentLocale => _currentLocale;
  String get currentCountryCode => _currentCountryCode;
  Country? get selectedCountry => _selectedCountry;

  LanguageProvider() {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('app_locale') ?? 'en';
    final savedCountryCode = prefs.getString('app_country_code') ?? 'US';
    print(
        '🔍 LanguageProvider _loadSavedLanguage: $savedLanguage, country: $savedCountryCode',);

    // Handle country-specific locales
    if (savedLanguage.contains('_')) {
      final parts = savedLanguage.split('_');
      _currentLocale = Locale(parts[0], parts[1]);
    } else {
      _currentLocale = Locale(savedLanguage);
    }

    _currentCountryCode = savedCountryCode;
    notifyListeners();
  }

  void setSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void updateSelectedCountryLanguage(String languageName) {
    if (_selectedCountry != null) {
      _selectedCountry = Country(
        name: _selectedCountry!.name,
        code: _selectedCountry!.code,
        flag: _selectedCountry!.flag,
        languageName: languageName,
      );
      notifyListeners();
    }
  }

  Future<void> changeLanguage(String languageCode,
      [String? countryCode,]) async {
    String localeString;
    var newCountryCode = countryCode ?? 'US';
    print(
        '🌎 Changing to country-specific languageCode: $languageCode for country code: $newCountryCode',);
    // Create country-specific locale for Spanish countries
    if (languageCode == 'es') {
      switch (countryCode) {
        case 'MEX':
          localeString = 'es_MX';
          break;
        case 'COL':
          localeString = 'es_CO';
          break;
        case 'ESP':
        default:
          localeString = 'es';
          newCountryCode = countryCode ?? 'ESP';
          break;
      }
      print(
          '🌎 Changing to country-specific locale: $localeString for country code: $newCountryCode',);
    } else {
      localeString = languageCode;
    }

    final newLocale = localeString.contains('_')
        ? Locale(languageCode, localeString.split('_')[1])
        : Locale(languageCode);

    if (_currentLocale != newLocale || _currentCountryCode != newCountryCode) {
      _currentLocale = newLocale;
      _currentCountryCode = newCountryCode;

      // Save to preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('app_locale', localeString);
      await prefs.setString('app_country_code', _currentCountryCode);
      print('💾 Language saved: $localeString, country: $_currentCountryCode');

      notifyListeners();
    }
  }
}
