import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/layouts/max_width_body.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import 'settings_ignore_list.dart';

class SettingsIgnoreListView extends StatelessWidget {
  final SettingsIgnoreListController controller;

  const SettingsIgnoreListView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Rebuilding SettingsIgnoreListView');
    return KeyboardDismissiblePopScope(
      focusNodes: [controller.userIdFocusNode],
      onNavigateBack: () {
        debugPrint('Custom onNavigateBack invoked');
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
      child: _buildScaffold(context),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    final theme = Theme.of(context);

    final client = Matrix.of(context).client;
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(L10n.of(context).blockedUsers),
      ),
      body: MaxWidthBody(
        withScrolling: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    focusNode: controller.userIdFocusNode,
                    controller: controller.controller,
                    onTap: () {
                      if (controller.controller.text.isEmpty) {
                        controller.controller.text = '@';
                        controller.controller.selection =
                            TextSelection.fromPosition(
                          const TextPosition(offset: 1),
                        );
                      }
                    },
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => controller.ignoreUser(context),
                    onChanged: (value) {
                      if (value.isNotEmpty && value.contains(':')) {
                        final username = value.split(':')[0];
                        controller.controller.text =
                            username.startsWith('@') ? username : '@$username';
                        controller.controller.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                            offset: controller.controller.text.length,
                          ),
                        );
                      } else if (value.isNotEmpty && !value.startsWith('@')) {
                        controller.controller.text = '@$value';
                        controller.controller.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                            offset: controller.controller.text.length,
                          ),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      errorText: controller.errorText,
                      hintText: '@username',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: L10n.of(context).blockUsername,
                      suffixIcon: IconButton(
                        tooltip: L10n.of(context).block,
                        icon: const Icon(Icons.add),
                        onPressed: () => controller.ignoreUser(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    L10n.of(context).blockListDescription,
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
            Divider(
              color: theme.dividerColor,
            ),
            Expanded(
              child: StreamBuilder<Object>(
                stream: client.onSync.stream.where(
                  (syncUpdate) =>
                      syncUpdate.accountData?.any(
                        (accountData) =>
                            accountData.type == 'm.ignored_user_list',
                      ) ??
                      false,
                ),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: client.ignoredUsers.length,
                    itemBuilder: (c, i) => FutureBuilder<Profile>(
                      future:
                          client.getProfileFromUserId(client.ignoredUsers[i]),
                      builder: (c, s) => ListTile(
                        leading: Avatar(
                          mxContent: s.data?.avatarUrl ?? Uri.parse(''),
                          name: s.data?.displayName ??
                              client.ignoredUsers[i].localpart ??
                              client.ignoredUsers[i],
                        ),
                        title: Text(
                          s.data?.displayName ??
                              '@${client.ignoredUsers[i].localpart ?? client.ignoredUsers[i]}',
                        ),
                        subtitle: Text(
                          '@${client.ignoredUsers[i].localpart ?? client.ignoredUsers[i]}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                        trailing: IconButton(
                          tooltip: L10n.of(context).delete,
                          icon: const Icon(Icons.delete_outlined),
                          onPressed: () => showFutureLoadingDialog(
                            context: context,
                            future: () =>
                                client.unignoreUser(client.ignoredUsers[i]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
