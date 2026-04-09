import 'package:bmp/shared/utils/adaptive_loader_widget.dart';
import 'package:flutter/material.dart';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:matrix/matrix.dart';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/config/themes.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:bmp/shared/widgets/reaction_bottomsheet.dart';

class MessageReactions extends StatelessWidget {
  final Event event;
  final Timeline timeline;

  const MessageReactions(this.event, this.timeline, {super.key});

  @override
  Widget build(BuildContext context) {
    final allReactionEvents =
        event.aggregatedEvents(timeline, RelationshipTypes.reaction);
    final reactionMap = <String, _ReactionEntry>{};
    final client = Matrix.of(context).client;

    // Group reactions by user first to ensure one reaction per user
    final userReactions = <String, Event>{};
    for (final e in allReactionEvents) {
      final key = e.content
          .tryGetMap<String, dynamic>('m.relates_to')
          ?.tryGet<String>('key');
      if (key != null) {
        // Only keep the latest reaction from each user based on timestamp
        final existing = userReactions[e.senderId];
        if (existing == null || e.originServerTs.isAfter(existing.originServerTs)) {
          userReactions[e.senderId] = e;
        }
      }
    }
    
    // Now build reaction map from unique user reactions
    for (final e in userReactions.values) {
      final key = e.content
          .tryGetMap<String, dynamic>('m.relates_to')
          ?.tryGet<String>('key');
      if (key != null) {
        if (!reactionMap.containsKey(key)) {
          reactionMap[key] = _ReactionEntry(
            key: key,
            count: 0,
            reacted: false,
            reactors: [],
          );
        }
        reactionMap[key]!.count++;
        reactionMap[key]!.reactors!.add(e.senderFromMemoryOrFallback);
        reactionMap[key]!.reacted |= e.senderId == e.room.client.userID;
      }
    }

    final reactionList = reactionMap.values.toList();
    reactionList.sort((a, b) => b.count - a.count > 0 ? 1 : -1);
    final ownMessage = event.senderId == event.room.client.userID;
    return Wrap(
      spacing: 4.0,
      runSpacing: 4.0,
      alignment: ownMessage ? WrapAlignment.end : WrapAlignment.start,
      children: [
        ...reactionList.map(
          (r) => _Reaction(
            reactionKey: r.key,
            count: r.count,
            reacted: r.reacted,
            ownMessage: ownMessage,
            onTap: () {
              // Always check for any existing reaction from this user first
              final existingUserReaction = allReactionEvents.firstWhereOrNull(
                (e) => e.senderId == client.userID,
              );
              
              if (r.reacted) {
                // User is removing their current reaction
                final evt = allReactionEvents.firstWhereOrNull(
                  (e) =>
                      e.senderId == client.userID &&
                      e.content.tryGetMap('m.relates_to')?['key'] == r.key,
                );
                if (evt != null) {
                  showFutureLoadingDialog(
                    context: context,
                    future: () => evt.redactEvent(),
                  );
                }
              } else {
                // User is adding a new reaction
                if (existingUserReaction != null) {
                  // Remove existing reaction first, then add new one
                  showFutureLoadingDialog(
                    context: context,
                    future: () async {
                      await existingUserReaction.redactEvent();
                      await event.room.sendReaction(event.eventId, r.key);
                    },
                  );
                } else {
                  // No existing reaction, just add new one
                  event.room.sendReaction(event.eventId, r.key);
                }
              }
            },
            onLongPress: () {
              print('Long press detected on reaction');
              showReactionBottomSheet(context, event, timeline);
            },
          ),
        ),
        // if (allReactionEvents.any((e) => e.status.isSending))
        //   Container(
        //     constraints: const BoxConstraints(
        //       maxWidth: 10,
        //       maxHeight: 10,
        //     ),
        //     child: const AdaptiveLoaderWidget(),
        //   ),
      ],
    );
  }
}

class _Reaction extends StatelessWidget {
  final String reactionKey;
  final int count;
  final bool? reacted;
  final bool ownMessage;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const _Reaction({
    required this.reactionKey,
    required this.count,
    required this.reacted,
    required this.ownMessage,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.black;
    
    // Use darker background for reactions on messages that are not ours
    final color = reacted == true
        ? theme.bubbleColor
        : ownMessage             // Darker shade for our messages
            ? theme.colorScheme.surfaceContainerHigh
            :const Color(0xF2252844); // Purple for other's messages
    
    Widget content;
    if (reactionKey.startsWith('mxc://')) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MxcImage(
            uri: Uri.parse(reactionKey),
            width: 20,
            height: 20,
            animated: false,
            isThumbnail: false,
          ),
          if (count > 1) ...[
            const SizedBox(width: 4),
            Text(
              count.toString(),
              style: TextStyle(
                color: textColor,
                fontSize: DefaultTextStyle.of(context).style.fontSize,
              ),
            ),
          ],
        ],
      );
    } else {
      var renderKey = Characters(reactionKey);
      if (renderKey.length > 10) {
        renderKey = renderKey.getRange(0, 9) + Characters('…');
      }
      content = Text(
        renderKey.toString() + (count > 1 ? ' $count' : ''),
        style: TextStyle(
          color: reacted == true ? theme.onBubbleColor : textColor,
          fontSize: DefaultTextStyle.of(context).style.fontSize,
        ),
      );
    }
    return InkWell(
      onTap: () => onTap != null ? onTap!() : null,
      onLongPress: () => onLongPress != null ? onLongPress!() : null,
      borderRadius: BorderRadius.circular(AppConfig.borderRadius / 2),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppConfig.borderRadius / 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: content,
      ),
    );
  }
}

class _ReactionEntry {
  String key;
  int count;
  bool reacted;
  List<User>? reactors;

  _ReactionEntry({
    required this.key,
    required this.count,
    required this.reacted,
    this.reactors,
  });
}

class _AdaptableReactorsDialog extends StatelessWidget {
  final Client? client;
  final _ReactionEntry? reactionEntry;

  const _AdaptableReactorsDialog({
    this.client,
    this.reactionEntry,
  });

  Future<bool?> show(BuildContext context) => showAdaptiveDialog(
        context: context,
        builder: (context) => this,
        barrierDismissible: true,
        useRootNavigator: false,
      );

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        children: <Widget>[
          for (final reactor in reactionEntry!.reactors!)
            Chip(
              avatar: Avatar(
                mxContent: reactor.avatarUrl,
                name: reactor.displayName,
                client: client,
                presenceUserId: reactor.stateKey,
              ),
              label: Text(reactor.displayName!),
            ),
        ],
      ),
    );

    final title = Center(child: Text(reactionEntry!.key));

    return AlertDialog.adaptive(
      title: title,
      content: body,
    );
  }
}
