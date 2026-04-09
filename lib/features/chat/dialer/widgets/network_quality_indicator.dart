import 'package:flutter/material.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/voip/services/network_quality_service.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';

class NetworkQualityIndicator extends StatelessWidget {
  const NetworkQualityIndicator({
    required this.quality,
    super.key,
  });

  final NetworkQuality quality;

  @override
  Widget build(BuildContext context) {
    // Don't show indicator for excellent or good quality
    if (quality == NetworkQuality.excellent || quality == NetworkQuality.good) {
      return const SizedBox.shrink();
    }
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.percentWidth * 2,
        vertical: context.percentHeight * 0.5,
      ),
      decoration: BoxDecoration(
        color: _getColor().withAlpha(200),
        borderRadius: BorderRadius.circular(context.percentWidth * 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getIcon(),
            color: Colors.white,
            size: context.percentWidth * 3.5,
          ),
          SizedBox(width: context.percentWidth * 1),
          Text(
            _getLabel(context),
            style: TextStyle(
              color: Colors.white,
              fontSize: context.percentWidth * 3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    switch (quality) {
      case NetworkQuality.excellent:
        return Colors.green;
      case NetworkQuality.good:
        return Colors.lightGreen;
      case NetworkQuality.fair:
        return Colors.orange;
      case NetworkQuality.poor:
        return Colors.red;
      case NetworkQuality.disconnected:
        return Colors.grey;
    }
  }

  IconData _getIcon() {
    switch (quality) {
      case NetworkQuality.excellent:
        return Icons.signal_cellular_alt;
      case NetworkQuality.good:
        return Icons.signal_cellular_alt_2_bar;
      case NetworkQuality.fair:
        return Icons.signal_cellular_alt_1_bar;
      case NetworkQuality.poor:
      case NetworkQuality.disconnected:
        return Icons.signal_cellular_connected_no_internet_0_bar;
    }
  }

  String _getLabel(BuildContext context) {
    switch (quality) {
      case NetworkQuality.excellent:
        return L10n.of(context).networkQualityExcellent;
      case NetworkQuality.good:
        return L10n.of(context).networkQualityGood;
      case NetworkQuality.fair:
        return L10n.of(context).networkQualityFair;
      case NetworkQuality.poor:
        return L10n.of(context).networkQualityPoor;
      case NetworkQuality.disconnected:
        return L10n.of(context).networkQualityDisconnected;
    }
  }
}
