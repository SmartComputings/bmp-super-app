import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import '../../../../core/config/app_config.dart';

class ReplyContent extends StatelessWidget {
  final Event replyEvent;
  final bool ownMessage;
  final Timeline? timeline;

  const ReplyContent(
    this.replyEvent, {
    this.ownMessage = false,
    super.key,
    this.timeline,
  });

  static const BorderRadius borderRadius = BorderRadius.only(
    topRight: Radius.circular(AppConfig.borderRadius / 2),
    bottomRight: Radius.circular(AppConfig.borderRadius / 2),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final timeline = this.timeline;
    final displayEvent =
        timeline != null ? replyEvent.getDisplayEvent(timeline) : replyEvent;
    final fontSize = AppConfig.messageFontSize * AppConfig.fontSizeFactor;
    final color = theme.brightness == Brightness.dark
        ? theme.colorScheme.onTertiaryContainer
        : ownMessage
            ? theme.colorScheme.tertiaryContainer
            : theme.colorScheme.tertiary;

    return Container(
      height: context.screenHeight*0.08,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x7F050926),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 4,
            height: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white.withAlpha(184),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildMediaPreview(displayEvent),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<User?>(
                          initialData: displayEvent.senderFromMemoryOrFallback,
                          future: displayEvent.fetchSenderUser(),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data?.calcDisplayname() ?? displayEvent.senderFromMemoryOrFallback.calcDisplayname(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white.withAlpha(184),
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                
                              ),
                            );
                          },
                        ),

                        Text(
                          displayEvent.calcLocalizedBodyFallback(
                            MatrixLocals(L10n.of(context)),
                            withSenderNamePrefix: false,
                            hideReply: true,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white.withAlpha(184),
                            fontSize: 12,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaPreview(Event event) {
    final messageType = event.messageType;

    if (messageType == MessageTypes.Image) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: MxcImage(
            event: event,
            isThumbnail: true,
            width: 32,
            height: 32,
            fit: BoxFit.cover,
            placeholder: (_) => const Icon(Icons.image, size: 16, color: Colors.white54),
          ),
        ),
      );
    }

    if (messageType == MessageTypes.Video) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: const Icon(Icons.videocam, size: 16, color: Colors.white54),
      );
    }

    if (messageType == MessageTypes.Location) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: const Icon(Icons.location_on, size: 16, color: Colors.white54),
      );
    }

    // Default fallback - show user avatar for text messages
    return Container(
      width: 32,
      height: 32,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: FutureBuilder<User?>(
        initialData: event.senderFromMemoryOrFallback,
        future: event.fetchSenderUser(),
        builder: (context, snapshot) {
          final user = snapshot.data ?? event.senderFromMemoryOrFallback;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              image: user.avatarUrl != null
                  ? DecorationImage(
                      image: NetworkImage(user.avatarUrl.toString()),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: user.avatarUrl == null
                ? const Icon(Icons.person, color: Colors.white, size: 16)
                : null,
          );
        },
      ),
    );
  }
}
