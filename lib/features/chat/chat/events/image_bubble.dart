import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/features/chat/image_viewer/image_viewer.dart';
import 'package:bmp/shared/utils/date_time_extension.dart';
import 'package:bmp/shared/utils/file_description.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:bmp/shared/widgets/blur_hash.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:matrix/matrix.dart';

import 'message_reactions.dart';
import 'message_delivery_status.dart';

class ImageBubble extends StatelessWidget {
  final Event event;
  final bool tapToView;
  final BoxFit fit;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? linkColor;
  final bool thumbnailOnly;
  final bool animated;
  final double width;
  final double height;
  final void Function()? onTap;
  final BorderRadius? borderRadius;
  final Timeline? timeline;
  final bool displayTime;
  final bool selected;

  const ImageBubble(
    this.event, {
    this.tapToView = true,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.thumbnailOnly = true,
    this.width = 400,
    this.height = 300,
    this.animated = false,
    this.onTap,
    this.borderRadius,
    this.timeline,
    this.textColor,
    this.linkColor,
    this.displayTime = false,
    this.selected = false,
    super.key,
  });

  Widget _buildPlaceholder(BuildContext context) {
    final String blurHashString =
        event.infoMap['xyz.amorgan.blurhash'] is String
            ? event.infoMap['xyz.amorgan.blurhash']
            : 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';
    return SizedBox(
      width: width,
      height: height,
      child: BlurHash(
        blurhash: blurHashString,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }

  void _onTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }
    if (!tapToView) return;
    showDialog(
      context: context,
      useRootNavigator: false, // Use local navigator so back button closes dialog
      barrierDismissible: true,
      builder: (dialogContext) => ImageViewer(
        event,
        timeline: timeline,
        outerContext: context,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final client = Matrix.of(context).client;
    final ownMessage = event.senderId == client.userID;

    var borderRadius =
        this.borderRadius ?? BorderRadius.circular(AppConfig.borderRadius);

    final fileDescription = event.fileDescription;
    final textColor = this.textColor;
    
    // Check if we should show reactions and time
    final showReactionsAndTime = timeline != null && (displayTime || selected || event.hasAggregatedEvents(timeline!, RelationshipTypes.reaction));

    // If caption exists, don't add gradient background (let message.dart handle it)
    if (fileDescription != null && fileDescription.isNotEmpty && textColor != null) {
      return Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppConfig.borderRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _onTap(context),
          borderRadius: BorderRadius.circular(AppConfig.borderRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConfig.borderRadius),
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Hero(
                      tag: event.eventId,
                      child: MxcImage(
                        event: event,
                        width: width,
                        height: height,
                        fit: fit,
                        animated: animated,
                        isThumbnail: thumbnailOnly,
                        placeholder: event.messageType == MessageTypes.Sticker
                            ? null
                            : _buildPlaceholder,
                      ),
                    ),
                  ),
                ),
              ),
              // Caption text
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 8.0,
                ),
                child: Linkify(
                  text: fileDescription,
                  textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
                  style: TextStyle(
                    color: textColor,
                    fontSize:
                        AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                  ),
                  options: const LinkifyOptions(humanize: false),
                  linkStyle: TextStyle(
                    color: linkColor ?? textColor,
                    fontSize:
                        AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                    decoration: TextDecoration.underline,
                    decorationColor: linkColor ?? textColor,
                  ),
                  onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
                ),
              ),
              // Reactions, time, and delivery status
              if (showReactionsAndTime && timeline != null)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4.0,
                    left: 10.0,
                    right: 10.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      if (event.hasAggregatedEvents(timeline!, RelationshipTypes.reaction))
                        MessageReactions(event, timeline!),
                      const Spacer(),
                      if (displayTime || selected)
                        Text(
                          event.originServerTs.localizedTimeShort(context),
                          style: TextStyle(
                            fontSize: 9 * AppConfig.fontSizeFactor,
                            color: (textColor ?? Colors.white).withAlpha(164),
                          ),
                        ),
                      if (ownMessage && timeline != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: MessageDeliveryStatus(
                            event: event,
                            timeline: timeline!,
                            size: 13,
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

    // If no caption, add gradient background container
    return Container(
      decoration: BoxDecoration(
        gradient: event.messageType == MessageTypes.Sticker
            ? null
            : !ownMessage
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0x7F050926),
                      Color(0x7F0A1142),
                      Color(0x7F131EBF),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0x7F8115BF),
                      Color(0x7F9A1AC7),
                      Color(0x7FA912BF),
                    ],
                  ),
        borderRadius: borderRadius,
        border: event.messageType == MessageTypes.Sticker
            ? null
            : !ownMessage
                ? Border.all(
                    color: const Color(0xFF131EBF),
                    width: 1.0,
                  )
                : Border.all(
                    color: const Color(0xFFA912BF),
                    width: 1.0,
                  ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            child: InkWell(
              onTap: () => _onTap(context),
              borderRadius: borderRadius,
              child: Hero(
                tag: event.eventId,
                child: MxcImage(
                  event: event,
                  width: width,
                  height: height,
                  fit: fit,
                  animated: animated,
                  isThumbnail: thumbnailOnly,
                  placeholder: event.messageType == MessageTypes.Sticker
                      ? null
                      : _buildPlaceholder,
                ),
              ),
            ),
          ),
          // Reactions, time, and delivery status
          if (showReactionsAndTime && timeline != null)
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                left: 10.0,
                right: 10.0,
                bottom: 8.0,
              ),
              child: Row(
                children: [
                  if (event.hasAggregatedEvents(timeline!, RelationshipTypes.reaction))
                    MessageReactions(event, timeline!),
                  const Spacer(),
                  if (displayTime || selected)
                    Text(
                      event.originServerTs.localizedTimeShort(context),
                      style: TextStyle(
                        fontSize: 9 * AppConfig.fontSizeFactor,
                        color: (textColor ?? Colors.white).withAlpha(164),
                      ),
                    ),
                  if (ownMessage && timeline != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: MessageDeliveryStatus(
                        event: event,
                        timeline: timeline!,
                        size: 13,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
