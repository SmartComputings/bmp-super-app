import 'package:flutter/material.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/voip/services/network_stats_service.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';

/// Widget showing bandwidth usage (upload/download)
class BandwidthMonitorWidget extends StatelessWidget {
  const BandwidthMonitorWidget({
    required this.stats,
    this.showDetailed = false,
    super.key,
  });

  final NetworkStats stats;
  final bool showDetailed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.percentWidth * 2.5,
        vertical: context.percentHeight * 0.75,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
        borderRadius: BorderRadius.circular(context.percentWidth * 2),
      ),
      child: showDetailed ? _buildDetailedView(context) : _buildCompactView(context),
    );
  }

  Widget _buildCompactView(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Upload
        Icon(
          Icons.arrow_upward,
          color: Colors.white.withAlpha(200),
          size: context.percentWidth * 3.5,
        ),
        SizedBox(width: context.percentWidth * 1),
        Text(
          _formatBandwidth(stats.uploadBandwidth),
          style: TextStyle(
            color: Colors.white,
            fontSize: context.percentWidth * 3,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: context.percentWidth * 2.5),
        // Download
        Icon(
          Icons.arrow_downward,
          color: Colors.white.withAlpha(200),
          size: context.percentWidth * 3.5,
        ),
        SizedBox(width: context.percentWidth * 1),
        Text(
          _formatBandwidth(stats.downloadBandwidth),
          style: TextStyle(
            color: Colors.white,
            fontSize: context.percentWidth * 3,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailedView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Upload row
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_upward,
              color: const Color(0xFF64DD17),
              size: context.percentWidth * 3.5,
            ),
            SizedBox(width: context.percentWidth * 1.5),
            Text(
              '${L10n.of(context).uploadSpeedLabel}: ${_formatBandwidth(stats.uploadBandwidth)}',
              style: TextStyle(
                color: Colors.white,
                fontSize: context.percentWidth * 3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: context.percentHeight * 0.5),
        // Download row
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_downward,
              color: const Color(0xFF00C853),
              size: context.percentWidth * 3.5,
            ),
            SizedBox(width: context.percentWidth * 1.5),
            Text(
              '${L10n.of(context).downloadSpeedLabel}: ${_formatBandwidth(stats.downloadBandwidth)}',
              style: TextStyle(
                color: Colors.white,
                fontSize: context.percentWidth * 3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: context.percentHeight * 0.5),
        // Additional stats
        Text(
          'Loss: ${stats.packetLoss.toStringAsFixed(1)}% | '
          'RTT: ${stats.roundTripTime.toStringAsFixed(0)}ms',
          style: TextStyle(
            color: Colors.white.withAlpha(180),
            fontSize: context.percentWidth * 2.5,
          ),
        ),
      ],
    );
  }

  String _formatBandwidth(double kbps) {
    if (kbps < 1) {
      return '${(kbps * 1000).toStringAsFixed(0)} bps';
    } else if (kbps < 1000) {
      return '${kbps.toStringAsFixed(1)} Kbps';
    } else {
      final mbps = kbps / 1000;
      return '${mbps.toStringAsFixed(2)} Mbps';
    }
  }
}
