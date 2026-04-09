import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:share_plus/share_plus.dart';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'snackbar.dart';

abstract class BmpShare {
  static Future<void> share(
    String text,
    BuildContext context, {
    bool copyOnly = false,
  }) async {
    if (PlatformInfos.isMobile && !copyOnly) {
      final box = context.findRenderObject() as RenderBox;
      await Share.share(
        text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
      return;
    }
    await Clipboard.setData(
      ClipboardData(text: text),
    );
    CustomSnackbar.show(context,
      title: L10n.of(context).success,
      message: L10n.of(context).copiedToClipboard,
      type: SnackbarType.success,
    );
    return;
  }

  static Future<void> shareInviteLink(BuildContext context) async {
    try {
      final client = Matrix.of(context).client;
      
      // Show loading indicator
      CustomSnackbar.show(context,
        title: L10n.of(context).info,
        message: L10n.of(context).loading,
        type: SnackbarType.info,
      );
      
      final ownProfile = await client.fetchOwnProfile();
      final displayName = ownProfile.displayName ?? client.userID?.split(':')[0] ?? 'User';
      final l10n = L10n.of(context);
      
      final inviteMessage = '${l10n.joinMeOnBeMindPower}\n\n'
          '${l10n.inviteMessageBody(displayName)}\n\n'
          '${l10n.downloadTheApp('https://invitation.be-mindpower.net/')}\n\n'
          '${l10n.beMindPowerTagline}';
      
      await BmpShare.share(inviteMessage, context);
      
    } catch (e) {
      // Handle error
      CustomSnackbar.show(context,
        title: L10n.of(context).error,
        message: L10n.of(context).failedToCreateInvite(e.toString()),
        type: SnackbarType.error,
      );
      
      // Fallback invite without profile
      final l10n = L10n.of(context);
      final fallbackMessage = '${l10n.joinMeOnBeMindPower}\n\n'
          '${l10n.downloadTheApp('https://invitation.be-mindpower.net/')}\n\n'
          '${l10n.beMindPowerTagline}';
      
      await BmpShare.share(fallbackMessage, context);
    }
  }
}
