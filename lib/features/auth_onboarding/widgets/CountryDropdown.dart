import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/localization/l10n.dart';
import '../../../shared/providers/language_provider.dart';

class CountryDropdown extends StatefulWidget {
  final Function(Country)? onChanged;

  const CountryDropdown({super.key, this.onChanged});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final ScrollController _scrollController = ScrollController();
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<LanguageProvider>(context, listen: false);
      if (provider.selectedCountry == null) {
        provider.setSelectedCountry(
          Country(
            name: 'US',
            code: 'USA',
            flag: '🇺🇸',
            languageName: 'English',
          ),
        );
      }
      _loadSavedCountry();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  Future<void> _loadSavedCountry() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('app_locale') ?? 'en';
    final savedCountryCode = prefs.getString('app_country_code') ?? 'USA';
    final provider = Provider.of<LanguageProvider>(context, listen: false);

    final countries = _getCountries(context);

    // Find country by saved country code
    Country country;
    try {
      country = countries.firstWhere((c) => c.code == savedCountryCode);
    } catch (e) {
      // Fallback logic based on saved language
      if (savedLanguage.startsWith('es')) {
        if (savedLanguage == 'es_MX') {
          country = countries.firstWhere((c) => c.code == 'MEX');
        } else if (savedLanguage == 'es_CO') {
          country = countries.firstWhere((c) => c.code == 'COL');
        } else {
          country = countries.firstWhere((c) => c.code == 'ESP');
        }
      } else {
        country = countries.firstWhere((c) => c.code == 'USA');
      }
    }

    provider.setSelectedCountry(country);
  }

  List<Country> _getCountries(BuildContext context) {
    return [
      Country(
        name: 'US',
        code: 'USA',
        flag: '🇺🇸',
        languageName: L10n.of(context).langEnglish,
      ),
      Country(
        name: "Spain",
        code: 'ESP',
        flag: '🇪🇸',
        languageName: L10n.of(context).langSpanish,
      ),
      Country(
        name: "Colombia",
        code: 'COL',
        flag: '🇨🇴',
        languageName: L10n.of(context).langSpanish,
      ),
      Country(
        name: "Mexico",
        code: 'MEX',
        flag: '🇲🇽',
        languageName: L10n.of(context).langSpanish,
      ),
    ];
  }

  void _toggleDropdown() {
    if (isExpanded) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() => isExpanded = false);
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      setState(() => isExpanded = true);
    }
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate position and available space
    final dropdownTop = offset.dy + size.height + 5;
    final bottomPadding = MediaQuery.of(context).padding.bottom + 20; // Safe area + margin
    final availableHeight = screenHeight - dropdownTop - bottomPadding;
    
    // Ensure dropdown doesn't exceed available space
    final maxDropdownHeight = availableHeight.clamp(100.0, screenHeight * 0.4);

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: dropdownTop,
                width: screenWidth / 2,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F2166),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF3976F8), width: 1),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: maxDropdownHeight, // Dynamic max height based on available space
                      ),
                      child: RawScrollbar(
                        controller: _scrollController,
                        thumbVisibility: true,
                        thickness: 4,
                        radius: const Radius.circular(10),
                        thumbColor: const Color(0xFF3976F8),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: _getCountries(context).map((country) {
                              return InkWell(
                                onTap: () async {
                                  final provider =
                                      Provider.of<LanguageProvider>(context, listen: false);
                                  provider.setSelectedCountry(country);

                                  // Save country selection and change language if needed
                                  final prefs = await SharedPreferences.getInstance();
                                  await prefs.setString('app_country_code', country.code);
                                  print('Country code saved: ${country.code}');

                                  // Handle language changes based on country
                                  switch (country.code) {
                                    case 'ESP':
                                      await provider.changeLanguage('es', 'ESP');
                                      break;
                                    case 'COL':
                                      await provider.changeLanguage('es', 'COL');
                                      break;
                                    case 'MEX':
                                      await provider.changeLanguage('es', 'MEX');
                                      break;
                                    case 'USA':
                                    default:
                                      await provider.changeLanguage('en', 'USA');
                                      break;
                                  }

                                  widget.onChanged?.call(country);
                                  _toggleDropdown();
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        country.flag,
                                        style: TextStyle(fontSize: context.screenHeight * 0.03),
                                      ),
                                      SizedBox(width: context.screenWidth * 0.03),
                                      Expanded(
                                        child: Text(
                                          '${country.languageName} (${country.name})',
                                          style: TextStyle(
                                            color: Color(0xFFD2D4E5),
                                            fontSize: context.screenWidth * 0.026,
                                            fontFamily: 'Work Sans',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
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

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, provider, child) {
        final countries = _getCountries(context);
        final currentCountry = provider.selectedCountry != null
            ? countries.firstWhere(
                (c) => c.code == provider.selectedCountry!.code,
                orElse: () => countries.first,
              )
            : countries.first;

        if (provider.selectedCountry?.languageName !=
            currentCountry.languageName) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            provider.setSelectedCountry(currentCountry);
          });
        }

        return CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: _toggleDropdown,
            child: Row(
              children: [
                SizedBox(
                  width: context.screenWidth*0.08,
                  height:context.screenWidth*0.08,
                  child: Center(
                    child: Text(
                      currentCountry.flag,
                      style:  TextStyle(fontSize: context.screenWidth * 0.045),
                    ),
                  ),
                ),
                SizedBox(width: context.screenWidth*0.01),
                Expanded(
                  child: Text(
                    '${currentCountry.languageName} (${currentCountry.name})',
                    style:  TextStyle(
                      color: Color(0xFFD2D4E5),
                 fontSize: context.screenWidth * 0.036,
                      fontFamily: 'Work Sans',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 0),
                Container(
                   width: context.screenWidth*0.05,
                  height:context.screenWidth*0.05,
                  decoration: ShapeDecoration(
                    color: const Color(0x7F050926),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: const Color(0xFFD2D4E5),
                    size: context.screenWidth*0.03,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
