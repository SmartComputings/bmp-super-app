import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:bmp/features/chat/voip/providers/voip_manager_provider.dart';
import 'package:bmp/features/chat/voip/services/voip_service.dart';
import 'package:bmp/features/chat/voip/services/call_ui_service.dart';
import 'package:bmp/shared/widgets/matrix.dart';

/// Optimized VoIP Plugin - Clean architecture with providers
/// Replaces the old voip_plugin.dart with better structure
class VoipPluginOptimized {
  static VoipManagerProvider? _provider;

  /// Initialize VoIP plugin with clean architecture
  static Future<void> initialize(MatrixState matrix) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    
    final voipService = VoipService(matrix.client);
    final callUiService = CallUiService(navigatorKey);
    
    _provider = VoipManagerProvider(
      voipService: voipService,
      callUiService: callUiService,
    );
  }

  /// Get VoIP provider instance
  static VoipManagerProvider? get provider => _provider;

  /// Dispose resources
  static void dispose() {
    _provider?.dispose();
    _provider = null;
  }
}

/// Widget to provide VoIP functionality to the app
class VoipProviderWidget extends StatelessWidget {
  final Widget child;
  final VoipManagerProvider voipProvider;

  const VoipProviderWidget({
    required this.child,
    required this.voipProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: voipProvider,
      child: child,
    );
  }
}

/// Extension to easily access VoIP functionality
extension VoipContext on BuildContext {
  VoipManagerProvider get voip => Provider.of<VoipManagerProvider>(this, listen: false);
  
  /// Start a voice call
  Future<void> startVoiceCall(Room room) async {
    await voip.startCall(room, CallType.kVoice);
  }
  
  /// Start a video call
  Future<void> startVideoCall(Room room) async {
    await voip.startCall(room, CallType.kVideo);
  }
}