import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/dialer/providers/call_history_provider.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:matrix/matrix.dart';

class CallTileWidget extends StatelessWidget {
  final CallHistoryEntry call;

  const CallTileWidget({required this.call, super.key});

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      height: 76,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2166),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push('/mainMenuScreen/rooms/${call.roomId}'),
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Avatar(
                  mxContent: call.avatarUrl,
                  name: call.displayName,
                  size: 48,
                  client: client,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        call.displayName,
                        style: const TextStyle(
                          color: Color(0xFFF3F7F8),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            call.isOutgoing
                                ? Icons.arrow_upward_rounded
                                : Icons.arrow_downward_rounded,
                            color: call.status == CallHistoryStatus.missed
                                ? const Color(0xFFF63D3D)
                                : const Color(0xFF17A219),
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatCallDateTime(context, call.timestamp),
                            style: const TextStyle(
                              color: Color(0xFFC6D4DB),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Work Sans',
                            ),
                          ),
                          if (call.duration != null &&
                              call.duration!.inSeconds > 0) ...[
                            const SizedBox(width: 4),
                            Text(
                              '(${_formatCallDuration(context, call.duration!)})',
                              style: const TextStyle(
                                color: Color(0xFFC6D4DB),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Work Sans',
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () => _initiateCall(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      call.isVideo ? ImageAssets.icVideoCall : ImageAssets.icCall,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatCallDateTime(BuildContext context, DateTime dateTime) {
    final dateStr = _formatCallDate(context, dateTime);
    final timeStr = DateFormat('h:mm a').format(dateTime);
    return '$dateStr, $timeStr';
  }

  void _initiateCall(BuildContext context) async {
    try {
      final client = Matrix.of(context).client;
      final room = client.getRoomById(call.roomId);
      
      if (room == null) return;
      
      final voipManager = Matrix.of(context).voipPlugin;
      if (voipManager == null) return;
      
      await voipManager.startCall(
        room,
        call.isVideo ? CallType.kVideo : CallType.kVoice,
      );
    } catch (e) {
      // Silently fail - error will be handled by voip manager
    }
  }

  String _formatCallDate(BuildContext context, DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final callDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (callDate == today) {
      return L10n.of(context).today;
    } else if (callDate == today.subtract(const Duration(days: 1))) {
      return L10n.of(context).yesterday;
    } else {
      return DateFormat('d MMM yyyy').format(dateTime);
    }
  }

  String _formatCallDuration(BuildContext context, Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    if (minutes > 0) {
      return L10n.of(context).durationMinutes(minutes);
    }
    return '${seconds}s';
  }
}
