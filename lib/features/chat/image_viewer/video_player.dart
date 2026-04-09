import 'dart:io';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/adaptive_loader_widget.dart';
import 'package:bmp/shared/utils/error_reporter.dart';
import 'package:bmp/shared/utils/localized_exception_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/event_extension.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/blur_hash.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:video_player/video_player.dart';

import 'package:bmp/shared/widgets/mxc_image.dart';

class EventVideoPlayer extends StatefulWidget {
  final Event event;

  const EventVideoPlayer(
    this.event, {
    super.key,
  });

  @override
  EventVideoPlayerState createState() => EventVideoPlayerState();
}

class EventVideoPlayerState extends State<EventVideoPlayer> {
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;

  // The video_player package only doesn't support Windows and Linux.
  final _supportsVideoPlayer =
      !PlatformInfos.isWindows && !PlatformInfos.isLinux;

  // Detected video aspect ratio
  double? _videoAspectRatio;
  bool _isPortrait = false;

  void _downloadAction() async {
    if (!_supportsVideoPlayer) {
      widget.event.saveFile(context);
      return;
    }

    try {
      final videoFile = await widget.event.downloadAndDecryptAttachment();

      // Dispose the controllers if we already have them.
      _disposeControllers();
      late VideoPlayerController videoPlayerController;

      // Create the VideoPlayerController from the contents of videoFile.
      if (kIsWeb) {
        final blob = html.Blob([videoFile.bytes]);
        final networkUri = Uri.parse(html.Url.createObjectUrlFromBlob(blob));
        videoPlayerController = VideoPlayerController.networkUrl(networkUri);
      } else {
        final tempDir = await getTemporaryDirectory();
        final fileName = Uri.encodeComponent(
          widget.event.attachmentOrThumbnailMxcUrl()!.pathSegments.last,
        );
        final file = File('${tempDir.path}/${fileName}_${videoFile.name}');
        if (await file.exists() == false) {
          await file.writeAsBytes(videoFile.bytes);
        }
        videoPlayerController = VideoPlayerController.file(file);
      }
      _videoPlayerController = videoPlayerController;

      await videoPlayerController.initialize();

      // Get actual video dimensions from the controller
      final videoSize = videoPlayerController.value.size;
      double aspectRatio;
      bool isPortrait;
      
      if (videoSize != Size.zero) {
        // Use the actual video dimensions from the player
        aspectRatio = videoSize.width / videoSize.height;
        isPortrait = videoSize.height > videoSize.width;
      } else {
        // Fallback to metadata if available
        final infoMap = widget.event.content.tryGetMap<String, Object?>('info');
        final videoWidth = infoMap?.tryGet<int>('w') ?? 400;
        final videoHeight = infoMap?.tryGet<int>('h') ?? 300;
        aspectRatio = videoHeight == 0 ? 16 / 9 : videoWidth / videoHeight;
        isPortrait = videoHeight > videoWidth;
      }

      // Create a ChewieController on top with proper aspect ratio.
      setState(() {
        _videoAspectRatio = aspectRatio;
        _isPortrait = isPortrait;
        _chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          showControlsOnInitialize: false,
          autoPlay: true,
          autoInitialize: true,
          looping: true,
          aspectRatio: aspectRatio,
          allowFullScreen: true,
          allowMuting: true,
          showOptions: true,
          materialProgressColors: ChewieProgressColors(
            playedColor: const Color(0xFFA912BF),
            handleColor: const Color(0xFFA912BF),
            backgroundColor: Colors.white24,
            bufferedColor: Colors.white38,
          ),
          placeholder: Container(
            color: Colors.black,
            child: const Center(
              child: AdaptiveLoaderWidget(),
            ),
          ),
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white70,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );
      });
    } on IOException catch (e) {
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: e.toLocalizedString(context),
        type: SnackbarType.error,
      );
    } catch (e, s) {
      ErrorReporter(context, L10n.of(context).unableToPlayVideo).onErrorCallback(e, s);
    }
  }

  void _disposeControllers() {
    _chewieController?.dispose();
    _videoPlayerController?.dispose();
    _chewieController = null;
    _videoPlayerController = null;
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _downloadAction();
    });
  }

  static const String fallbackBlurHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I';

  @override
  Widget build(BuildContext context) {
    final hasThumbnail = widget.event.hasThumbnail;
    final blurHash = (widget.event.infoMap as Map<String, dynamic>)
            .tryGet<String>('xyz.amorgan.blurhash') ??
        fallbackBlurHash;
    final infoMap = widget.event.content.tryGetMap<String, Object?>('info');
    final videoWidth = infoMap?.tryGet<int>('w') ?? 400;
    final videoHeight = infoMap?.tryGet<int>('h') ?? 300;
    
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate placeholder dimensions maintaining aspect ratio
    final placeholderAspectRatio = videoHeight == 0 ? 16 / 9 : videoWidth / videoHeight;
    final placeholderIsPortrait = videoHeight > videoWidth;
    
    double placeholderWidth, placeholderHeight;
    if (placeholderIsPortrait) {
      // Portrait: constrain by height first
      placeholderHeight = screenHeight * 0.7;
      placeholderWidth = placeholderHeight * placeholderAspectRatio;
      if (placeholderWidth > screenWidth * 0.9) {
        placeholderWidth = screenWidth * 0.9;
        placeholderHeight = placeholderWidth / placeholderAspectRatio;
      }
    } else {
      // Landscape: constrain by width first
      placeholderWidth = screenWidth * 0.9;
      placeholderHeight = placeholderWidth / placeholderAspectRatio;
      if (placeholderHeight > screenHeight * 0.7) {
        placeholderHeight = screenHeight * 0.7;
        placeholderWidth = placeholderHeight * placeholderAspectRatio;
      }
    }

    final chewieController = _chewieController;

    if (chewieController != null) {
      // Video is ready - display with proper aspect ratio
      final aspectRatio = _videoAspectRatio ?? (videoHeight == 0 ? 16 / 9 : videoWidth / videoHeight);
      final isPortrait = _isPortrait || videoHeight > videoWidth;
      
      // Calculate video display size based on aspect ratio
      double displayWidth, displayHeight;
      if (isPortrait) {
        // Portrait video: constrain by height, maintain aspect ratio
        displayHeight = screenHeight * 0.75;
        displayWidth = displayHeight * aspectRatio;
        // If width exceeds screen, constrain by width instead
        if (displayWidth > screenWidth * 0.95) {
          displayWidth = screenWidth * 0.95;
          displayHeight = displayWidth / aspectRatio;
        }
      } else {
        // Landscape video: constrain by width, maintain aspect ratio
        displayWidth = screenWidth * 0.95;
        displayHeight = displayWidth / aspectRatio;
        // If height exceeds screen, constrain by height instead
        if (displayHeight > screenHeight * 0.75) {
          displayHeight = screenHeight * 0.75;
          displayWidth = displayHeight * aspectRatio;
        }
      }

      return Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            width: displayWidth,
            height: displayHeight,
            child: Chewie(controller: chewieController),
          ),
        ),
      );
    }

    // Loading state - show thumbnail or blur hash with loading indicator
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Hero(
              tag: widget.event.eventId,
              child: hasThumbnail
                  ? MxcImage(
                      event: widget.event,
                      isThumbnail: true,
                      width: placeholderWidth,
                      height: placeholderHeight,
                      fit: BoxFit.cover,
                      placeholder: (context) => BlurHash(
                        blurhash: blurHash,
                        width: placeholderWidth,
                        height: placeholderHeight,
                        fit: BoxFit.cover,
                      ),
                    )
                  : BlurHash(
                      blurhash: blurHash,
                      width: placeholderWidth,
                      height: placeholderHeight,
                    ),
            ),
          ),
        ),
        // Loading overlay with gradient and spinner
        Center(
          child: Container(
            width: placeholderWidth,
            height: placeholderHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdaptiveLoaderWidget(),
                  SizedBox(height: 16),
                  Text(
                    'Loading video...',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}