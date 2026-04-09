import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

import '../../../components/welcome_layout.dart';
import '../controllers/welcome_screen_controller.dart';
import 'animated_button_section.dart';
import 'animated_character_section.dart';
import 'animated_text_section.dart';

class WelcomeScreenWidget extends StatelessWidget {
  final WelcomeScreenController controller;

  const WelcomeScreenWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return WelcomeLayout(
      isHeaderShow: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 5),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: context.percentHeight * 15.5,
              child: Image.asset(
                ImageAssets.ballImage,
                height: context.percentHeight * 35,
                width: context.screenWidth,
              ),
            ),
            Positioned(
              left: context.percentWidth * 26,
              top: context.percentHeight * 21,
              child: Image.asset(
                ImageAssets.smallBallImage,
                height: context.percentHeight * 35,
                width: context.screenWidth,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [                SizedBox(height: context.percentHeight * 0),

                AnimatedTextSection(
                  controller: controller,
                  constraints: BoxConstraints(
                    maxWidth: context.screenWidth,
                    maxHeight: context.screenHeight,
                  ),
                ),
                SizedBox(height: context.percentHeight * 11.3),
                AnimatedCharacterSection(
                  controller: controller,
                  constraints: BoxConstraints(
                    maxWidth: context.screenWidth,
                    maxHeight: context.screenHeight,
                  ),
                ),                

                AnimatedButtonSection(
                  controller: controller,
                  constraints: BoxConstraints(
                    maxWidth: context.screenWidth,
                    maxHeight: context.screenHeight,
                  ),
                ),
                SizedBox(height: context.percentHeight * 0),
                // AnimatedExploreButton(
                //   controller: controller,
                //   constraints: BoxConstraints(
                //     maxWidth: context.screenWidth,
                //     maxHeight: context.screenHeight,
                //   ),
                // ),
                // SizedBox(height: context.percentHeight * 2.5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
