import 'dart:io';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_file_extension.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/utils/video_trimmer.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:video_player/video_player.dart';

import 'chat.dart';
import 'custom_camera_screen.dart';
import 'gallery_selector_screen.dart';

class MediaPreviewScreen extends StatefulWidget {
  final String mediaPath;
  final bool isVideo;
  final ChatController controller;
  final Room room;

  const MediaPreviewScreen({
    required this.mediaPath,
    required this.isVideo,
    required this.controller,
    required this.room,
    super.key,
  });

  @override
  State<MediaPreviewScreen> createState() => _MediaPreviewScreenState();
}

class _MediaPreviewScreenState extends State<MediaPreviewScreen> {
  final TextEditingController _messageController = TextEditingController();
  VideoPlayerController? _videoController;
  final List<VideoPlayerController> _trimmerControllers = [];
  bool _compress = true;
  bool _isSending = false;
  double _startTrim = 0.0;
  double _endTrim = 1.0;
  double _currentPosition = 0.0;
  int _lastUpdateTime = 0;
  List<String> _selectedImages = [];
  int _currentImageIndex = 0;

  String _getAvailableText() {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'es' ? 'Disponible' : 'Available';
  }

  String _getTypeMessageText() {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'es' ? 'Escribe un mensaje..' : 'Type message..';
  }

  String _getErrorText(String error) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'es' ? 'Error: $error' : 'Error: $error';
  }

  @override
  void initState() {
    super.initState();
    _selectedImages.add(widget.mediaPath);
    if (widget.isVideo) {
      print('Initializing video controller for: ${widget.mediaPath}');
      _videoController = VideoPlayerController.file(File(widget.mediaPath))
        ..initialize().then((_) {
          print('Video controller initialized successfully');
          setState(() {});
          _applyTrimming();
          // Listen to video position for playhead indicator
          _videoController!.addListener(() {
            if (!mounted) return;
            if (_videoController!.value.isInitialized &&
                _videoController!.value.isPlaying) {
              final currentTime = DateTime.now().millisecondsSinceEpoch;
              if (currentTime - _lastUpdateTime > 100) {
                _lastUpdateTime = currentTime;
                final position =
                    _videoController!.value.position.inMilliseconds /
                        _videoController!.value.duration.inMilliseconds;

                // Stop at end trim - NO LOOPING
                if (position >= _endTrim) {
                  _videoController!.pause();
                  return;
                }

                // Calculate position within trimmed range
                if (position >= _startTrim && position <= _endTrim) {
                  final trimmedPosition =
                      (position - _startTrim) / (_endTrim - _startTrim);
                  setState(() {
                    _currentPosition = trimmedPosition.clamp(0.0, 1.0);
                  });
                }
              }
            }
          });
          // Initialize trimmer controllers
          _initializeTrimmerControllers();
        }).catchError((error) {
          print('Error initializing video controller: $error');
        });
    }
  }

  void _initializeTrimmerControllers() async {
    if (_videoController == null || !_videoController!.value.isInitialized)
      return;

    for (var i = 0; i < 10; i++) {
      final controller = VideoPlayerController.file(File(widget.mediaPath));
      await controller.initialize();
      final position =
          _videoController!.value.duration.inMilliseconds * (i / 10);
      await controller.seekTo(Duration(milliseconds: position.toInt()));
      _trimmerControllers.add(controller);
    }
    if (mounted) setState(() {});
  }

  void _applyTrimming() {
    if (_videoController != null && _videoController!.value.isInitialized) {
      _seekToTrimStart();
    }
  }

  void _seekToTrimStart() {
    if (_videoController != null && _videoController!.value.isInitialized) {
      final startTime =
          _videoController!.value.duration.inMilliseconds * _startTrim;
      _videoController!.seekTo(Duration(milliseconds: startTime.toInt()));
    }
  }

  Future<File> _trimVideo() async {
    if (_videoController == null || !_videoController!.value.isInitialized) {
      return File(widget.mediaPath);
    }

    try {
      final duration = _videoController!.value.duration;
      final startSeconds = (duration.inMilliseconds * _startTrim) / 1000;
      final endSeconds = (duration.inMilliseconds * _endTrim) / 1000;

      final trimmedFile = await VideoTrimmer.trimVideo(
        inputPath: widget.mediaPath,
        startTime: startSeconds,
        endTime: endSeconds,
      );

      return trimmedFile ?? File(widget.mediaPath);
    } catch (e) {
      print('Error trimming video: $e');
      return File(widget.mediaPath);
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    for (final controller in _trimmerControllers) {
      controller.dispose();
    }
    _messageController.dispose();
    super.dispose();
  }

  Widget _buildVideoTrimmer() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        height: context.screenHeight * 0.07,
        child: Column(
          children: [
            Container(
              height: 42,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF232C37),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.screenWidth * 0.08,
                          height: context.screenHeight * 0.06,
                          margin: EdgeInsets.only(
                            right: context.screenWidth * 0.005,
                          ),
                          child: index < _trimmerControllers.length &&
                                  _trimmerControllers[index].value.isInitialized
                              ? AspectRatio(
                                  aspectRatio: _trimmerControllers[index]
                                      .value
                                      .aspectRatio,
                                  child:
                                      VideoPlayer(_trimmerControllers[index]),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.videocam,
                                      color: Colors.grey[600],
                                      size: 16,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              width: constraints.maxWidth * _startTrim,
                              child: Container(color: Colors.black54),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              width: constraints.maxWidth * (1 - _endTrim),
                              child: Container(color: Colors.black54),
                            ),
                            Positioned(
                              left: constraints.maxWidth * _startTrim,
                              top: 0,
                              bottom: 0,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onPanStart: (details) {},
                                onPanUpdate: (details) {
                                  setState(() {
                                    _startTrim =
                                        ((_startTrim * constraints.maxWidth +
                                                    details.delta.dx) /
                                                constraints.maxWidth)
                                            .clamp(0.0, _endTrim - 0.1);
                                  });
                                  _applyTrimming();
                                },
                                onPanEnd: (details) {},
                                onHorizontalDragUpdate: (details) {
                                  setState(() {
                                    _startTrim =
                                        ((_startTrim * constraints.maxWidth +
                                                    details.delta.dx) /
                                                constraints.maxWidth)
                                            .clamp(0.0, _endTrim - 0.1);
                                  });
                                  _applyTrimming();
                                },
                                child: Container(
                                  width: 7,
                                  decoration: BoxDecoration(
                                    color:const Color(0xFF222C37),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 3,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 1,
                                        ),
                                        decoration: BoxDecoration(
                                          color:const Color(0xFF485F72),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: constraints.maxWidth * _endTrim - 7,
                              top: 0,
                              bottom: 0,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onPanStart: (details) {},
                                onPanUpdate: (details) {
                                  setState(() {
                                    _endTrim =
                                        ((_endTrim * constraints.maxWidth +
                                                    details.delta.dx) /
                                                constraints.maxWidth)
                                            .clamp(_startTrim + 0.1, 1.0);
                                  });
                                  _applyTrimming();
                                },
                                onPanEnd: (details) {},
                                onHorizontalDragUpdate: (details) {
                                  setState(() {
                                    _endTrim =
                                        ((_endTrim * constraints.maxWidth +
                                                    details.delta.dx) /
                                                constraints.maxWidth)
                                            .clamp(_startTrim + 0.1, 1.0);
                                  });
                                  _applyTrimming();
                                },
                                child: Container(
                                  width: 7,
                                  decoration: BoxDecoration(
                                    color:const Color(0xFF222C37),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Container(
                                        height: 18,
                                        width: 3,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 1,
                                        ),
                                        decoration: BoxDecoration(
                                          color:const Color(0xFF485F72),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    
                                     
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: constraints.maxWidth * _startTrim +
                                  (constraints.maxWidth *
                                      (_endTrim - _startTrim) *
                                      _currentPosition) -
                                  1.5,
                              top: -context.screenHeight * 0.008,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Container(
                                    width: context.screenWidth * 0.015,
                                    height: context.screenWidth * 0.025,
                                    decoration: BoxDecoration(
                                      color:const Color(0xFF222C37),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 5,
                                      color:const Color(0xFF222C37),
                                    ),
                                  ),
                                ],
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
            SizedBox(height: context.screenHeight * 0.005),
          ],
        ),
      ),
    );
  }

  void _sendMedia() async {
    if (_isSending) return;
    setState(() => _isSending = true);

    try {
      final caption = _messageController.text.trim();

      // Send each media file with caption only on the first one
      for (var i = 0; i < _selectedImages.length; i++) {
        final path = _selectedImages[i];
        var fileToSend = File(path);

        // If it's a video and trimming is applied, trim the video
        if (widget.isVideo && (_startTrim > 0.0 || _endTrim < 1.0)) {
          final trimmedFile = await _trimVideo();
          fileToSend = trimmedFile;
        }

        final file = XFile(fileToSend.path);
        final matrixFile = MatrixFile(
          bytes: await file.readAsBytes(),
          name: file.name,
          mimeType: file.mimeType,
        ).detectFileType;

        await widget.room.sendFileEvent(
          matrixFile,
          shrinkImageMaxDimension: _compress ? 1600 : null,
          extraContent:
              (i == 0 && caption.isNotEmpty) ? {'body': caption} : null,
        );
      }

      Navigator.of(context).pop();
    } catch (e) {
     CustomSnackbar.show(
  context,
  title: L10n.of(context).error,
  message: '${L10n.of(context).error} ${_getErrorText(e.toString())}',
  type: SnackbarType.error,
);

    } finally {
      setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final otherUser = widget.room.directChatMatrixID != null
        ? widget.room
            .unsafeGetUserFromMemoryOrFallback(widget.room.directChatMatrixID!)
        : null;
    final bottomMargin = MediaQuery.of(context).viewPadding.bottom +
        MediaQuery.of(context).size.height * 0.01;

    return Scaffold(
      backgroundColor: const Color(0XFF1B1C30).withOpacity(1.0),
      body: SelectionContainer.disabled(
        child: Stack(
        children: [
          // Header
          SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(context.screenWidth * 0.025),
                  height: context.screenHeight * 0.08,
                  padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenWidth * 0.03),
                  decoration: BoxDecoration(
                    color: const Color(0x7F131EBF).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
                    border: Border.all(
                      width: 0.5,
                      color: const Color(0x7F131EBF).withOpacity(1.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Close Button
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomCameraScreen(
                                controller: widget.controller,
                                room: widget.room,
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/icons/close-circle.png',
                          fit: BoxFit.cover,
                          width: context.screenWidth * 0.08,
                          height: context.screenWidth * 0.08,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.015),
                      // Profile Image
                      Container(
                        width: context.screenWidth * 0.1,
                        height: context.screenWidth * 0.1,
                        decoration: BoxDecoration(
                          color: const Color(0xFF282130),
                          shape:BoxShape.circle,
                        ),
                        child: otherUser?.avatarUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(context.screenWidth * 0.08),
                                child: MxcImage(
                                  uri: otherUser!.avatarUrl!,
                                  width: context.screenWidth * 0.1,
                                  height: context.screenWidth * 0.1,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.person,
                                color: Colors.white,
                                size: context.screenWidth * 0.045,
                              ),
                      ),
                      SizedBox(width: context.screenWidth * 0.025),
                      // Name and Status
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              otherUser?.displayName ?? widget.room.name,
                              style: TextStyle(
                                color: const Color(0xFFF3F3F3),
                                fontSize: context.screenWidth * 0.034,
                                fontFamily: 'All Round Gothic',
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            //SizedBox(height: context.screenHeight * 0.001),
                            Text(
                              _getAvailableText(),
                              style: TextStyle(
                                color: const Color(0xFFA8A6A5),
                                fontSize: context.screenWidth * 0.024,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // HD Toggle
                      GestureDetector(
                        onTap: () => setState(() => _compress = !_compress),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * 0.012,
                            vertical: context.screenHeight * 0.0025,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _compress
                                  ? Colors.white
                                  : const Color(0xFF2D1B69),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(context.screenWidth * 0.01),
                            color: _compress
                                ? Colors.transparent
                                : const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Text(
                            'HD',
                            style: TextStyle(
                              color: _compress
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : Colors.black, 
                              fontSize: context.screenWidth * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.02),
                      // Count
                      Text(
                        '${_selectedImages.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.035,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.04),
                      // Send Button
                      GestureDetector(
                        onTap: _isSending ? null : _sendMedia,
                        child: Image.asset(
                          'assets/images/icons/tick-circle.png',
                          width: context.screenWidth * 0.08,
                          height: context.screenWidth * 0.08,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 0),
                // Media Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: context.screenWidth * 0.025,
                      right: context.screenWidth * 0.025,
                      top: 0,
                      bottom: context.screenHeight * 0.15,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFF202267)),
                              borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
                              child: Stack(
                                children: [
                                  widget.isVideo
                                      ? (_videoController != null &&
                                              _videoController!
                                                  .value.isInitialized)
                                          ? GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (_videoController!
                                                      .value.isPlaying) {
                                                    _videoController!.pause();
                                                  } else {
                                                    _seekToTrimStart();
                                                    _videoController!.play();
                                                  }
                                                });
                                              },
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: SizedBox(
                                                        width: _videoController!
                                                            .value.size.width,
                                                        height:
                                                            _videoController!
                                                                .value
                                                                .size
                                                                .height,
                                                        child: VideoPlayer(
                                                          _videoController!,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (!_videoController!
                                                      .value.isPlaying)
                                                    Image.asset(
                                                      "assets/icons/play-circle.png",
                                                      height: context.screenHeight * 0.09,
                                                      width: context.screenHeight * 0.09,
                                                    ),
                                                ],
                                              ),
                                            )
                                          : AppLoadingWidget()
                                      : GestureDetector(
                                          onTap: () {
                                            if (_selectedImages.length > 1) {
                                              setState(() {
                                                _currentImageIndex =
                                                    (_currentImageIndex + 1) %
                                                        _selectedImages.length;
                                              });
                                            }
                                          },
                                          child: Image.file(
                                            File(
                                              _selectedImages[
                                                  _currentImageIndex],
                                            ),
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                  if (widget.isVideo &&
                                      _videoController != null &&
                                      _videoController!.value.isInitialized)
                                    Positioned(
                                      bottom: 10,
                                      left: 0,
                                      right: 0,
                                      child: _buildVideoTrimmer(),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Input Section
          Positioned(
            left: 0,
            bottom: context.percentHeight * 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.50, 0.00),
                  end: Alignment(0.50, 1.00),
                  colors: [Color(0x001F252D), Color(0xFF1F252D)],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image thumbnails strip
                  if (_selectedImages.length > 1)
                    Container(
                      height: context.screenHeight * 0.1,
                      margin: EdgeInsets.symmetric(
                        horizontal: context.screenWidth * 0.02,
                        vertical: context.screenHeight * 0.01,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedImages.length,
                        itemBuilder: (context, index) {
                          final isSelected = index == _currentImageIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentImageIndex = index;
                              });
                            },
                            onLongPress: () {
                              if (_selectedImages.length > 1) {
                                setState(() {
                                  _selectedImages.removeAt(index);
                                  if (_currentImageIndex >=
                                      _selectedImages.length) {
                                    _currentImageIndex =
                                        _selectedImages.length - 1;
                                  }
                                });
                              }
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: _selectedImages[index]
                                            .toLowerCase()
                                            .endsWith('.mp4') ||
                                        _selectedImages[index]
                                            .toLowerCase()
                                            .endsWith('.mov') ||
                                        _selectedImages[index]
                                            .toLowerCase()
                                            .endsWith('.avi')
                                    ? Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        color: Colors.black,
                                        child: const Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      )
                                    : Image.file(
                                        File(_selectedImages[index]),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  // Message Input (EXACT same as chat)
                  Container(
                    margin: EdgeInsets.only(
                      left: context.screenHeight * 0.01,
                      right: context.screenHeight * 0.01,
                      bottom: bottomMargin,
                    ),
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    alignment: Alignment.center,
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      color: const Color(0XFF262845).withOpacity(0.95),
                      borderRadius: BorderRadius.all(
                        Radius.circular(context.screenWidth * 0.05),
                      ),
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: context.screenWidth * 0.04),
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  minHeight: context.screenHeight * 0.05,
                                  maxHeight: context.screenHeight * 0.14,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.screenWidth * 0.04,
                                  vertical: context.screenHeight * 0.01,
                                ),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF1F252D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(context.screenWidth * 0.09),
                                  ),
                                ),
                                child: TextField(
                                  controller: _messageController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 6,
                                  minLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: context.screenWidth * 0.035,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: _getTypeMessageText(),
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF8B8988),
                                      fontSize: context.screenWidth * 0.035,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: context.screenWidth * 0.015),
                            SizedBox(
                              width: context.screenWidth * 0.08,
                              height: context.screenWidth * 0.08,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Image.asset(
                                  'assets/images/icons/add-circle.png',
                                  width: context.screenWidth * 0.08,
                                  height: context.screenWidth * 0.08,
                                  color: Colors.white,
                                ),
                                onPressed: () async {
                                  final result =
                                      await Navigator.push<List<String>>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GallerySelectorScreen(
                                        preSelectedImages: _selectedImages,
                                      ),
                                    ),
                                  );
                                  if (result != null) {
                                    setState(() {
                                      _selectedImages = result;
                                      if (_currentImageIndex >=
                                          _selectedImages.length) {
                                        _currentImageIndex =
                                            _selectedImages.length - 1;
                                      }
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: context.screenWidth * 0.015),
                            SizedBox(
                              width: context.screenWidth * 0.15,
                              height: context.screenWidth * 0.15,
                              child: Stack(
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Image.asset(
                                      'assets/icons/Send-video-image.png',
                                      width: context.screenWidth * 0.225,
                                      height: context.screenWidth * 0.225,
                                    ),
                                    onPressed: _isSending ? null : _sendMedia,
                                  ),
                                  if (_selectedImages.length > 1)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.all(context.screenWidth * 0.01),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '${_selectedImages.length}',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: context.screenWidth * 0.03,
                                            fontWeight: FontWeight.bold,
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
                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          if (_isSending)
            Container(
              color: Colors.black54,
              child: AppLoadingWidget(),
            ),
        ],
      ),
      ),
    );
  }
}
