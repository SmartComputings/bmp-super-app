import 'dart:ui';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:image/image.dart' as img;
import 'package:matrix/matrix.dart';

(int, int) _scaleToBox(int width, int height, {required int boxSize}) {
  final fit = applyBoxFit(
    BoxFit.scaleDown,
    Size(width.toDouble(), height.toDouble()),
    Size(boxSize.toDouble(), boxSize.toDouble()),
  ).destination;
  return (fit.width.round(), fit.height.round());
}

Future<MatrixImageFileResizedResponse?> customImageResizer(
  MatrixImageFileResizeArguments arguments,
) async {
  if (kIsWeb) {
    throw UnsupportedError(
      'customImageResizer only supports non-web platforms.',
    );
  }

  var imageBytes = arguments.bytes;
  String? blurhash;

  var originalWidth = 0;
  var originalHeight = 0;
  var width = 0;
  var height = 0;

  try {
    final dartCodec = await instantiateImageCodec(arguments.bytes);
    final frameCount = dartCodec.frameCount;
    final dartFrame = await dartCodec.getNextFrame();
    
    width = originalWidth = dartFrame.image.width;
    height = originalHeight = dartFrame.image.height;

    final rgbaData = await dartFrame.image.toByteData();
    dartFrame.image.dispose();
    dartCodec.dispose();
    
    if (rgbaData == null) {
      return null;
    }

    final decodedImg = img.decodeImage(arguments.bytes);
    if (decodedImg == null) return null;

    if (arguments.calcBlurhash) {
      final (blurW, blurH) = _scaleToBox(width, height, boxSize: 100);
      final blurhashImg = img.copyResize(decodedImg, width: blurW, height: blurH);
      blurhash = BlurHash.encode(blurhashImg, numCompX: 3, numCompY: 3).hash;
    }

    if (frameCount > 1) {
      // Don't scale down animated images
    } else {
      final max = arguments.maxDimension;
      if (width > max || height > max) {
        (width, height) = _scaleToBox(width, height, boxSize: max);
        final scaledImg = img.copyResize(decodedImg, width: width, height: height);
        imageBytes = Uint8List.fromList(img.encodeJpg(scaledImg, quality: 75));
      }
    }
  } catch (e, s) {
    Logs().e("Could not generate preview", e, s);
  }

  return MatrixImageFileResizedResponse(
    bytes: imageBytes,
    width: width,
    height: height,
    originalWidth: originalWidth,
    originalHeight: originalHeight,
    blurhash: blurhash,
  );
}
