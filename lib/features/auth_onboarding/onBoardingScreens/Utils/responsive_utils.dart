import 'package:flutter/material.dart';

class ResponsiveUtils {
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  
  // Check if device is tablet
  static bool isTablet(BuildContext context) => screenWidth(context) >= 600;
  static bool isDesktop(BuildContext context) => screenWidth(context) >= 1024;
  
  // Responsive width based on design width (375px)
  static double w(BuildContext context, double width) {
    var screenW = screenWidth(context);
    if (screenW >= 1024) {
      // Desktop
      return width * 1.2;
    } else if (screenW >= 600) {
      // Tablet
      return width * 1.1;
    } else {
      // Mobile
      var scale = screenW / 375;
      return width * scale.clamp(0.8, 1.5);
    }
  }
  
  // Responsive height based on design height (812px)
  static double h(BuildContext context, double height) {
    var screenH = screenHeight(context);
    if (screenH >= 1024) {
      // Desktop/Large tablet
      return height * 1.2;
    } else if (screenH >= 600) {
      // Tablet
      return height * 1.1;
    } else {
      // Mobile
      var scale = screenH / 812;
      return height * scale.clamp(0.8, 1.5);
    }
  }
  
  // Responsive font size
  static double sp(BuildContext context, double fontSize) {
    var screenW = screenWidth(context);
    if (screenW >= 1024) {
      return fontSize * 1.1;
    } else if (screenW >= 600) {
      return fontSize * 1.05;
    } else {
      var scale = screenW / 375;
      return fontSize * scale.clamp(0.9, 1.3);
    }
  }
  
  // Get responsive padding
  static EdgeInsets padding(BuildContext context, {
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: w(context, left ?? horizontal ?? all ?? 0),
      top: h(context, top ?? vertical ?? all ?? 0),
      right: w(context, right ?? horizontal ?? all ?? 0),
      bottom: h(context, bottom ?? vertical ?? all ?? 0),
    );
  }
}

// Extension for easier usage
extension ResponsiveExtension on num {
  double w(BuildContext context) => ResponsiveUtils.w(context, toDouble());
  double h(BuildContext context) => ResponsiveUtils.h(context, toDouble());
  double sp(BuildContext context) => ResponsiveUtils.sp(context, toDouble());
}