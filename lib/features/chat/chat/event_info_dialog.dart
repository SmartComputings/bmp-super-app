import 'dart:convert';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/adaptive_bottom_sheet.dart';
import 'package:bmp/shared/utils/date_time_extension.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

extension EventInfoDialogExtension on Event {
  void showInfoDialog(BuildContext context) => showAdaptiveBottomSheet(
        context: context,
        builder: (context) =>
            EventInfoDialog(l10n: L10n.of(context), event: this),
      );
}

class EventInfoDialog extends StatelessWidget {
  final Event event;
  final L10n l10n;

  const EventInfoDialog({
    required this.event,
    required this.l10n,
    super.key,
  });

  String prettyJson(MatrixEvent event) {
    const decoder = JsonDecoder();
    const encoder = JsonEncoder.withIndent('    ');
    final object = decoder.convert(jsonEncode(event.toJson()));
    return encoder.convert(object);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final originalSource = event.originalSource;
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).messageInfo),
        leading: CloseButton(
          onPressed: Navigator.of(context, rootNavigator: false).pop,
        ),
      ),
      body: Container(
        constraints: const BoxConstraints(maxHeight: 300),
        child: ListView(
          shrinkWrap: true,
        children: [
          ListTile(
            leading: Avatar(
              mxContent: event.senderFromMemoryOrFallback.avatarUrl,
              name: event.senderFromMemoryOrFallback.calcDisplayname(),
              client: event.room.client,

            ),
            title: Text(L10n.of(context).sender),
            subtitle: Text(
              '${event.senderFromMemoryOrFallback.calcDisplayname()} [${event.senderId.localpart}]',
            ),
          ),
          ListTile(
            title: Text('${L10n.of(context).time}:'),
            subtitle: Text(event.originServerTs.localizedTime(context)),
          ),
          ListTile(
            title: Text('${L10n.of(context).status}:'),
            subtitle: Text(event.status.name),
          ),
          // Source code and encrypted content hidden
        ],
        ),
      ),
    );
  }
}
