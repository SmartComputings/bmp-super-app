import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';


// /// Reusable widget for placing custom shapes
// /// Reusable widget for placing custom shapes
// class BgGradientTheme extends StatelessWidget {
//   final ShapePosition position;
//   final double width;
//   final double height;
//   final Color? color;
//   final double opacity;
//   final List<Color>? colors;
//   final Gradient? gradient;
//   final Widget? child;
//   final CustomPainter? painter;

//   const BgGradientTheme({
//     super.key,
//     required this.position,
//     this.width = 100,
//     this.height = 100,
//     this.color,
//     this.opacity = 1.0,
//     this.colors,
//     this.gradient,
//     this.child,
//     this.painter,
//   });

//  Alignment _getAlignment() {
//   switch (position) {
//     case ShapePosition.full:
//       return Alignment.center;

//     case ShapePosition.topFull:
//       return Alignment.topCenter;

//     case ShapePosition.bottomFull:
//       return Alignment.bottomCenter;

//     case ShapePosition.topLeft:
//       return Alignment.topLeft;

//     case ShapePosition.topCenter:
//       return Alignment.topCenter;

//     case ShapePosition.topRight:
//       return Alignment.topRight;

//     case ShapePosition.centerLeft:
//       return Alignment.centerLeft;

//     case ShapePosition.center:
//       return Alignment.center;

//     case ShapePosition.centerRight:
//       return Alignment.centerRight;

//     case ShapePosition.bottomLeft:
//       return Alignment.bottomLeft;

//     case ShapePosition.bottomCenter:
//       return Alignment.bottomCenter;

//     case ShapePosition.bottomRight:
//       return Alignment.bottomRight;
//   }
// }


//   @override
//   // Widget build(BuildContext context) {
//   //   // if full-width
//   //     // FULL SCREEN


//   //   if (position == ShapePosition.topFull ||
//   //       position == ShapePosition.bottomFull|| position== ShapePosition.full) {
//   //     return Align(
//   //       alignment: position == ShapePosition.topFull
//   //           ? Alignment.topCenter
//   //           : Alignment.bottomCenter,
//   //       child: Container(
//   //         width: MediaQuery.of(context).size.width,
//   //         height: height,
//   //         decoration: BoxDecoration(
//   //           gradient: gradient ??
//   //               (colors != null
//   //                   ? LinearGradient(
//   //                       colors:
//   //                           colors!.map((c) => c.withOpacity(opacity)).toList(),
//   //                       begin: Alignment.topLeft,
//   //                       end: Alignment.bottomRight,
//   //                     )
//   //                   : null),
//   //           color: gradient == null && colors == null
//   //               ? color?.withOpacity(opacity)
//   //               : null,
//   //         ),
//   //         child: painter != null ? CustomPaint(painter: painter) : child,
//   //       ),
//   //     );
//   //   }

//   //   // normal shapes
//   //   return Align(
//   //     alignment: _getAlignment(),
//   //     child: Container(
//   //       width: width,
//   //       height: height,
//   //       decoration: BoxDecoration(
//   //         gradient: gradient ??
//   //             (colors != null
//   //                 ? LinearGradient(
//   //                     colors:
//   //                         colors!.map((c) => c.withOpacity(opacity)).toList(),
//   //                     begin: Alignment.topLeft,
//   //                     end: Alignment.bottomRight,
//   //                   )
//   //                 : null),
//   //         color: gradient == null && colors == null
//   //             ? color?.withOpacity(opacity)
//   //             : null,
//   //         borderRadius: BorderRadius.circular(30),
//   //       ),
//   //       child: painter != null ? CustomPaint(painter: painter) : child,
//   //     ),
//   //   );
//   // }
// //}
// @override
// Widget build(BuildContext context) {
//   final size = MediaQuery.of(context).size;

//   // FULL SCREEN
//   if (position == ShapePosition.full) {
//     return Align(
//       alignment: Alignment.center,
//       child: Container(
//         width: size.width,
//         height: size.height,
//         decoration: _decoration(),
//         child: painter != null ? CustomPaint(painter: painter) : child,
//       ),
//     );
//   }

//   // FULL WIDTH STRIPS (top / bottom)
//   if (position == ShapePosition.topFull ||
//       position == ShapePosition.bottomFull) {
//     return Align(
//       alignment: _getAlignment(),
//       child: Container(
//         width: size.width,
//         height: height,
//         decoration: _decoration(),
//         child: painter != null ? CustomPaint(painter: painter) : child,
//       ),
//     );
//   }

//   // NORMAL SHAPES
//   return Align(
//     alignment: _getAlignment(),
//     child: Container(
//       width: width,
//       height: height,
//       decoration: _decoration().copyWith(
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: painter != null ? CustomPaint(painter: painter) : child,
//     ),
//   );
// }

// BoxDecoration _decoration() {
//   if (gradient != null) {
//     return BoxDecoration(gradient: gradient);
//   }

//   if (colors != null) {
//     return BoxDecoration(
//       gradient: LinearGradient(
//         colors: colors!
//             .map((c) => c.withOpacity(opacity))
//             .toList(),
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//     );
//   }

//   return BoxDecoration(
//     color: color?.withOpacity(opacity),
//   );
// }

// }
// Reusable widget for placing custom shapes
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
    super.key,
    required this.position,
    this.width = 100,
    this.height = 100,
    this.color,
    this.opacity = 1.0,
    this.colors,
    this.gradient,
    this.child,
    this.painter,
  });
 
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