import 'dart:ui';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/models/models/country_model.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/attachment_bottom_sheet.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/image/assets/image_assets.dart';

class CountryPickerSheet extends StatefulWidget {
  final List<CountryModel> countries;
  final Function(CountryModel) onCountrySelected;
  final CountryModel? selectedCountry;

  const CountryPickerSheet({
    super.key,
    required this.countries,
    required this.onCountrySelected,
    this.selectedCountry,
  });

  @override
  State<CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<CountryPickerSheet> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  List<CountryModel> _filteredCountries = [];
  CountryModel? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _filteredCountries = List.from(widget.countries);
    _selectedCountry = widget.selectedCountry;
    _searchController.addListener(_onSearchChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Small delay to ensure ListView is fully laid out and scrollable
      Future.delayed(const Duration(milliseconds: 150), () {
        if (mounted) _scrollToSelectedCountry();
      });
    });
  }

  void _scrollToSelectedCountry() {
    if (_selectedCountry == null || !_scrollController.hasClients) return;

    final index =
        _filteredCountries.indexWhere((c) => c.code == _selectedCountry!.code);
    if (index == -1) return;

    // Calculate item height based on screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final estimatedItemHeight = screenHeight * 0.1; // 10% of screen height
    final targetOffset = index * estimatedItemHeight;
    final maxScroll = _scrollController.position.maxScrollExtent;

    _scrollController.animateTo(
      targetOffset.clamp(0.0, maxScroll),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = List.from(widget.countries);
      } else {
        _filteredCountries = widget.countries.where((c) {
          return c.name.toLowerCase().contains(query) ||
              c.dialCode.contains(query) ||
              c.code.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AttachmentBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  L10n.of(context).financeCountry,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.screenWidth * 0.08,
                    fontFamily: 'Neometric',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.005),
                Container(
                  width: context.screenWidth * 0.13,
                  height: context.screenHeight * 0.006,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.circular(context.screenWidth * 0.005),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.screenHeight * 0.025),
          Expanded(
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: context.percentWidth * 1),
              decoration: BoxDecoration(
                  color: const Color(0xFF6523c0),
                  borderRadius:
                      BorderRadius.circular(context.screenWidth * 0.05)),
              child: Column(
                children: [
                  SizedBox(height: context.screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.screenWidth * 0.05),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x7F1F252D),
                        borderRadius:
                            BorderRadius.circular(context.screenWidth * 0.075),
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _focusNode,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: context.screenWidth * 0.034),
                        decoration: InputDecoration(
                          hintText: L10n.of(context).financeCountry,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: context.screenWidth * 0.034,
                              fontWeight: FontWeight.w100),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(context.screenWidth * 0.04),
                            child: Image.asset(
                              ImageAssets.searchIcon,
                              width: context.screenWidth * 0.04,
                              height: context.screenWidth * 0.04,
                              fit: BoxFit.contain,
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: context.screenWidth * 0.14,
                            minHeight: context.screenWidth * 0.14,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.05,
                              vertical: context.screenHeight * 0.02),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.025),
                  Expanded(
                    child: _filteredCountries.isEmpty
                        ? Center(
                            child: Text(
                              'No countries found',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: context.screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            padding: EdgeInsets.symmetric(
                                horizontal: context.screenWidth * 0.05),
                            itemCount: _filteredCountries.length,
                            itemBuilder: (context, index) {
                              final country = _filteredCountries[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: context.screenHeight * 0.015),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedCountry = country;
                                    });
                                    widget.onCountrySelected(country);
                                    Navigator.pop(context, country);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.screenWidth * 0.05,
                                        vertical: context.screenHeight * 0.02),
                                    decoration: BoxDecoration(
                                      color: const Color(0xCC1B1C30),
                                      borderRadius: BorderRadius.circular(
                                          context.screenWidth * 0.06),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  context.screenWidth * 0.02,
                                              vertical:
                                                  context.screenHeight * 0.008),
                                          decoration: BoxDecoration(
                                            color: _selectedCountry?.code ==
                                                    country.code
                                                ? const Color(0xFF5A8FFF)
                                                : const Color(0xFF3976f8),
                                            borderRadius: BorderRadius.circular(
                                                context.screenWidth * 0.05),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width:
                                                    context.screenWidth * 0.052,
                                                height:
                                                    context.screenWidth * 0.052,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          context.screenWidth *
                                                              0.03),
                                                  child: CountryFlag
                                                      .fromCountryCode(
                                                          country.code),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: context.screenWidth *
                                                      0.02),
                                              Text(
                                                country.dialCode,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      context.screenWidth *
                                                          0.031,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width: context.screenWidth * 0.04),
                                        Expanded(
                                          child: Text(
                                            '${country.name} — ${country.code}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  context.screenWidth * 0.031,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: context.screenWidth * 0.057,
                                          height: context.screenWidth * 0.057,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _selectedCountry?.code ==
                                                    country.code
                                                ? Colors.blue
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: Colors.blue,
                                                width: context.screenWidth *
                                                    0.005),
                                          ),
                                          child: _selectedCountry?.code ==
                                                  country.code
                                              ? Icon(Icons.circle,
                                                  size: context.screenWidth *
                                                      0.02,
                                                  color:
                                                      const Color(0xFF6523c0))
                                              : null,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
