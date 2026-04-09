import 'dart:io';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_file_extension.dart';
import 'package:cross_file/cross_file.dart';
import 'package:video_player/video_player.dart';
import 'chat.dart';

class GalleryMediaPreview extends StatefulWidget {
  final List<String> mediaPaths;
  final ChatController controller;
  final Room room;

  const GalleryMediaPreview({
    required this.mediaPaths,
    required this.controller,
    required this.room,
    super.key,
  });

  @override
  State<GalleryMediaPreview> createState() => _GalleryMediaPreviewState();
}

class _GalleryMediaPreviewState extends State<GalleryMediaPreview> {
  final TextEditingController _messageController = TextEditingController();
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isSending = false;
  List<String> _mediaPaths = [];
  int? _deleteIndex;
  final Map<int, VideoPlayerController> _videoControllers = {};
  double _startTrim = 0.0;
  double _endTrim = 1.0;
  double _currentPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _mediaPaths = List.from(widget.mediaPaths);
    _initializeVideoControllers();
  }

  void _initializeVideoControllers() {
    for (var i = 0; i < _mediaPaths.length; i++) {
      final path = _mediaPaths[i];
      if (_isVideo(path)) {
        _videoControllers[i] = VideoPlayerController.file(File(path))
          ..initialize().then((_) {
            if (mounted) setState(() {});
          })
          ..addListener(() {
            if (mounted && _videoControllers[i]?.value.isInitialized == true) {
              final controller = _videoControllers[i]!;
              setState(() {
                _currentPosition = controller.value.position.inMilliseconds / 
                    controller.value.duration.inMilliseconds;
              });
            }
          });
      }
    }
  }

  bool _isVideo(String path) {
    return path.toLowerCase().endsWith('.mp4') || 
           path.toLowerCase().endsWith('.mov') || 
           path.toLowerCase().endsWith('.avi');
  }

  @override
  void dispose() {
    _messageController.dispose();
    _pageController.dispose();
    for (final controller in _videoControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _sendMedia() async {
    if (_isSending) return;
    setState(() => _isSending = true);

    try {
      final caption = _messageController.text.trim();
      
      if (_mediaPaths.length == 1) {
        // Single media with caption
        final file = XFile(_mediaPaths.first);
        final matrixFile = MatrixFile(
          bytes: await file.readAsBytes(),
          name: file.name,
          mimeType: file.mimeType,
        ).detectFileType;

        if (_isVideo(_mediaPaths.first)) {
          // Video - don't shrink
          await widget.room.sendFileEvent(
            matrixFile,
            extraContent: caption.isNotEmpty ? {'body': caption} : null,
          );
        } else {
          // Image - shrink
          await widget.room.sendFileEvent(
            matrixFile,
            shrinkImageMaxDimension: 1600,
            extraContent: caption.isNotEmpty ? {'body': caption} : null,
          );
        }
      } else {
        // Multiple images - send as gallery with single caption message
        // First send all images without captions
        for (final path in _mediaPaths) {
          final file = XFile(path);
          final matrixFile = MatrixFile(
            bytes: await file.readAsBytes(),
            name: file.name,
            mimeType: file.mimeType,
          ).detectFileType;

          await widget.room.sendFileEvent(
            matrixFile,
            shrinkImageMaxDimension: 1600,
          );
        }
        
        // Then send caption as a separate message if provided
        if (caption.isNotEmpty) {
          await widget.room.sendTextEvent(caption);
        }
      }

      // Close gallery and preview
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } catch (e) {
    CustomSnackbar.show(
  context,
  title: L10n.of(context).error,
  message: '${L10n.of(context).error} $e',
  type: SnackbarType.error,
);

    } finally {
      setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main image viewer
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _mediaPaths.length,
            itemBuilder: (context, index) {
              final path = _mediaPaths[index];
              if (_isVideo(path)) {
                final controller = _videoControllers[index];
                if (controller != null && controller.value.isInitialized) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (controller.value.isPlaying) {
                            controller.pause();
                          } else {
                            controller.play();
                          }
                          // Reset trim values when switching videos
                          _startTrim = 0.0;
                          _endTrim = 1.0;
                        });
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          ),
                          if (!controller.value.isPlaying)
                            const Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                              size: 64,
                            ),
                          // Video trimmer overlay
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: _buildVideoTrimmer(controller),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(child: AppLoadingWidget());
                }
              } else {
                return Center(
                  child: Image.file(
                    File(path),
                    fit: BoxFit.contain,
                  ),
                );
              }
            },
          ),
          
          // Top bar
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  ),
                  const Spacer(),
                  Text(
                    '${_currentIndex + 1} of ${_mediaPaths.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
          
          // Bottom section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Thumbnails
                    if (_mediaPaths.length > 1)
                      Container(
                        height: 80,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _mediaPaths.length,
                          itemBuilder: (context, index) {
                            final isSelected = index == _currentIndex;
                            return GestureDetector(
                              onTap: () {
                                if (_deleteIndex == index) {
                                  setState(() {
                                    _deleteIndex = null;
                                  });
                                } else {
                                  _pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              onLongPress: () {
                                setState(() {
                                  _deleteIndex = index;
                                });
                              },
                              child: Container(
                                // width: 90,
                                height: 90,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected ? Colors.white : Colors.transparent,
                                    // width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: _isVideo(_mediaPaths[index])
                                          ? Container(
                                              width: 60,
                                              height: 90,
                                              color: Colors.black,
                                              child: const Icon(
                                                Icons.play_circle_outline,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            )
                                          : Image.file(
                                              File(_mediaPaths[index]),
                                              fit: BoxFit.cover,
                                              width: 60,
                                              height: 90,
                                            ),
                                    ),
                                    if (_deleteIndex == index)
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _mediaPaths.removeAt(index);
                                                _deleteIndex = null;
                                                if (_currentIndex >= _mediaPaths.length) {
                                                  _currentIndex = _mediaPaths.length - 1;
                                                }
                                                if (_mediaPaths.isEmpty) {
                                                  Navigator.pop(context);
                                                }
                                              });
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    
                    // Message input and send button
                    Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              style:  const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText:L10n.of(context).addCaption,
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                              maxLines: 3,
                              minLines: 1,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(4),
                            child: SizedBox(
                              width: 58,
                              height: 58,
                              child: _isSending
                                  ? const AppLoadingWidget()
                                  : IconButton(
                                      onPressed: _sendMedia,
                                      icon: Image.asset(
                                        'assets/icons/Send-video-image.png',
                                        width: 58,
                                        height: 58,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoTrimmer(VideoPlayerController controller) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white30),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                // Video frames preview (simplified)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: List.generate(8, (index) {
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 1),
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            border: Border.all(color: Colors.grey[600]!),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                // Trim overlay
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          // Left trim overlay
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            width: constraints.maxWidth * _startTrim,
                            child: Container(color: Colors.black54),
                          ),
                          // Right trim overlay
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            width: constraints.maxWidth * (1 - _endTrim),
                            child: Container(color: Colors.black54),
                          ),
                          // Start trim handle
                          Positioned(
                            left: constraints.maxWidth * _startTrim - 5,
                            top: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onHorizontalDragUpdate: (details) {
                                setState(() {
                                  _startTrim = ((_startTrim * constraints.maxWidth + details.delta.dx) / constraints.maxWidth)
                                      .clamp(0.0, _endTrim - 0.1);
                                });
                              },
                              child: Container(
                                width: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    bottomLeft: Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // End trim handle
                          Positioned(
                            left: constraints.maxWidth * _endTrim - 5,
                            top: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onHorizontalDragUpdate: (details) {
                                setState(() {
                                  _endTrim = ((_endTrim * constraints.maxWidth + details.delta.dx) / constraints.maxWidth)
                                      .clamp(_startTrim + 0.1, 1.0);
                                });
                              },
                              child: Container(
                                width: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    bottomRight: Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Playhead indicator
                          Positioned(
                            left: constraints.maxWidth * _currentPosition - 1,
                            top: -5,
                            bottom: 0,
                            child: Container(
                              width: 2,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}