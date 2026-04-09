import 'package:bmp/core/config/themes.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import 'chat.dart';

class ReplyDisplay extends StatelessWidget {
  final ChatController controller;
  const ReplyDisplay(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: FluffyThemes.animationDuration,
      curve: FluffyThemes.animationCurve,
      height: controller.editEvent != null || controller.replyEvent != null
          ? 70
          : 0,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color:  const Color(0xff262845).withValues(alpha: 0.5),
      ),
      child: controller.editEvent != null || controller.replyEvent != null
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 12),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color:  const Color(0xff050926).withValues(alpha: 0.5),
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
                                  color: const Color(0xFF6F8DA1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10,),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      _buildMediaPreview(controller.replyEvent),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (controller.replyEvent != null)
                                              FutureBuilder<User?>(
                                                future: controller.replyEvent!
                                                    .fetchSenderUser(),
                                                builder: (context, snapshot) {
                                                  final user = snapshot.data ??
                                                      controller.replyEvent!
                                                          .senderFromMemoryOrFallback;
                                                  return Text(
                                                    user.calcDisplayname(),
                                                    style: const TextStyle(
                                                      color: Color(0xFF6F8DA1),
                                                      fontSize: 10,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  );
                                                },
                                              ),
                                            Text(
                                              _getReplyText(
                                                  controller.replyEvent,
                                                  controller.editEvent,
                                                  context,),
                                              style: const TextStyle(
                                                color: Color(0xFF6F8DA1),
                                                fontSize: 10,
                                                fontFamily: 'Work Sans',
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
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
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 16,
                    child: Center(
                      child: IconButton(
                    
                        icon: const Icon(Icons.cancel_outlined, color: Colors.white),
                        onPressed: controller.cancelReplyEventAction,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildMediaPreview(Event? event) {
    if (event == null) return const SizedBox.shrink();

    final messageType = event.messageType;

    if (messageType == MessageTypes.Image) {
      return Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.only(right: 8),
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
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: [
              MxcImage(
                event: event,
                isThumbnail: true,
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
              
            ],
          ),
        ),
      );
    }

    if (messageType == MessageTypes.File || messageType == MessageTypes.Audio) {
      return Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFF6F8DA1).withOpacity(0.3),
        ),
        child: Icon(
          messageType == MessageTypes.Audio
              ? Icons.audiotrack
              : Icons.insert_drive_file,
          size: 16,
          color: Colors.white54,
        ),
      );
    }

    if (messageType == MessageTypes.Location) {
      return Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.red.withOpacity(0.3),
        ),
        child: const Icon(
          Icons.location_on,
          size: 16,
          color: Colors.white54,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  String _getReplyText(
      Event? replyEvent, Event? editEvent, BuildContext context,) {
    final event = replyEvent ?? editEvent;
    if (event == null) return '';

    final messageType = event.messageType;

    if (messageType == MessageTypes.Image ||
        messageType == MessageTypes.Video ||
        messageType == MessageTypes.Audio ||
        messageType == MessageTypes.File ||
        messageType == MessageTypes.Location) {
      return '';
    }

    return event.calcLocalizedBodyFallback(
      MatrixLocals(L10n.of(context)),
      withSenderNamePrefix: false,
      hideReply: true,
    );
  }
}

class _EditContent extends StatelessWidget {
  final Event? event;

  const _EditContent(this.event);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final event = this.event;
    if (event == null) {
      return const SizedBox.shrink();
    }
    return Row(
      children: <Widget>[
        Icon(
          Icons.edit,
          color: theme.colorScheme.primary,
        ),
        Container(width: 15.0),
        Text(
          event.calcLocalizedBodyFallback(
            MatrixLocals(L10n.of(context)),
            withSenderNamePrefix: false,
            hideReply: true,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: theme.textTheme.bodyMedium!.color,
          ),
        ),
      ],
    );
  }
}
