import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart';
import 'package:bmp/features/chat/chat_list/widget/SearchBarDelegate.dart';
import 'package:bmp/features/chat/dialer/providers/call_history_provider.dart';
import 'package:bmp/features/chat/dialer/widgets/call_history/call_tile_widget.dart';
import 'package:bmp/features/chat/dialer/widgets/call_history/empty_calls_widget.dart';
import 'package:bmp/features/chat/dialer/widgets/call_history/filter_button_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum CallFilter { allCalls, missedCalls, outgoing }

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late CallHistoryProvider _callHistoryProvider;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _callHistoryProvider = CallHistoryProvider(
        client: Matrix.of(context).client,
      );
      _callHistoryProvider.loadCallHistory();
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  List<CallHistoryEntry> get _filteredCalls {
    return _callHistoryProvider.getFilteredCalls(
      missedOnly: _callHistoryProvider.selectedFilter == CallFilter.missedCalls,
      outgoingOnly: _callHistoryProvider.selectedFilter == CallFilter.outgoing,
      searchQuery: _searchController.text,
    );
  }

  String _getFilterTitle() {
    switch (_callHistoryProvider.selectedFilter) {
      case CallFilter.allCalls:
        return L10n.of(context).allCalls;
      case CallFilter.missedCalls:
        return L10n.of(context).missedCalls;
      case CallFilter.outgoing:
        return L10n.of(context).outgoingCalls;
    }
  }

  @override
  Widget build(BuildContext context) {
    final calls = _filteredCalls;
    final theme = Theme.of(context);

    return KeyboardDismissiblePopScope(
      focusNodes: [_searchFocusNode],
      child: ChangeNotifierProvider.value(
        value: _callHistoryProvider,
        child: Stack(
          children: [
            if (calls.isEmpty)
              Positioned.fill(
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    ImageAssets.chatBg,
                    fit: BoxFit.cover,
                    color: const Color(0xFF5F18BF),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: context.percentHeight * 1.2),
                    child: DynamicHeader(
                      child: Padding(
                        padding: EdgeInsets.all(context.percentWidth * 2),
                        child: SearchBarDelegate(
                          searchController: _searchController,
                          searchFocusNode: _searchFocusNode,
                          theme: theme,
                          onChanged: (text) => setState(() {}),
                          onClear: () {
                            _searchController.clear();
                            setState(() {});
                          },
                          searchText: _searchController.text,
                        ).build(context, 0, false),
                      ),
                    ),
                  ),
                  Consumer<CallHistoryProvider>(
                    builder: (context, provider, child) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                          context.percentWidth * 7,
                          context.percentHeight * 2.7,
                          context.percentWidth * 7,
                          context.percentHeight * 1.5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _getFilterTitle(),
                              style: TextStyle(
                                color: const Color(0xFFF3F3F3),
                                fontSize: context.percentWidth * 4,
                                fontFamily: 'Neometric',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            FilterButtonWidget(
                              selectedFilter: provider.selectedFilter,
                              onFilterSelected: (filter) =>
                                  provider.setFilter(filter),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                  Expanded(
                    child: Consumer<CallHistoryProvider>(
                      builder: (context, provider, child) {
                        if (provider.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }

                        final calls = _filteredCalls;

                        if (calls.isEmpty) {
                          return const EmptyCallsWidget();
                        }

                        return RefreshIndicator(
                          onRefresh: provider.refresh,
                          color: const Color(0xFF3976F8),
                          child: ListView.builder(
                            padding: EdgeInsets.only(
                              bottom: context.percentHeight * 12,
                            ),
                            itemCount: calls.length,
                            itemBuilder: (context, index) {
                              return CallTileWidget(call: calls[index]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
