import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:flutter/material.dart';

class ChatSearchBar extends StatefulWidget {
  final Function(String)? onSearchChanged;
  final VoidCallback? onSearchStart;
  final VoidCallback? onSearchCancel;

  const ChatSearchBar({
    super.key,
    this.onSearchChanged,
    this.onSearchStart,
    this.onSearchCancel,
  });

  @override
  State<ChatSearchBar> createState() => _ChatSearchBarState();
}

class _ChatSearchBarState extends State<ChatSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearchMode = false;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {
      _isSearchMode = true;
    });
    _searchFocusNode.requestFocus();
    widget.onSearchStart?.call();
  }

  void _cancelSearch() {
    setState(() {
      _isSearchMode = false;
      _isSearching = false;
    });
    _searchController.clear();
    _searchFocusNode.unfocus();
    widget.onSearchCancel?.call();
  }

  void _onSearchChanged(String text) {
    setState(() {
      _isSearching = text.isNotEmpty;
    });
    widget.onSearchChanged?.call(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: _isSearchMode ? 8.0 : 12.0,
        bottom: 12.0,
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          height: 1.2,
        ),
        onChanged: _onSearchChanged,
        onTap: () {
          if (!_isSearchMode) {
            _startSearch();
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF2A2D5A).withOpacity(0.8),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF4A5BF6),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          prefixIcon: _isSearchMode
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _cancelSearch,
                  color: Colors.white.withOpacity(0.7),
                )
              : Icon(
                  Icons.search_rounded,
                  color: Colors.white.withOpacity(0.7),
                  size: 22,
                ),
          suffixIcon: _searchController.text.isNotEmpty
              ? _isSearching
                  ? const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: AppLoadingWidget(),
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.clear_rounded,
                        color: Colors.white.withOpacity(0.7),
                        size: 20,
                      ),
                      onPressed: _cancelSearch,
                      splashRadius: 20,
                    )
              : null,
        ),
      ),
    );
  }
}