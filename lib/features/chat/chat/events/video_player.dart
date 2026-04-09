import 'dart:io';
import 'dart:typed_data';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/shared/utils/file_description.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/event_extension.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:bmp/shared/widgets/blur_hash.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../image_viewer/image_viewer.dart';

class EventVideoPlayer extends StatefulWidget {
  final Event event;
  final Timeline? timeline;
  final Color? textColor;
  final Color? linkColor;
  final bool tapToView;

  const EventVideoPlayer(
    this.event, {
    this.timeline,
    this.textColor,
    this.linkColor,
    this.tapToView = true,
    super.key,
  });

  @override
  State<EventVideoPlayer> createState() => _EventVideoPlayerState();
}

class _EventVideoPlayerState extends State<EventVideoPlayer> {
  Uint8List? _thumbnailData;
  bool _isGeneratingThumbnail = false;

  static const String fallbackBlurHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I';

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    if (_isGeneratingThumbnail || _thumbnailData != null) return;
    
    setState(() {
      _isGeneratingThumbnail = true;
    });

    try {
      // Get the video file path
      final videoFile = await widget.event.downloadAndDecryptAttachment();
      if (videoFile.bytes != null) {
        // Save to temporary file for thumbnail generation
        final tempDir = await getTemporaryDirectory();
        final tempFile = File('${tempDir.path}/temp_video_${widget.event.eventId}.mp4');
        await tempFile.writeAsBytes(videoFile.bytes!);
        
        // Get video dimensions for thumbnail generation
        final infoMap = widget.event.content.tryGetMap<String, Object?>('info');
        final videoWidth = infoMap?.tryGet<int>('w') ?? 400;
        final videoHeight = infoMap?.tryGet<int>('h') ?? 300;
        const height = 300.0;
        final width = videoWidth * (height / videoHeight);
        
        // Generate thumbnail with same aspect ratio as video preview
        final thumbnailData = await VideoThumbnail.thumbnailData(
          video: tempFile.path,
          imageFormat: ImageFormat.JPEG,
          maxWidth: width.toInt(),
          maxHeight: height.toInt(),
          quality: 75,
        );
        
        // Clean up temp file
        if (await tempFile.exists()) {
          await tempFile.delete();
        }
        
        if (mounted) {
          setState(() {
            _thumbnailData = thumbnailData;
            _isGeneratingThumbnail = false;
          });
        }
      }
    } catch (e) {
      Logs().w('Failed to generate video thumbnail: $e');
      if (mounted) {
        setState(() {
          _isGeneratingThumbnail = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final supportsVideoPlayer = PlatformInfos.supportsVideoPlayer;

    final blurHash = (widget.event.infoMap as Map<String, dynamic>)
            .tryGet<String>('xyz.amorgan.blurhash') ??
        fallbackBlurHash;
    final fileDescription = widget.event.fileDescription;
    final infoMap = widget.event.content.tryGetMap<String, Object?>('info');
    final videoWidth = infoMap?.tryGet<int>('w') ?? 400;
    final videoHeight = infoMap?.tryGet<int>('h') ?? 300;
    const maxWidth = 320.0;
    final aspectRatio = videoWidth / videoHeight;
    final width = maxWidth;
    final height = width / aspectRatio;

    final durationInt = infoMap?.tryGet<int>('duration');
    final duration =
        durationInt == null ? null : Duration(milliseconds: durationInt);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppConfig.borderRadius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.tapToView ? () => supportsVideoPlayer
            ? showDialog(
                context: context,
                useRootNavigator: false, // Use local navigator so back button closes dialog
                barrierDismissible: true,
                builder: (dialogContext) => ImageViewer(
                  widget.event,
                  timeline: widget.timeline,
                  outerContext: context,
                ),
              )
            : widget.event.saveFile(context) : null,
        borderRadius: BorderRadius.circular(AppConfig.borderRadius),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConfig.borderRadius),
              child: SizedBox(
                width: width,
                height: height,
                child: Hero(
                  tag: widget.event.eventId,
                  child: Stack(
                    children: [
                    // Show generated thumbnail if available
                    if (_thumbnailData != null)
                      Image.memory(
                        _thumbnailData!,
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      )
                    // Fallback to original thumbnail if available
                    else if (widget.event.hasThumbnail)
                      MxcImage(
                        event: widget.event,
                        isThumbnail: true,
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                        placeholder: (context) => BlurHash(
                          blurhash: blurHash,
                          width: width,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                      )
                    // Show blur hash as final fallback
                    else
                      BlurHash(
                        blurhash: blurHash,
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      ),
                    Center(
                      child: supportsVideoPlayer
                          ? Image.asset(
                              'assets/icons/play-circle.png',
                              width: context.screenWidth * 0.15,
                              height: context.screenWidth * 0.15,
                              color: widget.tapToView ? Colors.white : Colors.white.withOpacity(0.5),
                            )
                          : Icon(
                              Icons.file_download_outlined,
                              color: widget.tapToView ? Colors.white : Colors.white.withOpacity(0.5),
                              size: context.screenWidth * 0.08,
                            ),
                    ),
                    if (duration != null)
                      Positioned(
                        bottom: context.screenHeight * 0.01,
                        left: context.screenWidth * 0.04,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * 0.02,
                            vertical: context.screenHeight * 0.005,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(context.screenWidth * 0.01),
                          ),
                          child: Text(
                            '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ),
            if (fileDescription != null && widget.textColor != null && widget.linkColor != null)
              Container(
                width: width,
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.04,
                  vertical: context.screenHeight * 0.01,
                ),
                child: Linkify(
                  text: fileDescription,
                  textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize:
                        AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                  ),
                  options: const LinkifyOptions(humanize: false),
                  linkStyle: TextStyle(
                    color: widget.linkColor,
                    fontSize:
                        AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                    decoration: TextDecoration.underline,
                    decorationColor: widget.linkColor,
                  ),
                  onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
