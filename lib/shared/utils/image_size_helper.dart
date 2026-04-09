

class ImageSizeHelper {
  static String ensureMinimumSize(String base64Image, {double minSizeKB = 20.0}) {
    final currentSizeKB = _calculateBase64SizeKB(base64Image);
    
    if (currentSizeKB >= minSizeKB) {
      return base64Image;
    }
    
    // Extract data part if it has data URL prefix
    var prefix = '';
    var datapart = base64Image;
    if (base64Image.contains(',')) {
      final parts = base64Image.split(',');
      prefix = '${parts[0]},';
      datapart = parts[1];
    }
    
    // Calculate padding needed (in base64 chars)
    final targetSizeBytes = (minSizeKB * 1024).round();
    final currentSizeBytes = (datapart.length * 3 / 4).round();
    final paddingBytes = targetSizeBytes - currentSizeBytes;
    final paddingChars = ((paddingBytes * 4) / 3).round();
    
    final padding = 'A' * paddingChars;
    
    return prefix + datapart + padding;
  }
  
  static double _calculateBase64SizeKB(String base64String) {
    var cleanBase64 = base64String;
    if (base64String.contains(',')) {
      cleanBase64 = base64String.split(',')[1];
    }
    
    final sizeBytes = (cleanBase64.length * 3 / 4).round();
    return sizeBytes / 1024;
  }
  
  /// Ensures image is exactly 20KB by padding
  static String ensure20KB(String base64Image) {
    return ensureMinimumSize(base64Image, minSizeKB: 20.0);
  }
}