import 'dart:ui';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';





// /// Example usage inside Page
// class Page extends StatelessWidget {
//   const Page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // ✅ Basic background color
//           Positioned.fill(
//             child: Container(
//               color: const Color.fromRGBO(71, 84, 255, 0.6),
//             ),
//           ),

//           // ✅ Example: Full-width gradient bar at TOP
//           // HOW TO CALL: Just pass ShapePosition.topFull with desired height + gradient/colors
//           const BgGradientTheme(
//             position: ShapePosition.topFull,
//             height: 200,
//             gradient: LinearGradient(
//               colors: [Color(0xFF4754FF), Color(0xFFA912BF)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),

//           // ✅ Example: Full-width gradient bar at BOTTOM
//           // HOW TO CALL: Use ShapePosition.bottomFull with height and gradient/colors
//           const BgGradientTheme(
//             position: ShapePosition.bottomFull,
//             height: 250,
//             gradient: LinearGradient(
//               colors: [Color(0xFFA912BF), Color(0xFF000000)],
//               stops: [0.3, 1.0],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),

//           // ✅ Example: Center circle shape
//           // HOW TO CALL: Use ShapePosition.center with width, height and color/opacity
//           const BgGradientTheme(
//             position: ShapePosition.center,
//             width: 681,
//             height: 681,
//             color: Color(0xFF4754FF),
//             opacity: 0.6,
//           ),

//           // ✅ Example: Bottom right gradient shape
//           // HOW TO CALL: Provide multiple colors for gradient effect
//           BgGradientTheme(
//             position: ShapePosition.bottomRight,
//             width: 150,
//             height: 250,
//             colors: [Color(0xFFA912BF), Colors.black],
//             opacity: 0.8,
//           ),

//           // ✅ Example: Bottom left solid shape
//           // HOW TO CALL: Use single color with opacity
//           BgGradientTheme(
//             position: ShapePosition.bottomLeft,
//             width: 120,
//             height: 150,
//             color: Colors.black,
//             opacity: 0.8,
//           ),

//           // ✅ Example: Add blur overlay on top of everything
//           // HOW TO CALL: BackdropFilter can be used with Positioned.fill
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
//               child: Container(color: Colors.transparent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







/// Enum for shape placement positions


/// Reusable widget for placing custom shapes
class BgGradientTheme extends StatelessWidget {
  final ShapePosition position;
  final double width;
  final double height;
  final Color? color;
  final double opacity;
  final List<Color>? colors;
  final Gradient? gradient;
  final Widget? child;
  final CustomPainter? painter;

  const BgGradientTheme({
    Key? key,
    required this.position,
    this.width = 100,
    this.height = 100,
    this.color,
    this.opacity = 1.0,
    this.colors,
    this.gradient,
    this.child,
    this.painter,
  }) : super(key: key);

  Alignment _getAlignment() {
    switch (position) {
      case ShapePosition.topLeft:
        return Alignment.topLeft;
      case ShapePosition.topCenter:
        return Alignment.topCenter;
      case ShapePosition.topRight:
        return Alignment.topRight;
      case ShapePosition.centerLeft:
        return Alignment.centerLeft;
      case ShapePosition.center:
        return Alignment.center;
      case ShapePosition.centerRight:
        return Alignment.centerRight;
      case ShapePosition.bottomLeft:
        return Alignment.bottomLeft;
      case ShapePosition.bottomCenter:
        return Alignment.bottomCenter;
      case ShapePosition.bottomRight:
        return Alignment.bottomRight;
      default:
        return Alignment.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    // if full-width
    if (position == ShapePosition.topFull ||
        position == ShapePosition.bottomFull) {
      return Align(
        alignment: position == ShapePosition.topFull
            ? Alignment.topCenter
            : Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            gradient: gradient ??
                (colors != null
                    ? LinearGradient(
                        colors:
                            colors!.map((c) => c.withOpacity(opacity)).toList(),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null),
            color: gradient == null && colors == null
                ? color?.withOpacity(opacity)
                : null,
          ),
          child: painter != null ? CustomPaint(painter: painter) : child,
        ),
      );
    }

    // normal shapes
    return Align(
      alignment: _getAlignment(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient ??
              (colors != null
                  ? LinearGradient(
                      colors:
                          colors!.map((c) => c.withOpacity(opacity)).toList(),
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null),
          color: gradient == null && colors == null
              ? color?.withOpacity(opacity)
              : null,
          borderRadius: BorderRadius.circular(30),
        ),
        child: painter != null ? CustomPaint(painter: painter) : child,
      ),
    );
  }
}