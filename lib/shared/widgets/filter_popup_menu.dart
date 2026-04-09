import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/features/chat/chat_list/chat_list.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:flutter/material.dart';

class FilterItem {
  final ActiveFilter filter;
  final String title;

  const FilterItem(this.filter, this.title);
}

class FilterPopupMenu extends StatelessWidget {
  final ActiveFilter activeFilter;
  final Function(ActiveFilter) onSelected;
  final List<FilterItem> items;
  final String filterLabel;
  final String title;

  const FilterPopupMenu({
    super.key,
    required this.activeFilter,
    required this.onSelected,
    required this.items,
    required this.filterLabel,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.whiteSky,
            fontSize: 16,
            fontFamily: 'Neometric',
            fontWeight: FontWeight.w600,
          ),
        ),
        PopupMenuButton<ActiveFilter>(
          tooltip: 'Show Filters',
          color: AppColors.chatSearchHeaderBg,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          position: PopupMenuPosition.under,
          offset: const Offset(0, 8),
          onSelected: onSelected,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageAssets.chatDetailsFilter,
                width: 16,
                height: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 6),
              Text(
                filterLabel,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          itemBuilder: (context) => items
              .map(
                (item) => _buildPopupMenuItem(context, item.filter, item.title),
              )
              .toList(),
        ),
      ],
    );
  }

  PopupMenuItem<ActiveFilter> _buildPopupMenuItem(
    BuildContext context,
    ActiveFilter filter,
    String title,
  ) {
    final isSelected = activeFilter == filter;
    return PopupMenuItem(
      value: filter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.onBordingButtonColor
                    : Colors.transparent,
                border:
                    Border.all(color: AppColors.onBordingButtonColor, width: 1),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: AppColors.chatSearchHeaderBg,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? AppColors.onBordingButtonColor
                    : AppColors.whiteSky,
                fontSize: isSelected ? 12 : 14,
                fontFamily: isSelected ? 'Work Sans' : 'Plus Jakarta Sans',
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
