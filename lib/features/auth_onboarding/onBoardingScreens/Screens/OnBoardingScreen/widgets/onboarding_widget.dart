import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/config/app_fonts.dart';
import '../../../../../../core/localization/l10n.dart';
import '../../../components/welcome_layout.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingController controller;
  final VoidCallback onStateChanged;

  const OnboardingWidget({
    super.key,
    required this.controller,
    required this.onStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return WelcomeLayout(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: controller.showPager
              ? Stack(
                  children: [
                    ...(_buildFloatingElements(context)),
                    _buildPage(
                      context,
                      controller.getPages(context)[controller.currentIndex],
                      controller.currentIndex,
                    ),
                    if (controller.currentIndex > 0)
                      _buildPreviousButton(context),
                    if (controller.currentIndex < controller.getPages(context).length - 1)
                      _buildNextButton(context),
                    _buildPageIndicator(context),
                  ],
                )
              : _buildGetStartedPage(context),
        ),
      ),
    );
  }

  List<Widget> _buildFloatingElements(BuildContext context) {
    return controller.getPages(context)[controller.currentIndex].floatingElements
            ?.map((element) {
          return AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                left: element.position.dx * MediaQuery.of(context).size.width -
                    (element.imageAsset != null
                            ? (element.imageWidth ?? 50)
                            : 50) /
                        2,
                top: element.position.dy * MediaQuery.of(context).size.height -
                    (element.imageAsset != null
                            ? (element.imageHeight ?? 50)
                            : 50) /
                        2,
                child: Opacity(
                  opacity: controller.animationController.value,
                  child: Transform.translate(
                    offset: Offset(0, -context.screenHeight * 0.02),
                    // child: element.imageAsset != null  ?
                    child: (element.isSvg
                        ? SvgPicture.asset(
                            element.imageAsset!,
                            height: element.imageHeight ?? 24,
                            width: element.imageWidth ?? 24,
                          )
                        : Image.asset(
                            element.imageAsset!,
                            height: element.imageHeight ?? 24,
                            width: element.imageWidth ?? 24,
                          )),
                  ),
                ),
              );
            },
          );
        }).toList() ??
        [];
  }

  Widget _buildPreviousButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Positioned(
      left: screenWidth * 0.04,
      top: 0,
      bottom: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {
            controller.goToPreviousPage();
            onStateChanged();
          },
          child: Container(
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: const Color(0xFF202267),
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.025),
              child: Image.asset(ImageAssets.backButton, 
                width: screenWidth * 0.04, 
                height: screenWidth * 0.04),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Positioned(
      right: screenWidth * 0.04,
      top: 0,
      bottom: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {
            controller.goToNextPage(context);
            onStateChanged();
          },
          child: Container(
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: const Color(0xFF202267),
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.025),
              child:
                  Image.asset(ImageAssets.forwardButton, 
                    width: screenWidth * 0.04, 
                    height: screenWidth * 0.04),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    
    return Positioned(
      bottom: screenHeight * 0.11 + bottomPadding,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.getPages(context).length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
            width: screenWidth * 0.02,
            height: screenWidth * 0.02,
            decoration: BoxDecoration(
              color: controller.currentIndex == index
                  ? const Color(0xFF3976F8)
                  : Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(screenWidth * 0.0125),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedPage(BuildContext context) {
    return Stack(
      children: [
        ...(controller.getStartedPage(context).floatingElements?.map((element) {
              return AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                    left: element.position.dx *
                            MediaQuery.of(context).size.width -
                        context.screenWidth * 0.0625,
                    top: element.position.dy *
                            MediaQuery.of(context).size.height -
                        context.screenHeight * 0.03,
                    child: Transform.scale(
                      scale: 0.5 + (controller.animationController.value * 0.5),
                      child: Opacity(
                        opacity: controller.animationController.value,
                        child: Container(
                          width: context.screenWidth * 0.24,
                          height: context.screenWidth * 0.24,
                          decoration: BoxDecoration(
                            color: element.color,
                            borderRadius: BorderRadius.circular(context.screenWidth * 0.12),
                            boxShadow: [
                              BoxShadow(
                                color: element.color.withOpacity(0.3),
                                blurRadius: context.screenWidth * 0.05,
                                spreadRadius: context.screenWidth * 0.0125,
                              ),
                            ],
                          ),
                          child: (element.isSvg
                              ? SvgPicture.asset(
                                  element.imageAsset!,
                                  height: context.screenWidth * 0.2,
                                  width: context.screenWidth * 0.2,
                                  color: element.color,
                                )
                              : Image.asset(
                                  element.imageAsset!,
                                  height: context.screenWidth * 0.2,
                                  width: context.screenWidth * 0.2,
                                  color: null,
                                )),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList() ??
            []),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.075),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      50 * (1 - controller.animationController.value),
                    ),
                    child: Opacity(
                      opacity: controller.animationController.value,
                      child: Text(
                        controller.getStartedPage(context).title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.08,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      30 * (1 - controller.animationController.value),
                    ),
                    child: Opacity(
                      opacity: controller.animationController.value,
                      child: Text(
                        controller.getStartedPage(context).subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts.allRoundGothic,
                          fontSize: context.screenWidth * 0.0325,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      20 * (1 - controller.animationController.value),
                    ),
                    child: Opacity(
                      opacity: controller.animationController.value,
                      child: Text(
                        controller.getStartedPage(context).description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.035,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale:
                          0.8 + (0.15 * controller.animationController.value),
                      child: Opacity(
                        opacity: controller.animationController.value,
                        child: Image.asset(
                          controller.getStartedPage(context).character,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.red,
                child: AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        0,
                        20 * (1 - controller.animationController.value),
                      ),
                      child: Opacity(
                        opacity: controller.animationController.value,
                        child: SizedBox(
                          width: context.screenWidth * 0.5,
                          height: context.screenHeight * 0.075,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.showPagerMode();
                              onStateChanged();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3976F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(context.screenWidth * 0.06),
                              ),
                              elevation: 0,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              controller.getStartedPage(context).buttonText,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: context.screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: context.screenHeight * 0.025 + MediaQuery.of(context).viewPadding.bottom),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPage(BuildContext context, OnboardingData data, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.075),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: context.screenHeight * 0.05),
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return Transform.translate(
                offset:
                    Offset(0, 50 * (1 - controller.animationController.value)),
                child: Opacity(
                  opacity: controller.animationController.value,
                  child: Text(
                    data.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: context.screenWidth * 0.09,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 6),
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return Transform.translate(
                offset:
                    Offset(0, 30 * (1 - controller.animationController.value)),
                child: Opacity(
                  opacity: controller.animationController.value,
                  child: Text(
                    data.subtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: context.screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 6),
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  0,
                  20 * (1 - controller.animationController.value),
                ),
                child: Opacity(
                  opacity: controller.animationController.value,
                  child: Text(
                    data.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: context.screenWidth * 0.0275,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Center(
              // height: 470,
              child: AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.78 + (0.18 * controller.animationController.value),
                    child: Opacity(
                      opacity: controller.animationController.value,
                      child: Image.asset(data.character, fit: BoxFit.contain),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return Transform.translate(
                offset:
                    Offset(0, 20 * (1 - controller.animationController.value)),
                child: Opacity(
                  opacity: controller.animationController.value,
                  child: data.isComingSoon
                      ? SizedBox(
                          width: context.screenWidth * 0.5,
                          height: context.screenHeight * 0.075,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (index == 0) {
                                await controller.navigateToChat(context);
                              } else if (index == 1) {
                                await controller.navigateToWallet(context);
                              } else if (index == 2) {
                                await controller.navigateToMarketplace(context);
                              } else if (index == 3) {
                                await controller.navigateToApps(context);
                              } else if (index == 4) {
                                await controller.navigateToCommunity(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.onBordingButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(context.screenWidth * 0.06),
                              ),
                              elevation: 0,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              data.buttonText,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: context.screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: context.screenHeight * 0.0375),
                          child: Text(L10n.of(context).comingSoon),
                        ),
                ),
              );
            },
          ),
          SizedBox(height: context.screenHeight * 0.025 + MediaQuery.of(context).viewPadding.bottom),
        ],
      ),
    );
  }
}
