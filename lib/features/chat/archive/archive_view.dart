import 'package:bmp/features/chat/archive/archive.dart';
import 'package:bmp/features/chat/archive/archive_chat_list_item.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/adaptive_loader_widget.dart';
import 'package:bmp/shared/widgets/layouts/max_width_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

class ArchiveView extends StatelessWidget {
  final ArchiveController controller;

  const ArchiveView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Room>>(
      future: controller.getArchive(context),
      builder: (BuildContext context, snapshot) => Scaffold(
      appBar: AppBar(
        leading: const Center(child: BackButton()),
        title: Text(L10n.of(context).archive),
        actions: [
          if (controller.archive.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: controller.forgetAllAction,
                label: Text(L10n.of(context).clearArchive),
                icon: const Icon(Icons.cleaning_services_outlined),
              ),
            ),
        ],
      ),
      body: MaxWidthBody(
        withScrolling: false,
        child: Builder(
          builder: (BuildContext context) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      L10n.of(context).oopsSomethingWentWrong,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Unable to load archived chats',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: AdaptiveLoaderWidget(),
              );
            } else {
              if (controller.archive.isEmpty) {
                return const Center(
                  child: Icon(Icons.archive_outlined, size: 80),
                );
              }
              return ListView.builder(
                itemCount: controller.archive.length,
                itemBuilder: (BuildContext context, int i) => ArchiveChatListItem(
                  controller.archive[i],
                  onForget: () => controller.unarchiveRoomAction(i),
                  onTap: () => context.push('/mainMenuScreen/rooms/archive/${controller.archive[i].id}'),
                ),
              );
            }
          },
        ),
      ),
      ),
    );
  }
}
