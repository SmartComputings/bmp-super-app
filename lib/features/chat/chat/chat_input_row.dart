import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/widgets/inline_voice_recorder.dart';
import 'package:bmp/shared/utils/other_party_can_receive.dart';
import 'package:flutter/material.dart';













import 'package:flutter/services.dart';
import 'package:matrix/matrix.dart';

import 'attachment_dialog.dart';
import 'chat.dart';

class ChatInputRow extends StatefulWidget {
  final ChatController controller;
  final Function(bool)? onDialogStateChanged;

  const ChatInputRow(this.controller, {super.key, this.onDialogStateChanged});

  @override
  State<ChatInputRow> createState() => _ChatInputRowState();
}

class _ChatInputRowState extends State<ChatInputRow> {
  // Store pasted media data (image or video)
  Uint8List? _pastedImageBytes;  // Raw bytes of pasted media
  String? _pastedImageMimeType;   // MIME type (e.g., 'image/png', 'video/mp4')
  String? _pastedImageName;       // Generated filename for the media

  void _showAttachmentDialog(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final topPosition = screenSize.height - 300;

    print('DEBUG: Screen height: ${screenSize.height}');
    print('DEBUG: Dialog top position: $topPosition');

    widget.onDialogStateChanged?.call(true);
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      useRootNavigator: false,
      builder: (context) => GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surface,
                  child: AttachmentDialog(
                    controller: widget.controller,
                    room: widget.controller.room,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ).then((_) => widget.onDialogStateChanged?.call(false));
  }

  /// Sends pasted media (image or video) with optional caption
  /// Clears UI immediately for instant feedback, then sends in background
  void _sendPastedImage() async {
    if (_pastedImageBytes == null) return;
    
    // Capture data before clearing UI
    final caption = widget.controller.sendController.text.trim();
    final imageBytes = _pastedImageBytes!;
    final imageName = _pastedImageName ?? 'image_${DateTime.now().millisecondsSinceEpoch}.${_pastedImageMimeType?.split('/').last ?? 'png'}';
    final mimeType = _pastedImageMimeType ?? 'image/png';
    
    // Clear UI immediately for instant feedback
    widget.controller.sendController.clear();
    setState(() {
      _pastedImageBytes = null;
      _pastedImageMimeType = null;
      _pastedImageName = null;
    });
    
    // Send in background
    try {
      // Detect if pasted content is video or image
      final isVideo = mimeType.startsWith('video/');
      
      // Create appropriate Matrix file type
      final matrixFile = isVideo
          ? MatrixVideoFile(
              bytes: imageBytes,
              name: imageName,
              mimeType: mimeType,
            )
          : MatrixImageFile(
              bytes: imageBytes,
              name: imageName,
              mimeType: mimeType,
            );
      
      // Send media with caption if provided
      await widget.controller.room.sendFileEvent(
        matrixFile,
        inReplyTo: widget.controller.replyEvent,
        extraContent: caption.isNotEmpty ? {'body': caption} : null,
      );
    } catch (e) {
      Logs().e('Error sending pasted media', e);
    }
  }

  /// Clears pasted media preview
  void _clearPastedImage() {
    setState(() {
      _pastedImageBytes = null;
      _pastedImageMimeType = null;
      _pastedImageName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const height = 48.0;

    final hasFocus = widget.controller.inputFocus.hasFocus;

    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xff262845).withValues(alpha: 0.95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: widget.controller.showVoiceRecorder
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InlineVoiceRecorder(
                onRecordingComplete: widget.controller.onVoiceRecordingComplete,
                onCancel: widget.controller.cancelVoiceRecording,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Pasted media preview (image or video)
                if (_pastedImageBytes != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F252D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          // Show play icon for videos, thumbnail for images
                          child: _pastedImageMimeType?.startsWith('video/') == true
                              ? Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.black87,
                                  child: const Icon(
                                    Icons.play_circle_outline,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                )
                              : Image.memory(
                                  _pastedImageBytes!,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Display filename
                              Text(
                                _pastedImageName ?? 'media.${_pastedImageMimeType?.split('/').last ?? 'png'}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Show 'Video' label for video files
                              if (_pastedImageMimeType?.startsWith('video/') == true)
                                const Text(
                                  'Video',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: _clearPastedImage,
                        ),
                      ],
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                // const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16),
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(0, 56, 56, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            constraints: const BoxConstraints(
                              minHeight: 48,
                              maxHeight: 144, // 6 lines * 24px line height
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF1F252D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: TextField(
                              controller: widget.controller.sendController,
                              focusNode: widget.controller.inputFocus,
                              minLines: 1,
                              maxLines: null,
                              onChanged: widget.controller.onInputBarChanged,
                              textInputAction: TextInputAction.newline,
                              // Handle pasted images/videos from clipboard
                              contentInsertionConfiguration: ContentInsertionConfiguration(
                                allowedMimeTypes: const ['image/*', 'video/*'],
                                onContentInserted: (KeyboardInsertedContent content) {
                                  if (content.hasData) {
                                    final data = content.data;
                                    if (data != null) {
                                      // Generate filename with timestamp
                                      final extension = content.mimeType?.split('/').last ?? 'png';
                                      final timestamp = DateTime.now().millisecondsSinceEpoch;
                                      setState(() {
                                        _pastedImageBytes = data;
                                        _pastedImageMimeType = content.mimeType ?? 'image/png';
                                        _pastedImageName = 'image_$timestamp.$extension';
                                      });
                                    }
                                  }
                                },
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: L10n.of(context).typeMessage,
                                hintStyle: const TextStyle(
                                  color: Color(0xFF8B8988),
                                  fontSize: 14,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                isDense: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Image.asset(
                      'assets/images/icons/add-circle.png',
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _showAttachmentDialog(context);
                    },
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: widget.controller.sendController,
                    builder: (context, value, child) {
                      final hasText = value.text.trim().isNotEmpty;
                      final hasPastedImage = _pastedImageBytes != null;
                      return (hasText || hasPastedImage)
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              icon: Image.asset(
                                'assets/images/icons/Send (3).png',
                                width: 60,
                                height: 60,
                              ),
                              onPressed: () {
                                if (hasPastedImage) {
                                  _sendPastedImage();
                                } else if (hasText) {
                                  widget.controller.send();
                                }
                              },
                            )
                          : IconButton(
                              padding: EdgeInsets.zero,
                              icon: Image.asset(
                                'assets/images/new_icons/ic_voice.png',
                                width: 32,
                                height: 32,
                                color: Colors.white,
                              ),
                              onPressed: widget.controller.voiceMessageAction,
                            );
                    },
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
    );
  }
}
