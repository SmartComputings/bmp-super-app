import 'package:bmp/features/auth_onboarding/providers/intro_video_provider.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class IntroVideoScreen extends StatefulWidget {
  const IntroVideoScreen({super.key});

  @override
  State<IntroVideoScreen> createState() => _IntroVideoScreenState();
}

class _IntroVideoScreenState extends State<IntroVideoScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  
  IntroVideoProvider? _introVideoProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_introVideoProvider == null) {
      _introVideoProvider = Provider.of<IntroVideoProvider>(context, listen: false);
      _introVideoProvider!.initializeVideo(_navigateToSplash);
      _introVideoProvider!.initializeAnimations(this);
      _introVideoProvider!.setVideoCompleteCallback(_navigateToSplash);
      _introVideoProvider!.startFallbackTimer(_navigateToSplash);
    }
  }

  @override
  void dispose() {
    _introVideoProvider?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_introVideoProvider?.videoController?.value.isInitialized == true) {
      if (state == AppLifecycleState.paused) {
        _introVideoProvider!.pauseVideo();
      } else if (state == AppLifecycleState.resumed) {
        _introVideoProvider!.resumeVideo();
      }
    }
  }

  void _navigateToSplash() {
    if (mounted) {
      context.go('/SplashScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Consumer<IntroVideoProvider>(
      builder: (context, introVideoProvider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: introVideoProvider.videoInitialized
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: introVideoProvider.videoController!.value.size.width,
                        height: introVideoProvider.videoController!.value.size.height,
                        child: VideoPlayer(introVideoProvider.videoController!),
                      ),
                    ),
                  ],
                )
              : introVideoProvider.showFallbackUI
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppLoadingWidget(),
                          SizedBox(height: 16),
                          Text(
                            'Loading...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
        );
      },
    );
  }
}
