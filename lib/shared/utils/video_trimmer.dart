import 'dart:io';
import 'package:video_compress/video_compress.dart';

class VideoTrimmer {
  static Future<File?> trimVideo({
    required String inputPath,
    required double startTime,
    required double endTime,
  }) async {
    try {
      final info = await VideoCompress.compressVideo(
        inputPath,
        quality: VideoQuality.DefaultQuality,
        deleteOrigin: false,
        startTime: startTime.toInt(),
        duration: (endTime - startTime).toInt(),
        includeAudio: true,
      );

      return info?.file;
    } catch (e) {
      return null;
    }
  }

  static Future<File?> compressVideo({
    required String inputPath,
    VideoQuality quality = VideoQuality.MediumQuality,
  }) async {
    try {
      final info = await VideoCompress.compressVideo(
        inputPath,
        quality: quality,
        deleteOrigin: false,
      );
      return info?.file;
    } catch (e) {
      return null;
    }
  }
}