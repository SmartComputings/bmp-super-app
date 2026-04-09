import 'dart:ui';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/circle_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageQuestionWidget extends StatelessWidget {
  final bool isInSettings;
  const MessageQuestionWidget({super.key, this.isInSettings = false});

  void _handleTap(BuildContext context) {
    context.push('/mainMenuScreen/support');
  }

  @override
  Widget build(BuildContext context) {
    return CircleIconWidget(
      onTap: () => _handleTap(context),
      icon: ImageAssets.icMessageQuestion,
      selected: isInSettings,
      size: context.percentHeight * 4.5,
    );
  }
}
