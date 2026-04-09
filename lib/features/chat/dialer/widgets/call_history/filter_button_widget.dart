import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/dialer/widgets/call_history/calls_history_screen.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  final CallFilter selectedFilter;
  final Function(CallFilter) onFilterSelected;

  const FilterButtonWidget({
    required this.selectedFilter,
    required this.onFilterSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CallFilter>(
      color: const Color(0xF2252844),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.percentWidth * 4.5),
      ),
      position: PopupMenuPosition.under,
      offset: Offset(context.percentWidth * 5, context.percentHeight * 1),
      onSelected: onFilterSelected,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            ImageAssets.chatDetailsFilter,
            width: context.percentWidth * 4,
            height: context.percentWidth * 4,
            color: Colors.white,
          ),
          SizedBox(width: context.percentWidth * 1.5),
          Text(
            L10n.of(context).filter,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.percentWidth * 3.5,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      itemBuilder: (context) => [
        _buildPopupMenuItem(
          context,
          CallFilter.allCalls,
          L10n.of(context).allCalls,
        ),
        _buildPopupMenuItem(
          context,
          CallFilter.missedCalls,
          L10n.of(context).missedCalls
        ),
        _buildPopupMenuItem(context, CallFilter.outgoing, L10n.of(context).outgoing),
      ],
    );
  }

  PopupMenuItem<CallFilter> _buildPopupMenuItem(
    BuildContext context,
    CallFilter filter,
    String title,
  ) {
    final isSelected = selectedFilter == filter;
    return PopupMenuItem(
      value: filter,
      child: Row(
        children: [
          Container(
            width: context.percentWidth * 5,
            height: context.percentWidth * 5,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF3976F8) : Colors.transparent,
              border: isSelected
                  ? null
                  : Border.all(
                      color: Colors.white,
                      width: context.percentWidth * 0.5,
                    ),
              shape: BoxShape.circle,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: context.percentWidth * 2,
                      height: context.percentWidth * 2,
                      decoration: const BoxDecoration(
                        color: const Color(0xF2252844),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
          SizedBox(width: context.percentWidth * 3),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? const Color(0xFF3976F8) : Colors.white,
              fontSize: context.percentWidth * 3.2,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
