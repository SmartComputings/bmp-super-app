
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/localization/l10n.dart';
import '../../../../../chat/community/community_screen.dart';

class OnboardingController {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentIndex = 0;
  bool _showPager = true;
  bool isMenuFull = false;

  PageController get pageController => _pageController;
  AnimationController get animationController => _animationController;
  int get currentIndex => _currentIndex;
  bool get showPager => _showPager;

  OnboardingData getStartedPage(BuildContext context) => OnboardingData(
        title: L10n.of(context).welcome,
        subtitle: L10n.of(context).welcomeSubtitle,
        description: L10n.of(context).welcomeDescription,
        buttonText: L10n.of(context).getStarted,
        character: ImageAssets.welcomeChar1,
        floatingElements: [
          FloatingElement(
            const Offset(0.95, 0.2),
            Colors.transparent,
            imageAsset: ImageAssets.icSphere,
            imageWidth: 70,
            imageHeight: 70,
          ),
          FloatingElement(
            const Offset(0.75, 0.2),
            Colors.transparent,
            imageAsset: ImageAssets.icSphereSmall,
            imageWidth: 20,
            imageHeight: 20,
          ),
        ],
      );

  List<OnboardingData> getPages(BuildContext context) => [
    OnboardingData(
      title: L10n.of(context).chatTitle,
      subtitle: L10n.of(context).chatSubtitle,
      description: L10n.of(context).chatDescription,
      buttonText: L10n.of(context).goToChat,
      character: ImageAssets.welcomeChar2,
      floatingElements: [
        FloatingElement(
          const Offset(-0.02, 0.3),
          Colors.blue,
          imageAsset: ImageAssets.icSphere,
          imageWidth: 108,
          imageHeight: 108,
        ),
        FloatingElement(
          const Offset(1, 0.65),
          Colors.blue,
          imageAsset: ImageAssets.icSphere,
          imageWidth: 108,
          imageHeight: 108,
        ),
      ],
    ),
    OnboardingData(
      title: L10n.of(context).financeTitle,
      subtitle: L10n.of(context).financeSubtitle,
      description: L10n.of(context).financeDescription,
      buttonText: L10n.of(context).goToWallet,
      character: ImageAssets.welcomeChar3,
      isComingSoon: false,
      floatingElements: [
        FloatingElement(
          const Offset(0.45, 0.4),
          Colors.transparent,
          imageAsset: ImageAssets.icSphere,
          imageWidth: 184,
          imageHeight: 184,
        ),
      ],
    ),
    OnboardingData(
      title: L10n.of(context).marketplaceTitle,
      subtitle: L10n.of(context).marketplaceSubtitle,
      description: L10n.of(context).marketplaceDescription,
      buttonText: L10n.of(context).goToMarketplace,
      character: ImageAssets.welcomeChar4,
      isComingSoon: false,
      floatingElements: [
        FloatingElement(
          const Offset(0.8, 0.36),
          Colors.transparent,
          imageAsset: ImageAssets.icSphereSmall,
          imageWidth: 50,
          imageHeight: 50,
        ),
      ],
    ),
    OnboardingData(
      title: L10n.of(context).appsTitle,
      subtitle: L10n.of(context).appsSubtitle,
      description: L10n.of(context).appsDescription,
      buttonText: L10n.of(context).goToApps,
      character: ImageAssets.welcomeChar5,
      isComingSoon: false,
      floatingElements: [
        FloatingElement(
          const Offset(0.3, 0.3),
          Colors.transparent,
          imageAsset: ImageAssets.icSphereSmall,
          imageWidth: 20,
          imageHeight: 20,
        ),
        FloatingElement(
          const Offset(1, 0.65),
          Colors.transparent,
          imageAsset: ImageAssets.blackBigBall,
          imageWidth: 131,
          imageHeight: 131,
        ),
      ],
    ),
    OnboardingData(
      title:  L10n.of(context).communitiesTitle,
      subtitle: L10n.of(context).communitiesSubtitle,
      description: L10n.of(context).communitiesDescription,
      buttonText: L10n.of(context).goToCommunity,
      character: ImageAssets.welcomeChar6,
      isComingSoon: false,
      floatingElements: [
        FloatingElement(
          const Offset(0.6, 0.24),
          Colors.blue,
          imageAsset: ImageAssets.icSphereSmall,
          imageWidth: 48,
          imageHeight: 48,
        ),
        FloatingElement(
          const Offset(0.8, 0.22),
          Colors.transparent,
          imageAsset: ImageAssets.blackSmallBall,
          imageWidth: 45,
          imageHeight: 45,
        ),
      ],
    ),
    OnboardingData(
      title: L10n.of(context).music,
      subtitle: L10n.of(context).yourRhythmYourSpace,
      description: L10n.of(context).musicDescription,
      buttonText: "",
      isComingSoon: false,
      character: ImageAssets.welcomeChar7,
      floatingElements: [
        FloatingElement(
          const Offset(0.73, 0.35),
          Colors.transparent,
          imageAsset: ImageAssets.icSphereSmall,
          imageWidth: 35,
          imageHeight: 35,
        ),
        FloatingElement(
          const Offset(0.75, 0.45),
          Colors.transparent,
          imageAsset: ImageAssets.musicIcons,
          imageWidth: 80,
          imageHeight: 80,
        ),
        // FloatingElement(
        //   const Offset(0, 0.65),
        //   Colors.transparent,
        //   imageAsset: ImageAssets.bigBallImage,
        //   imageWidth: 170,
        //   imageHeight: 170,
        // ),
      ],
    ),
    OnboardingData(
      title: L10n.of(context).mentalHealth,
      subtitle: L10n.of(context).yourPeaceAlsoMatters,
      description: L10n.of(context).mentalHealthDescription,
      buttonText: "",
      isComingSoon: false,
      character: ImageAssets.welcomeChar8,
      floatingElements: [
        FloatingElement(
          const Offset(0.42, 0.4),
          Colors.transparent,
          imageAsset: ImageAssets.icSphere,
          imageWidth: 200,
          imageHeight: 200,
        ),
      ],
    ),
    OnboardingData(
      title: L10n.of(context).aiFinance,
      subtitle: L10n.of(context).letMoneyThinkToo,
      description: L10n.of(context).aiFinanceDescription,
      buttonText: "",
      isComingSoon: false,
      character: ImageAssets.welcomeChar9,
      floatingElements: [
        FloatingElement(
          const Offset(0.76, 0.33),
          Colors.transparent,
          imageAsset: ImageAssets.blackBall,
          imageWidth: 40,
          imageHeight: 40,
        ),
        FloatingElement(
          const Offset(0.01, 0.28),
          Colors.transparent,
          imageAsset: ImageAssets.dollarCoin,
          imageWidth: 50,
          imageHeight: 50,
        ),
        FloatingElement(
          const Offset(1, 0.72),
          Colors.transparent,
          imageAsset: ImageAssets.dollarCoin,
          imageWidth: 150,
          imageHeight: 150,
        ),
      ],
    ),
    OnboardingData(
      title: L10n.of(context).nutrition,
      subtitle: L10n.of(context).eatWithoutComplications,
      description: L10n.of(context).nutritionDescription,
      buttonText: "",
      isComingSoon: false,
      character: ImageAssets.welcomeChar10,
      floatingElements: [
        FloatingElement(
          const Offset(0.8, 0.28),
          Colors.transparent,
          imageAsset: ImageAssets.blackBall,
          imageWidth: 92,
          imageHeight: 92,
        ),
        FloatingElement(
          const Offset(0.03, 0.7),
          Colors.blue,
          imageAsset: ImageAssets.icSphere,
          imageWidth: 125,
          imageHeight: 125,
        ),
      ],
    ),
  ];

  void initialize(int initialPage, TickerProvider vsync) {
    _currentIndex = initialPage;
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );
    _animationController.forward();
  }

  void goToNextPage(BuildContext context) {
    if (_currentIndex < getPages(context).length - 1) {
      _currentIndex++;
      try {
        _animationController.reset();
        _animationController.forward();
      } catch (e) {
        debugPrint('OnboardingController: Error in goToNextPage: $e');
      }
    }
  }

  void goToPreviousPage() {
    if (_currentIndex > 0) {
      _currentIndex--;
      try {
        _animationController.reset();
        _animationController.forward();
      } catch (e) {
        debugPrint('OnboardingController: Error in goToPreviousPage: $e');
      }
    }
  }

  void showPagerMode() {
    _showPager = true;
    _currentIndex = 0;
  }

  Future<void> navigateToChat(BuildContext context) async {
    // GoRouter.of(context).push('/rooms');

    debugPrint("===========");
    context.push('/onboarding/rooms');
  }

  Future<void> navigateToWallet(BuildContext context) async {
    context.push('/onboarding/wallet');
    // FeatureAccessHelper.handleFeatureAccess(
    //   context: context,
    //   feature: FeatureType.finance,
    //   onAccessGranted: () => context.push('/onboarding/wallet'),
    // );
  }

  Future<void> navigateToMarketplace(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CommunityScreen())
    );
        }

  Future<void> navigateToApps(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CommunityScreen())
    );
  }

  Future<void> navigateToCommunity(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CommunityScreen())
    );
  }

  void dispose() {
    try {
      _pageController.dispose();
    } catch (e) {
      debugPrint('OnboardingController: Error disposing page controller: $e');
    }

    try {
      _animationController.stop();
      _animationController.dispose();
    } catch (e) {
      debugPrint('OnboardingController: Error disposing animation controller: $e');
    }
  }
}

class OnboardingData {
  final String title;
  final String subtitle;
  final String description;
  final String buttonText;
  final String character;
  final bool isComingSoon;
  final List<FloatingElement>? floatingElements;

  OnboardingData({
    required this.title,
    required this.subtitle,
    this.isComingSoon = true,
    required this.description,
    required this.buttonText,
    required this.character,
    this.floatingElements,
  });
}

class FloatingElement {
  final Offset position;
  final Color color;
  final String? imageAsset;
  final bool isSvg;
  final double? imageWidth;
  final double? imageHeight;

  FloatingElement(
    this.position,
    this.color, {
    this.imageAsset,
    this.isSvg = false,
    this.imageWidth,
    this.imageHeight,
  });
}
