


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CircleIcon extends StatelessWidget {
//   final String icon;
//   final bool selected;
//   final Color? color;

//   const CircleIcon({
//     super.key,
//     required this.icon,
//     this.selected = false,
//     this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget iconWidget;
//     if (icon.toLowerCase().endsWith('.svg')) {
//       iconWidget = SvgPicture.asset(
//         icon,
//         height: 22,
//         width: 22,
//         fit: BoxFit.contain,
//       );
//     } else {
//       iconWidget = Image.asset(
//         icon,
//         height: 22,
//         width: 22,
//         fit: BoxFit.contain,
//       );
//     }
//     return Container(
//       width: 44,
//       height: 44,
//       alignment: Alignment.center,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//       ),
//       child: iconWidget,
//     );
//   }
// }