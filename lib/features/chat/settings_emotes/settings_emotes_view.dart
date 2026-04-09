import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/layouts/max_width_body.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrix/matrix.dart';

import 'settings_emotes.dart';

enum PopupMenuEmojiActions { import, export }

class EmotesSettingsView extends StatelessWidget {
  final EmotesSettingsController controller;

  const EmotesSettingsView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final client = Matrix.of(context).client;
    final imageKeys = controller.pack!.images.keys.toList();
    return KeyboardDismissiblePopScope(
      focusNodes: [controller.packFocusNode, controller.stateKeyFocusNode],
      child: Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          L10n.of(context).customEmojisAndStickers,
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: context.screenWidth * 0.04,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: context.screenWidth * 0.02),
           
            child: PopupMenuButton<PopupMenuEmojiActions>(
              icon: Icon(Icons.more_vert, color: theme.colorScheme.onPrimaryContainer),
              onSelected: (value) {
                switch (value) {
                  case PopupMenuEmojiActions.export:
                    controller.exportAsZip();
                    break;
                  case PopupMenuEmojiActions.import:
                    controller.importEmojiZip();
                    break;
                }
              },
              enabled: !controller.readonly,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: PopupMenuEmojiActions.import,
                  child: Row(
                    children: [
                      Icon(Icons.upload_file, size: context.screenWidth * 0.034, color: theme.colorScheme.primary),
                      SizedBox(width: context.screenWidth * 0.03),
                      Text(L10n.of(context).importFromZipFile),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: PopupMenuEmojiActions.export,
                  child: Row(
                    children: [
                      Icon(Icons.download, size: context.screenWidth * 0.05, color: theme.colorScheme.primary),
                      SizedBox(width: context.screenWidth * 0.03),
                      Text(L10n.of(context).exportEmotePack),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: controller.showSave
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    blurRadius: context.screenWidth * 0.02,
                    offset: Offset(0, context.screenHeight * 0.005),
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: controller.saveAction,
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: const Icon(Icons.save_outlined, color: Colors.white),
              ),
            )
          : null,
      body: MaxWidthBody(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (!controller.readonly)
              Container(
                margin: EdgeInsets.all(context.screenWidth * 0.04),
                padding: EdgeInsets.all(context.screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      L10n.of(context).addNewEmote,
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.015),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          L10n.of(context).shortcode,
                          style: TextStyle(
                            fontSize: context.screenWidth * 0.03,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.01),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.03, vertical: context.screenHeight * 0.01),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
                            border: Border.all(color: theme.colorScheme.outline.withOpacity(0.3)),
                          ),
                          child: TextField(
                            controller: controller.newImageCodeController,
                            focusNode: controller.packFocusNode,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: L10n.of(context).emoteShortcode,
                              prefixText: ': ',
                              suffixText: ':',
                              prefixStyle: TextStyle(
                                fontSize: context.screenWidth*0.035,
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              suffixStyle: TextStyle(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.02),
                        Text(
                          L10n.of(context).image,
                          style: TextStyle(
                            fontSize: context.screenWidth * 0.035,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.01),
                        _ImagePicker(
                          controller: controller.newImageController,
                          onPressed: controller.imagePickerAction,
                        ),
                        SizedBox(height: context.screenHeight * 0.02),
                        SizedBox(
                          width: double.infinity,
                          height: context.screenHeight * 0.06,
                          child: ElevatedButton.icon(
                            onPressed: controller.addImageAction,
                            icon: const Icon(Icons.add_circle_outline),
                            label: Text(L10n.of(context).addEmote),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (controller.room != null)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
                ),
                child: SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    L10n.of(context).enableEmotesGlobally,
                    style: TextStyle(
                      fontSize: context.screenHeight*0.035,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  value: controller.isGloballyActive(client),
                  onChanged: controller.setIsGloballyActive,
                  activeColor: theme.colorScheme.primary,
                ),
              ),
            if (!controller.readonly || controller.room != null)
              const Divider(),
            imageKeys.isEmpty
                ? Container(
                    margin: EdgeInsets.all(context.screenWidth * 0.05),
                    padding:  EdgeInsets.all(context.screenWidth * 0.05),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.emoji_emotions_outlined,
                          size: context.screenWidth*0.15,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        SizedBox(height: context.screenHeight * 0.02),
                        Text(
                          L10n.of(context).noEmotesFound,
                          style: TextStyle(
                            fontSize: context.screenWidth*0.04,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, i) => const SizedBox(height: 8),
                    itemCount: imageKeys.length + 1,
                    itemBuilder: (context, i) {
                      if (i >= imageKeys.length) {
                        return const SizedBox(height: 70);
                      }
                      final imageCode = imageKeys[i];
                      final image = controller.pack!.images[imageCode]!;
                      final textEditingController = TextEditingController();
                      textEditingController.text = imageCode;
                      final useShortCuts = (PlatformInfos.isWeb || PlatformInfos.isDesktop);
                      
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
                          boxShadow: [
                            BoxShadow(
                              color: theme.shadowColor.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: _EmoteImage(image.url),
                            ),
                       SizedBox(width: context.screenWidth*0.025),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: context.screenWidth*0.025, vertical: context.screenHeight*0.025),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Shortcuts(
                                  shortcuts: !useShortCuts ? {} : {
                                    LogicalKeySet(LogicalKeyboardKey.enter): SubmitLineIntent(),
                                  },
                                  child: Actions(
                                    actions: !useShortCuts ? {} : {
                                      SubmitLineIntent: CallbackAction(
                                        onInvoke: (i) {
                                          controller.submitImageAction(
                                            imageCode,
                                            textEditingController.text,
                                            image,
                                            textEditingController,
                                          );
                                          return null;
                                        },
                                      ),
                                    },
                                    child: TextField(
                                      focusNode: controller.stateKeyFocusNode,
                                      readOnly: controller.readonly,
                                      controller: textEditingController,
                                      autocorrect: false,
                                      decoration: InputDecoration(
                                        hintText: L10n.of(context).emoteShortcode,
                                        prefixText: ': ',
                                        suffixText: ':',
                                        prefixStyle: TextStyle(
                                          color: theme.colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        suffixStyle: TextStyle(
                                          color: theme.colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      onSubmitted: (s) => controller.submitImageAction(
                                        imageCode,
                                        s,
                                        image,
                                        textEditingController,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (!controller.readonly) ...[
                              SizedBox(width: context.screenWidth*0.03),
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.errorContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  onPressed: () => controller.removeImageAction(imageCode),
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: theme.colorScheme.onErrorContainer,
                                  ),
                                  tooltip: L10n.of(context).deleteEmote,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    ),);
  }
}

class _EmoteImage extends StatelessWidget {
  final Uri mxc;

  const _EmoteImage(this.mxc);

  @override
  Widget build(BuildContext context) {
    final size = context.screenWidth * 0.095;
    return SizedBox.square(
      dimension: size,
      child: MxcImage(
        uri: mxc,
        fit: BoxFit.contain,
        width: size,
        height: size,
        isThumbnail: false,
      ),
    );
  }
}

class _ImagePicker extends StatefulWidget {
  final ValueNotifier<ImagePackImageContent?> controller;
  final void Function(ValueNotifier<ImagePackImageContent?>) onPressed;

  const _ImagePicker({required this.controller, required this.onPressed});

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<_ImagePicker> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    if (widget.controller.value == null) {
      return GestureDetector(
        onTap: () => widget.onPressed(widget.controller),
        child: Container(
          width: double.infinity,
          height: context.screenHeight*0.05,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.outline.withOpacity(0.3),
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                color: theme.colorScheme.primary,
                size: context.screenWidth*0.05,
              ),
              SizedBox(width: context.screenWidth * 0.02),
              Text(
                L10n.of(context).chooseImage,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _EmoteImage(widget.controller.value!.url),
            const SizedBox(width: 12),
            Text(
              L10n.of(context).imageSelected,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class SubmitLineIntent extends Intent {}
