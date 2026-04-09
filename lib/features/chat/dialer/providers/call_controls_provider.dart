import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

/// Manages call controls (mic, camera, hold, screen sharing)
class CallControlsProvider extends ChangeNotifier {
  CallSession? _call;
  bool _isSpeakerOn = false;
  
  /// Error callback for UI notification
  Function(String message)? _onError;

  CallSession? get call => _call;
  bool get isSpeakerOn => _isSpeakerOn;

  /// Set error callback for UI notification
  void setErrorCallback(Function(String message) callback) {
    _onError = callback;
  }

  /// Initialize with call session
  void initializeCall(CallSession call) {
    _call = call;
    notifyListeners();
  }

  /// Toggle microphone mute/unmute
  void toggleMic() {
    if (_call == null) return;
    _call!.setMicrophoneMuted(!_call!.isMicrophoneMuted);
    notifyListeners();
  }

  /// Toggle camera on/off
  void toggleCamera() {
    if (_call == null) return;
    _call!.setLocalVideoMuted(!_call!.isLocalVideoMuted);
    notifyListeners();
  }

  /// Switch between front/back camera
  /// Returns true if switch was successful, false otherwise
  Future<bool> switchCamera() async {
    if (_call?.localUserMediaStream?.stream == null) {
      Logs().w('[CallControlsProvider] No local video stream for camera switch');
      return false;
    }

    try {
      final videoTracks = _call!.localUserMediaStream!.stream!.getVideoTracks();
      if (videoTracks.isEmpty) {
        Logs().w('[CallControlsProvider] No video tracks available');
        return false;
      }

      await Helper.switchCamera(videoTracks[0]);
      notifyListeners();
      return true;
    } catch (e) {
      Logs().e('[CallControlsProvider] Error switching camera', e);
      return false;
    }
  }

  /// Toggle hold/unhold
  void toggleHold() {
    if (_call == null) return;
    _call!.setRemoteOnHold(!_call!.remoteOnHold);
    notifyListeners();
  }

  /// Toggle screen sharing
  Future<void> toggleScreenSharing(BuildContext context) async {
    if (_call == null) return;

    try {
      if (PlatformInfos.isAndroid) {
        if (!_call!.screensharingEnabled) {
          FlutterForegroundTask.init(
            androidNotificationOptions: AndroidNotificationOptions(
              channelId: 'bmp_screen_share',
              channelName: 'Screen Sharing',
              channelDescription: 'Screen sharing is active',
              channelImportance: NotificationChannelImportance.LOW,
              priority: NotificationPriority.LOW,
            ),
            iosNotificationOptions: const IOSNotificationOptions(),
            foregroundTaskOptions: const ForegroundTaskOptions(
              interval: 5000,
              isOnceEvent: false,
              autoRunOnBoot: false,
              allowWakeLock: true,
              allowWifiLock: true,
            ),
          );
          await FlutterForegroundTask.startService(
            notificationTitle: 'Screen Sharing',
            notificationText: 'Sharing your screen',
          );
        } else {
          await FlutterForegroundTask.stopService();
        }
      }

      await _call!.setScreensharingEnabled(!_call!.screensharingEnabled);
      notifyListeners();
    } catch (e) {
      Logs().e('[CallControlsProvider] Screen sharing error', e);
    }
  }

  /// Toggle speakerphone with enhanced error handling
  /// Returns true if toggle was successful, false otherwise
  Future<bool> toggleSpeaker() async {
    final targetState = !_isSpeakerOn;
    
    try {
      await Helper.setSpeakerphoneOn(targetState);
      
      // Small delay to verify state was set (some devices fail silently)
      await Future.delayed(const Duration(milliseconds: 50));
      
      _isSpeakerOn = targetState;
      Logs().i('[CallControlsProvider] Speaker mode: $targetState (echo cancellation active)');
      notifyListeners();
      return true;
    } on PlatformException catch (e) {
      Logs().e('[CallControlsProvider] Platform error toggling speaker: ${e.message}', e);
      _onError?.call('Speaker not available on this device');
      return false;
    } on MissingPluginException catch (e) {
      Logs().e('[CallControlsProvider] Missing plugin for speaker: ${e.message}', e);
      _onError?.call('Speaker feature not supported');
      return false;
    } catch (e) {
      Logs().e('[CallControlsProvider] Error toggling speaker', e);
      _onError?.call('Failed to toggle speaker');
      return false;
    }
  }

  @override
  void dispose() {
    _call = null;
    _onError = null;
    super.dispose();
  }
}
