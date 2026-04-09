// import 'package:bmp/shared/widgets/Backgroundgradient/background_layer_model.dart';
// import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
// import 'package:bmp/shared/widgets/Backgroundgradient/constants/screen_background_type.dart';
// import 'package:bmp/shared/widgets/Backgroundgradient/screeenbgconfig.dart';
// import 'package:flutter/material.dart';

// // Map each screen type to its unique background layers
// final Map<ScreenBackgroundType, ScreenBackgroundConfig> screenBackgrounds = {
//   ScreenBackgroundType.mainMenuScreen: const ScreenBackgroundConfig(
//  layers: [
//    BackgroundLayerModel(
//       position: ShapePosition.center,
//       color: Color(0xFF1B1C30),
//     ),
//  BackgroundLayerModel(
//       position: ShapePosition.center,
//       widthFactor: 1.8,
//       useWidthForHeight: true,
//       heightFactor: 1.8,
//       color: Color(0xFF363EC1),
//       opacity: 0.6,
//     ),
//  BackgroundLayerModel(
//       position: ShapePosition.bottomFull,
//       heightFactor: 0.37,
//       colors: [Color(0xFF1B1C30), Color(0xFFA912BF)],
//       opacity: 0.8,
//     ),
//      BackgroundLayerModel(
//       position: ShapePosition.bottomLeft,
//       heightFactor: 0.44,
//       gradient: LinearGradient(
//         colors: [Color(0xFFA912BF), Color(0xFF1B1C30)],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       opacity: 0.8,
//     ),
//      BackgroundLayerModel(
//       position: ShapePosition.bottomRight,
//       heightFactor: 0.31,
//       color: Color(0xFF1B1C30),
//       opacity: 0.8,
//     ),
//    BackgroundLayerModel(
//       position: ShapePosition.topRight,
//       heightFactor: 0.44,
//       gradient: LinearGradient(
//         colors: [Color(0xFF1B1C30), Color(0x88A912BF)],
//         stops: [0.5, 0.5],
//         begin: Alignment.topRight,
//         end: Alignment.bottomRight,
//       ),
//       opacity: 0.6,
//     ),
//  BackgroundLayerModel(
//       position: ShapePosition.topLeft,
//       widthFactor: 0.5,
//       heightFactor: 0.25,
//       color: Colors.black,
//       opacity: 0.3,
//     ),
//  BackgroundLayerModel(
//       position: ShapePosition.topRight,
//       widthFactor: 0.5,
//       heightFactor: 0.25,
//       color: Colors.black,
//       opacity: 0.3,
//     ),
//   ],
//   enableBlur: true,
//   blurSigmaX: 85,
//   blurSigmaY: 85,
// ),

// // loginwelcome screen
//  ScreenBackgroundType.loginWelcomeScreen:const ScreenBackgroundConfig(
//     layers: [
//         BackgroundLayerModel(
//                       position: ShapePosition.center,
//                       widthFactor:  1.8,
//                       useWidthForHeight: true,
//                       heightFactor:  1.8,
//                       color: Color(0xFFB0B8FF),
//                       opacity: 0.3,
//                     ),
//                     BackgroundLayerModel(
//                       position: ShapePosition.bottomFull,
//                       heightFactor:  0.37,
//                       colors: [Color(0xFF1B1C30), Color(0xFFA912BF)],
//                       opacity: 0.8,
//                     ),
//                     BackgroundLayerModel(
//                       position: ShapePosition.bottomRight,
//                       heightFactor: 0.44,
//                       gradient: LinearGradient(
//                         colors: [Color(0xFFA912BF), Color(0xFF1B1C30)],
//                         begin: Alignment.topRight,
//                         end: Alignment.bottomLeft,
//                       ),
//                       opacity: 0.8,
//                     ),
//                     BackgroundLayerModel(
//                       position: ShapePosition.bottomRight,
//                       heightFactor:  0.31,
//                       color: Color(0xFF1B1C30),
//                       opacity: 0.8,
//                     ),
//                     BackgroundLayerModel(
//                       position: ShapePosition.topLeft,
//                       heightFactor:  0.44,
//                       gradient: LinearGradient(
//                         colors: [Color(0xFF1B1C30), Color(0x88A912BF)],
//                         stops: [0.5, 0.5],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomLeft,
//                       ),
//                       opacity: 0.6,
//                     ),
//                     BackgroundLayerModel(
//                       position: ShapePosition.bottomRight,
//                       heightFactor:  0.19,
//                       color: Color(0xFF1B1C30),
//                       opacity: 0.8,
//                     ),
//                     BackgroundLayerModel(
//                       position: ShapePosition.bottomCenter,
//                       heightFactor:  0.125,
//                       color: Color(0xFF1B1C30),
//                       opacity: 0.8,
//                     ),
//                     BackgroundLayerModel(
//                       position: ShapePosition.topRight,
//                       widthFactor:  0.5,
//                       heightFactor:  0.25,
//                       color: Colors.black,
//                       opacity: 0.3,
//                     ),
//                     BackgroundLayerModel(
//                       position: ShapePosition.topLeft,
//                       widthFactor:  0.5,
//                       heightFactor:  0.25,
//                       color: Colors.black,
//                       opacity: 0.3,
//                     ),
                    
//     ],
//     enableBlur: true,
//     blurSigmaX: 85,
//     blurSigmaY: 85,
//   ),
// };


//   // ScreenBackgroundType.finance: [
//   //   BackgroundLayerModel(
//   //     position: ShapePosition.topRight,
//   //     widthFactor: 1.2,
//   //     heightFactor: 1.2,
//   //     gradient: LinearGradient(
//   //       colors: [Color(0xFF12ABF0), Color(0xFF0044FF)],
//   //       begin: Alignment.topRight,
//   //       end: Alignment.bottomLeft,
//   //     ),
//   //     opacity: 0.7,
//   //   ),
//   //   BackgroundLayerModel(
//   //     position: ShapePosition.bottomLeft,
//   //     heightFactor: 0.3,
//   //     color: Color(0xFF001122),
//   //     opacity: 0.5,
//   //   ),
//   // ],

//   // Add other screen configs here

