import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../shared/utils/app_loading_widget.dart';
import '../chat_list.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final ChatListController? controller;
  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;
  final ThemeData theme;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final bool isSearching;
  final String searchText;

  SearchBarDelegate({
    this.controller,
    this.searchController,
    this.searchFocusNode,
    required this.theme,
    this.onChanged,
    this.onClear,
    this.isSearching = false,
    this.searchText = '',
  });

  @override
  double get minExtent => 72.0;

  @override
  double get maxExtent => 72.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final effectiveController = searchController ?? controller?.searchController;
    final effectiveFocusNode = searchFocusNode ?? controller?.searchFocusNode;
    final effectiveOnChanged = onChanged ?? (text) => controller?.onSearchEnter(text, globalSearch: true);
    final effectiveOnClear = onClear ?? controller?.clearSearch;
    final effectiveIsSearching = controller?.isSearching ?? isSearching;
    final effectiveSearchText = effectiveController?.text ?? searchText;

    return TextField(
      controller: effectiveController,
      focusNode: effectiveFocusNode,
      textInputAction: TextInputAction.search,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
        height: 1.2,
      ),
      onChanged: effectiveOnChanged,
      onTap: () {
        if (controller != null && !controller!.isSearchMode) {
          controller!.startSearch();
        }
      },
      decoration: InputDecoration(
        filled: true,
        // fillColor: const Color(0xff05092680).withOpacity(0.8),
        fillColor: AppColors.splashBg.withValues(alpha: 0.5),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(25),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        hintText: L10n.of(context).search,
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.64),
          fontSize: 14,
          fontFamily: 'Plus Jakarta Sans',
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Colors.white,
          size: 18,
        ),
        suffixIcon: effectiveSearchText.isNotEmpty
            ? effectiveIsSearching
            ? const Padding(
          padding: EdgeInsets.all(12.0),
          child: AppLoadingWidget(),
        )
            : IconButton(
          icon: Icon(
            Icons.clear_rounded,
            color: Colors.white.withOpacity(0.7),
            size: 18,
          ),
          onPressed: effectiveOnClear,
          splashRadius: 18,
        )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
