import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';

class BlockedUsersList extends StatelessWidget {
  const BlockedUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).blockedUsers),
      ),
      body: FutureBuilder(
        future: client.accountDataLoading,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return AppLoadingWidget();
          }
          
          return StreamBuilder<Object>(
            stream: client.onSync.stream,
            builder: (context, snapshot) {
              final ignoredUsers = client.ignoredUsers;
              
              if (ignoredUsers.isEmpty) {
                return Center(
                  child: Text(
                    L10n.of(context).noBlockedUsers,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                );
              }
              
              return ListView.builder(
                itemCount: ignoredUsers.length,
                itemBuilder: (c, i) => FutureBuilder<Profile>(
                  future: client.getProfileFromUserId(ignoredUsers[i]),
                  builder: (c, s) => ListTile(
                    leading: Avatar(
                      mxContent: s.data?.avatarUrl ?? Uri.parse(''),
                      name: s.data?.displayName ??
                          ignoredUsers[i].localpart ??
                          ignoredUsers[i],
                    ),
                    title: Text(
                      s.data?.displayName ??
                          '@${ignoredUsers[i].localpart ?? ignoredUsers[i]}',
                    ),
                    subtitle: Text(
                      '@${ignoredUsers[i].localpart ?? ignoredUsers[i]}',
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
                        future: () => client.unignoreUser(ignoredUsers[i]),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}