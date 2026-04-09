import 'dart:math';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/chat/events/video_player.dart';
import 'package:bmp/shared/utils/adaptive_bottom_sheet.dart';
import 'package:bmp/shared/utils/date_time_extension.dart';
import 'package:bmp/shared/utils/event_checkbox_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import '../../../../core/config/app_config.dart';
import '../../bootstrap/bootstrap_dialog.dart';
import 'audio_player.dart';
import 'contact_bubble.dart';
import 'cute_events.dart';
import 'html_message.dart';
import 'image_bubble.dart';
import 'map_bubble.dart';
import 'message_download_content.dart';

class MessageContent extends StatelessWidget {
  final Event event;
  final Color textColor;
  final Color linkColor;
  final void Function(Event)? onInfoTab;
  final BorderRadius borderRadius;
  final Timeline timeline;
  final bool selected;
  final bool longPressSelect;

  const MessageContent(
    this.event, {
    this.onInfoTab,
    super.key,
    required this.timeline,
    required this.textColor,
    required this.linkColor,
    required this.borderRadius,
    required this.selected,
    this.longPressSelect = false,
  });

  void _verifyOrRequestKey(BuildContext context) async {
    final l10n = L10n.of(context);
    if (event.content['can_request_session'] != true) {
      CustomSnackbar.show(
        context,
        title: l10n.financeInfo,
        message: event.calcLocalizedBodyFallback(MatrixLocals(l10n)),
        type: SnackbarType.info,
      );
      return;
    }
    final client = Matrix.of(context).client;
    if (client.isUnknownSession && client.encryption!.crossSigning.enabled) {
      final success = await BootstrapDialog(
        client: Matrix.of(context).client,
      ).show(context);
      if (success != true) return;
    }
    event.requestKey();
    final sender = event.senderFromMemoryOrFallback;
    await showAdaptiveBottomSheet(
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(onPressed: Navigator.of(context).pop),
          title: Text(
            l10n.whyIsThisMessageEncrypted,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Avatar(
                  mxContent: sender.avatarUrl,
                  name: sender.calcDisplayname(),
                  presenceUserId: sender.stateKey,
                  client: event.room.client,
                ),
                title: Text(sender.calcDisplayname()),
                subtitle: Text(event.originServerTs.localizedTime(context)),
                trailing: const Icon(Icons.lock_outlined),
              ),
              const Divider(),
              Text(
                event.calcLocalizedBodyFallback(
                  MatrixLocals(l10n),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = AppConfig.messageFontSize * AppConfig.fontSizeFactor;
    final buttonTextColor = textColor;
    switch (event.type) {
      case EventTypes.Message:
      case EventTypes.Encrypted:
      case EventTypes.Sticker:
        switch (event.messageType) {
          case MessageTypes.Image:
          case MessageTypes.Sticker:
            if (event.redacted) continue textmessage;
            const maxSize = 256.0;
            final w = event.content
                .tryGetMap<String, Object?>('info')
                ?.tryGet<int>('w');
            final h = event.content
                .tryGetMap<String, Object?>('info')
                ?.tryGet<int>('h');
            var width = maxSize;
            var height = maxSize;
            var fit = event.messageType == MessageTypes.Sticker
                ? BoxFit.contain
                : BoxFit.cover;
            if (w != null && h != null) {
              fit = BoxFit.contain;
              if (w > h) {
                width = maxSize;
                height = max(32, maxSize * (h / w));
              } else {
                height = maxSize;
                width = max(32, maxSize * (w / h));
              }
            }
            return ImageBubble(
              event,
              width: width,
              height: height,
              fit: fit,
              borderRadius: borderRadius,
              timeline: timeline,
              textColor: textColor,
              tapToView: !longPressSelect,
              selected: selected,
              displayTime: true, // Always show time for now, will be controlled by parent
            );
          case CuteEventContent.eventType:
            return CuteContent(event);
          case MessageTypes.Audio:
            if (PlatformInfos.isMobile ||
                    PlatformInfos.isMacOS ||
                    PlatformInfos.isWeb
                // Disabled until https://github.com/bleonard252/just_audio_mpv/issues/3
                // is fixed
                //   || PlatformInfos.isLinux
                ) {
              return AudioPlayerWidget(
                event,
                color: textColor,
                linkColor: linkColor,
                fontSize: fontSize,
              );
            }
            return MessageDownloadContent(
              event,
              textColor: textColor,
              linkColor: linkColor,
            );
          case MessageTypes.Video:
            return EventVideoPlayer(
              event,
              textColor: textColor,
              linkColor: linkColor,
              timeline: timeline,
              tapToView: !longPressSelect,
            );
          case MessageTypes.File:
            return MessageDownloadContent(
              event,
              textColor: textColor,
              linkColor: linkColor,
            );
          case MessageTypes.BadEncrypted:
          case EventTypes.Encrypted:
            return _ButtonContent(
              textColor: buttonTextColor,
              onPressed: () => _verifyOrRequestKey(context),
              icon: '🔒',
              label: L10n.of(context).encrypted,
              fontSize: fontSize,
            );
          case MessageTypes.Location:
            final geoUri =
                Uri.tryParse(event.content.tryGet<String>('geo_uri')!);
            if (geoUri != null && geoUri.scheme == 'geo') {
              final latlong = geoUri.path
                  .split(';')
                  .first
                  .split(',')
                  .map((s) => double.tryParse(s))
                  .toList();
              if (latlong.length == 2 &&
                  latlong.first != null &&
                  latlong.last != null) {
                final isOwn = event.senderId ==
                    event.room.client.userID;
                return MapBubble(
                  latitude: latlong.first!,
                  longitude: latlong.last!,
                  ownMessage: isOwn,
                );
              }
            }
            continue textmessage;
          case MessageTypes.Text:
          case MessageTypes.Notice:
          case MessageTypes.Emote:
          case MessageTypes.None:
          textmessage:
          default:
            // Handle contact messages
            if (event.type == 'm.contact') {
              final contactInfo = event.content.tryGetMap<String, Object?>('contact_info');
              if (contactInfo != null) {
                return ContactBubble(
                  name: contactInfo.tryGet<String>('name') ?? 'Unknown',
                  phoneNumber: contactInfo.tryGet<String>('phone') ?? '',
                  avatarData: contactInfo.tryGet<String>('avatar'),
                  isOwnMessage: event.senderId == event.room.client.userID,
                );
              }
            }
            if (event.redacted) {
              final currentUserId = event.room.client.userID;
              final isOwnMessage = event.senderId == currentUserId;
              
              // return _ButtonContent(
              //   label: isOwnMessage 
              //       ? 'You deleted this message'
              //       : 'This message was deleted',
              //   icon: '🚫',
              //   textColor: buttonTextColor,
              //   onPressed: () => onInfoTab!(event),
              //   fontSize: fontSize,
              // );
              return _ButtonContent(
  label: isOwnMessage 
      ? L10n.of(context).youDeletedThisMessage
      : L10n.of(context).thisMessageWasDeleted,
  icon: '🚫',
  textColor: buttonTextColor,
  onPressed: () => onInfoTab!(event),
  fontSize: fontSize,
);

            }
            var html = AppConfig.renderHtml && event.isRichMessage
                ? event.formattedText
                : event.body;
            if (event.messageType == MessageTypes.Emote) {
              html = '* $html';
            }

            final bigEmotes = event.onlyEmotes &&
                event.numberEmotes > 0 &&
                event.numberEmotes <= 3;
            
            // Determine emoji size multiplier based on count
            double emojiMultiplier = 1;
            if (bigEmotes) {
              if (event.numberEmotes == 1) {
                emojiMultiplier = 3.5; // Reduced from 5 for single emoji
              } else if (event.numberEmotes == 2) {
                emojiMultiplier = 2.5; // Smaller for 2 emojis
              } else if (event.numberEmotes == 3) {
                emojiMultiplier = 2; // Even smaller for 3 emojis
              }
            }
            
            return Padding(
              padding: const EdgeInsets.only(
                left: 6,
                right: 6,
                top: 4,
             
              ),
              child: HtmlMessage(
                html: html,
                textColor: textColor,
                room: event.room,
                fontSize: AppConfig.fontSizeFactor *
                    AppConfig.messageFontSize *
                    emojiMultiplier,
                limitHeight: !selected,
                linkStyle: TextStyle(
                  color: linkColor,
                   fontFamily: 'Work Sans',
                  fontSize:
                      AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                  decoration: TextDecoration.underline,
                  decorationColor: linkColor,
                ),
                onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
                eventId: event.eventId,
                checkboxCheckedEvents: event.aggregatedEvents(
                  timeline,
                  EventCheckboxRoomExtension.relationshipType,
                ),
              ),
            );
        }
      case EventTypes.CallInvite:
        return FutureBuilder<User?>(
          future: event.fetchSenderUser(),
          builder: (context, snapshot) {
            final senderName = snapshot.data?.calcDisplayname() ??
                event.senderFromMemoryOrFallback.calcDisplayname();
            final isOwnCall = event.senderId == event.room.client.userID;
            return _CallActivityBubble(
              senderName: senderName,
              timestamp: event.originServerTs,
              isOwnCall: isOwnCall,
              onTap: () => onInfoTab!(event),
            );
          },
        );
      default:
        return FutureBuilder<User?>(
          future: event.fetchSenderUser(),
          builder: (context, snapshot) {
            return _ButtonContent(
              label: L10n.of(context).userSentUnknownEvent(
                snapshot.data?.calcDisplayname() ??
                    event.senderFromMemoryOrFallback.calcDisplayname(),
                event.type,
              ),
              icon: 'ℹ️',
              textColor: buttonTextColor,
              onPressed: () => onInfoTab!(event),
              fontSize: fontSize,
            );
          },
        );
    }
  }
}

class _ButtonContent extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final String icon;
  final Color? textColor;
  final double fontSize;

  const _ButtonContent({
    required this.label,
    required this.icon,
    required this.textColor,
    required this.onPressed,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          '$icon  $label',
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

class _CallActivityBubble extends StatefulWidget {
  final String senderName;
  final DateTime timestamp;
  final bool isOwnCall;
  final VoidCallback onTap;

  const _CallActivityBubble({
    required this.senderName,
    required this.timestamp,
    required this.isOwnCall,
    required this.onTap,
  });

  @override
  State<_CallActivityBubble> createState() => _CallActivityBubbleState();
}

class _CallActivityBubbleState extends State<_CallActivityBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine call status style
    final String statusLabel;
    final Color accentColor;
    final IconData callIcon;

    if (widget.isOwnCall) {
      statusLabel = L10n.of(context).outgoingCall;
      accentColor = const Color(0xFF4CAF50); // green
      callIcon = Icons.call_made_rounded;
    } else {
      statusLabel =L10n.of(context).incomingCall
;
      accentColor = const Color(0xFF42A5F5); // blue
      callIcon = Icons.call_received_rounded;
    }

    final timeString = widget.timestamp.localizedTimeShort(context);

    return GestureDetector(
      onTapDown: (_) => _scaleController.forward(),
      onTapUp: (_) {
        _scaleController.reverse();
        widget.onTap();
      },
      onTapCancel: () => _scaleController.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.08),
                Colors.white.withOpacity(0.03),
              ],
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: accentColor.withOpacity(0.25),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Call icon container
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(
                  callIcon,
                  color: accentColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              // Text content
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Status label
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Accent dot
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: accentColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: accentColor.withOpacity(0.5),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          statusLabel,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.95),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Sender name + timestamp row
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            widget.senderName,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.55),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            width: 3,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Text(
                          timeString,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
