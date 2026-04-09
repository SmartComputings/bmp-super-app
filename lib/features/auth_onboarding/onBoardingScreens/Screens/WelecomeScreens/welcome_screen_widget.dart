// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:go_router/go_router.dart';
//
// import '../pages/onBoardingScreens/Screens/WelecomeScreens/controllers/welcome_screen_controller.dart';
// import '../pages/onBoardingScreens/Utils/responsive_utils.dart';
// import '../pages/onBoardingScreens/assets/image_assets.dart';
// import '../pages/onBoardingScreens/components/welcome_layout.dart';
//
// class WelcomeScreenWidget extends StatelessWidget {
//   final WelcomeScreenController controller;
//
//   const WelcomeScreenWidget({
//     super.key,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return WelcomeLayout(
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: Padding(
//                 padding: ResponsiveUtils.padding(context, horizontal: 30),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       left: 0,
//                       right: 0,
//                       top: 40,
//                       child: Image.asset(
//                         ImageAssets.ballImage,
//                         height: (constraints.maxHeight * 0.55).clamp(300, 500),
//                         width: constraints.maxWidth,
//                       ),
//                     ),
//                     Positioned(
//                       left: 80,
//                       top: 35,
//                       child: Image.asset(
//                         ImageAssets.smallBallImage,
//                         height: (constraints.maxHeight * 0.55).clamp(300, 500),
//                         width: constraints.maxWidth,
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 30.h(context)),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           _buildAnimatedTextSection(context, constraints),
//                           SizedBox(height: 100.h(context)),
//                           _buildAnimatedCharacterSection(context, constraints),
//                           SizedBox(height: 20.h(context)),
//                           _buildAnimatedButtonSection(context, constraints),
//                           SizedBox(height: 16.h(context)),
//                           _buildAnimatedExploreButton(context, constraints),
//                           SizedBox(height: 20.h(context)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildAnimatedTextSection(BuildContext context, BoxConstraints constraints) {
//     return AnimatedBuilder(
//       animation: controller.textAnimationController,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: controller.textScaleAnimation.value,
//           child: Transform.translate(
//             offset: Offset(
//               controller.textSlideAnimation.value.dx * constraints.maxWidth,
//               controller.textSlideAnimation.value.dy * constraints.maxHeight,
//             ),
//             child: FadeTransition(
//               opacity: controller.textFadeAnimation,
//               child: Column(
//                 children: [
//                   Text(
//                     'Welcome to \n BeMind Power',
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.inter(
//                       color: Colors.white,
//                       fontSize: 25.sp(context).clamp(28, 42),
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   SizedBox(height: 8.h(context)),
//                   Text(
//                     'An unprecedented experience',
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.plusJakartaSans(
//                       color: Colors.white,
//                       fontSize: 14.sp(context).clamp(12, 16),
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   SizedBox(height: 20.h(context)),
//                   Text(
//                     'Here you don\'t just have an app. You have your world in the palm of your hand: connect, buy, pay, explore and transform your day… without leaving Bemind',
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.plusJakartaSans(
//                       color: Colors.white,
//                       fontSize: 14.sp(context).clamp(12, 16),
//                       fontWeight: FontWeight.w400,
//                       height: 1.4,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildAnimatedCharacterSection(BuildContext context, BoxConstraints constraints) {
//     return AnimatedBuilder(
//       animation: controller.characterAnimationController,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: controller.characterScaleAnimation.value,
//           child: Transform.translate(
//             offset: Offset(
//               controller.characterSlideAnimation.value.dx * constraints.maxWidth,
//               controller.characterSlideAnimation.value.dy * constraints.maxHeight,
//             ),
//             child: FadeTransition(
//               opacity: controller.characterFadeAnimation,
//               child: Container(
//                 constraints: BoxConstraints(
//                   maxWidth: constraints.maxWidth * 0.8,
//                   maxHeight: constraints.maxHeight * 0.35,
//                 ),
//                 child: Image.asset(
//                   ImageAssets.welcomeChar1,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildAnimatedButtonSection(BuildContext context, BoxConstraints constraints) {
//     return AnimatedBuilder(
//       animation: controller.buttonAnimationController,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: controller.buttonScaleAnimation.value,
//           child: Transform.translate(
//             offset: Offset(
//               controller.buttonSlideAnimation.value.dx * constraints.maxWidth,
//               controller.buttonSlideAnimation.value.dy * constraints.maxHeight,
//             ),
//             child: FadeTransition(
//               opacity: controller.buttonFadeAnimation,
//               child: SizedBox(
//                 width: 200.w(context).clamp(180, 250),
//                 height: 55.h(context).clamp(50, 70),
//                 child: ElevatedButton(
//                   onPressed: () => context.go('/home'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF4754FF),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(24.w(context)),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: Text(
//                     'Get Started',
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontSize: 16.sp(context).clamp(14, 18),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildAnimatedExploreButton(BuildContext context, BoxConstraints constraints) {
//     return AnimatedBuilder(
//       animation: controller.buttonAnimationController,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: controller.buttonScaleAnimation.value,
//           child: Transform.translate(
//             offset: Offset(
//               controller.buttonSlideAnimation.value.dx * constraints.maxWidth,
//               controller.buttonSlideAnimation.value.dy * constraints.maxHeight,
//             ),
//             child: FadeTransition(
//               opacity: controller.buttonFadeAnimation,
//               child: TextButton(
//                 onPressed: () => context.go('/onboarding'),
//                 child: Text(
//                   'Explore Features',
//                   style: GoogleFonts.poppins(
//                     color: Colors.white70,
//                     fontSize: 14.sp(context).clamp(12, 16),
//                     fontWeight: FontWeight.w400,
//                     decoration: TextDecoration.underline,
//                     decorationColor: Colors.white70,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class CircleIcon extends StatelessWidget {
//   final String icon;
//   final bool selected;
//   final Color? color;
//
//   const CircleIcon({
//     super.key,
//     required this.icon,
//     this.selected = false,
//     this.color,
//   });
//
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