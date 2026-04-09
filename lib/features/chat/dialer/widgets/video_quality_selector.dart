import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/voip/services/video_quality_service.dart';
import 'package:bmp/features/chat/dialer/providers/video_quality_selector_provider.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';

/// Video quality selector widget
class VideoQualitySelector extends StatelessWidget {
  const VideoQualitySelector({
    required this.currentQuality,
    required this.onQualityChanged,
    this.isExpanded = false,
    super.key,
  });

  final VideoQuality currentQuality;
  final ValueChanged<VideoQuality> onQualityChanged;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.percentWidth * 2,
        vertical: context.percentHeight * 0.5,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
        borderRadius: BorderRadius.circular(context.percentWidth * 2),
      ),
      child: isExpanded ? _buildExpandedView(context) : _buildCompactView(context),
    );
  }

  Widget _buildCompactView(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.high_quality,
          color: Colors.white.withAlpha(200),
          size: context.percentWidth * 3.5,
        ),
        SizedBox(width: context.percentWidth * 1),
        Text(
          currentQuality.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.percentWidth * 3,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          L10n.of(context).videoQuality,
          style: TextStyle(
            color: Colors.white.withAlpha(180),
            fontSize: context.percentWidth * 2.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: context.percentHeight * 0.5),
        Wrap(
          spacing: context.percentWidth * 1.5,
          children: VideoQuality.values.map((quality) {
            final isSelected = quality == currentQuality;
            return GestureDetector(
              onTap: () => onQualityChanged(quality),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.percentWidth * 2,
                  vertical: context.percentHeight * 0.5,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF3976F8)
                      : Colors.white.withAlpha(30),
                  borderRadius: BorderRadius.circular(context.percentWidth * 1.5),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF3976F8)
                        : Colors.white.withAlpha(60),
                    width: 1,
                  ),
                ),
                child: Text(
                  quality.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.percentWidth * 2.5,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

/// Video quality quick selector (dropdown style)
/// Refactored to use VideoQualitySelectorProvider - no setState
class VideoQualityQuickSelector extends StatefulWidget {
  const VideoQualityQuickSelector({
    required this.currentQuality,
    required this.onQualityChanged,
    super.key,
  });

  final VideoQuality currentQuality;
  final ValueChanged<VideoQuality> onQualityChanged;

  @override
  State<VideoQualityQuickSelector> createState() =>
      _VideoQualityQuickSelectorState();
}

class _VideoQualityQuickSelectorState extends State<VideoQualityQuickSelector> {
  late VideoQualitySelectorProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = VideoQualitySelectorProvider();
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Consumer<VideoQualitySelectorProvider>(
        builder: (context, provider, child) {
          return GestureDetector(
            onTap: () => provider.toggle(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: context.percentWidth * 2.5,
                vertical: context.percentHeight * 0.75,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
                borderRadius: BorderRadius.circular(context.percentWidth * 2),
              ),
              child: provider.isExpanded
                  ? _buildExpanded(context, provider)
                  : _buildCollapsed(context, provider),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCollapsed(BuildContext context, VideoQualitySelectorProvider provider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.hd,
          color: _getQualityColor(),
          size: context.percentWidth * 3.5,
        ),
        SizedBox(width: context.percentWidth * 1),
        Text(
          widget.currentQuality.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.percentWidth * 3,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: context.percentWidth * 0.5),
        Icon(
          provider.isExpanded ? Icons.expand_less : Icons.expand_more,
          color: Colors.white.withAlpha(180),
          size: context.percentWidth * 3.5,
        ),
      ],
    );
  }

  Widget _buildExpanded(BuildContext context, VideoQualitySelectorProvider provider) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: VideoQuality.values.map((quality) {
        final isSelected = quality == widget.currentQuality;
        return GestureDetector(
          onTap: () {
            widget.onQualityChanged(quality);
            provider.collapse();
          },
          child: Container(
            width: context.percentWidth * 22,
            padding: EdgeInsets.symmetric(
              vertical: context.percentHeight * 0.75,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withAlpha(20)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(context.percentWidth * 1),
            ),
            child: Row(
              children: [
                if (isSelected)
                  Icon(
                    Icons.check,
                    color: const Color(0xFF00C853),
                    size: context.percentWidth * 3.5,
                  )
                else
                  SizedBox(width: context.percentWidth * 3.5),
                SizedBox(width: context.percentWidth * 1),
                Text(
                  quality.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.percentWidth * 3,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _getQualityColor() {
    switch (widget.currentQuality) {
      case VideoQuality.auto:
        return const Color(0xFF3976F8);
      case VideoQuality.high:
        return const Color(0xFF00C853);
      case VideoQuality.medium:
        return const Color(0xFFFFD600);
      case VideoQuality.low:
        return const Color(0xFFFF3D00);
    }
  }
}

