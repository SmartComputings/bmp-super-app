import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import 'settings_blocked_list_view.dart';

class SettingsBlockedUserList extends StatefulWidget {
  final String? initialUserId;

  const SettingsBlockedUserList({super.key, this.initialUserId});

  @override
  SettingsIgnoreListController createState() => SettingsIgnoreListController();
}

class SettingsIgnoreListController extends State<SettingsBlockedUserList> {
  final TextEditingController controller = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final initialUserId = widget.initialUserId;
    if (initialUserId != null) {
      final username = initialUserId.localpart ?? initialUserId;
      controller.text = username.startsWith('@') ? username : '@$username';
    } else {
      controller.text = '@';
    }
  }

  String? errorText;

  void ignoreUser(BuildContext context) {
    var userId = controller.text.trim();
    if (userId.isEmpty) return;
    
    // Add server domain if not present
    if (!userId.contains(':')) {
      userId = '$userId:server.be-mindpower.net';
    }
    
    if (!userId.isValidMatrixId || userId.sigil != '@') {
      setState(() {
        errorText = L10n.of(context).invalidInput;
      });
      return;
    }
    setState(() {
      errorText = null;
    });

    showFutureLoadingDialog(
      context: context,
      future: () => Matrix.of(context).client.ignoreUser(userId),
    );
    controller.clear();
  }

  @override
  void dispose() {
    controller.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SettingsBlockedListView(this);
}
