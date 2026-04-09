import 'dart:io';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class DocumentOpener {
  static Future<void> openDocument(Event event, String filename) async {
    final matrixFile = await event.downloadAndDecryptAttachment();
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$filename');
    await file.writeAsBytes(matrixFile.bytes);
    
    await OpenFilex.open(file.path);
  }
}
