import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'snackbar.dart';

abstract class UpdateNotifier {
  static const String versionStoreKey = 'last_known_version';

  static void showUpdateSnackBar(BuildContext context) async {
    final currentVersion = await PlatformInfos.getVersion();
    final store = await SharedPreferences.getInstance();
    final storedVersion = store.getString(versionStoreKey);

    if (currentVersion != storedVersion) {
      if (storedVersion != null) {
        CustomSnackbar.show(context,
          title: "Info",
          message: L10n.of(context).updateInstalled(currentVersion),
          type: SnackbarType.info,
        );
      }
      await store.setString(versionStoreKey, currentVersion);
    }
  }
}
