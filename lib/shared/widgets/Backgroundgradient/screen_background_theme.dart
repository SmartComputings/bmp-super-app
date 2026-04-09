// import 'dart:ui';
// import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
// import 'package:bmp/shared/widgets/Backgroundgradient/constants/screen_background_type.dart';
// import 'package:bmp/shared/widgets/Backgroundgradient/screen_background_config.dart';
// import 'package:flutter/material.dart';

// class ScreenBackgroundTheme extends StatelessWidget {
//   final ScreenBackgroundType screenType;
//   final Widget child;
//   final bool enableBlur;

//   const ScreenBackgroundTheme({
//     super.key,
//     required this.screenType,
//     required this.child,
//     this.enableBlur = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//  final layers = screenBackgrounds[screenType]!.layers;



// return Stack(
//   children: [
//     // Render background layers (first = back, last = front)
//     ...layers.map((layer) {
//   final w = layer.widthFactor != null ? size.width * layer.widthFactor! : size.width;
//   final h = layer.heightFactor != null
//       ? (layer.useWidthForHeight == true
//           ? size.width * layer.heightFactor!
//           : size.height * layer.heightFactor!)
//       : size.height;

//       return BgGradientTheme(
//         position: layer.position,
//         width: w,
//         height: h,
//         color: layer.color,
//         colors: layer.colors,
//         gradient: layer.gradient,
//         opacity: layer.opacity,
//       );
//     }),

//     // Optional blur
//     if (screenBackgrounds[screenType]!.enableBlur)
//       BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaX: screenBackgrounds[screenType]!.blurSigmaX,
//           sigmaY: screenBackgrounds[screenType]!.blurSigmaY,
//         ),
//         child: Container(color: Colors.transparent),
//       ),

//     // Screen content
//     child,
//   ],
// );

//   }
// }
