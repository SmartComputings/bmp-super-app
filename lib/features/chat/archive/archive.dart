import 'package:bmp/features/chat/archive/archive_view.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/room_archive_helper.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class Archive extends StatefulWidget {
  const Archive({super.key});

  @override
  ArchiveController createState() => ArchiveController();
}

class ArchiveController extends State<Archive> {
  List<Room> archive = [];

  Future<List<Room>> getArchive(BuildContext context) async {
    try {
      final client = Matrix.of(context).client;
      if (!client.isLogged()) {
        return archive = [];
      }
      return archive = RoomArchiveHelper.getArchivedRooms(client);
    } catch (e) {
      return archive = [];
    }
  }

  void forgetRoomAction(int i) async {
    await showFutureLoadingDialog(
      context: context,
      future: () async {
        Logs().v('Forget room ${archive.last.getLocalizedDisplayname()}');
        await archive[i].forget();
        archive.removeAt(i);
      },
    );
    setState(() {});
  }

  void unarchiveRoomAction(int i) async {
    await showFutureLoadingDialog(
      context: context,
      future: () async {
        await RoomArchiveHelper.unarchiveRoom(archive[i]);
        archive.removeAt(i);
      },
    );
    setState(() {});
  }

  void forgetAllAction() async {
    final client = Matrix.of(context).client;
    if (archive.isEmpty) return;
    if (await showOkCancelAlertDialog(
        dialogType: DialogType.warning,
          useRootNavigator: false,
          context: context,
          title: L10n.of(context).areYouSure,
          okLabel: L10n.of(context).yes,
          cancelLabel: L10n.of(context).cancel,
          message: L10n.of(context).clearArchive,
        ) !=
        OkCancelResult.ok) {
      return;
    }
    
    // Clear UI immediately
    setState(() {
      archive.clear();
    });
    
    // Clear archive with loading
    await showFutureLoadingDialog(
      context: context,
      future: () => RoomArchiveHelper.clearAllArchived(client),
    );
    
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => ArchiveView(this);
}
