import 'package:matrix/matrix.dart';

import 'voip_logger.dart';

/// VoIP Test Helper for debugging and validating call functionality
/// Provides utilities for testing call direction, state transitions, and TURN server connectivity
class VoipTestHelper {
  /// Log detailed call state information
  static void logCallState(CallSession call) {
    VoipLogger().logInfo('''
╔══════════════════════════════════════╗
║         CALL STATE DEBUG             ║
╠══════════════════════════════════════╣
║ Call ID: ${call.callId}
║ Direction: ${call.direction}
║ State: ${call.state}
║ Type: ${call.type}
║ Room ID: ${call.room.id}
║ Room Name: ${call.room.getLocalizedDisplayname()}
║ Is Ringing: ${call.isRinging}
║ Is Outgoing: ${call.isOutgoing}
║ Local Hold: ${call.localHold}
║ Remote Hold: ${call.remoteOnHold}
║ Mic Muted: ${call.isMicrophoneMuted}
║ Video Muted: ${call.isLocalVideoMuted}
║ Screensharing: ${call.screensharingEnabled}
╚══════════════════════════════════════╝
''');
  }
  
  /// Log VoIP system status
  static void logVoipStatus(VoIP voip) {
    VoipLogger().logInfo('''
╔══════════════════════════════════════╗
║         VOIP STATUS DEBUG            ║
╠══════════════════════════════════════╣
║ Current Call ID: ${voip.currentCID ?? 'None'}
║ Current Group Call ID: ${voip.currentGroupCID ?? 'None'}
║ Active Calls: ${voip.calls.keys.toList()}
║ Calls Count: ${voip.calls.length}
║ Group Calls Count: ${voip.groupCalls.length}
╚══════════════════════════════════════╝
''');
  }
  
  /// Test call flow and log state transitions
  static void testCallFlow(CallSession call) {
    VoipLogger().logInfo('═══ TESTING CALL FLOW ═══');
    logCallState(call);
    
    // Test call state transitions
    call.onCallStateChanged.stream.listen((state) {
      VoipLogger().logInfo('🔄 Call state transition: ${call.state} -> $state');
      
      switch (state) {
        case CallState.kFledgling:
          VoipLogger().logInfo('📱 Call initialized - waiting for media');
          break;
        case CallState.kInviteSent:
          VoipLogger().logInfo('📤 Invite sent - waiting for answer');
          break;
        case CallState.kRinging:
          VoipLogger().logInfo('🔔 Call is ringing - UI should show incoming call');
          break;
        case CallState.kConnecting:
          VoipLogger().logInfo('🔗 Connecting - establishing peer connection');
          break;
        case CallState.kConnected:
          VoipLogger().logInfo('✅ Call connected - media should flow');
          break;
        case CallState.kEnded:
          VoipLogger().logInfo('📵 Call ended - cleanup required');
          break;
        default:
          VoipLogger().logInfo('ℹ️ Call state: $state');
      }
    });
    
    // Test call events
    call.onCallEventChanged.stream.listen((event) {
      VoipLogger().logInfo('📢 Call event: $event');
    });
  }
  
  /// Validate call direction detection
  static void validateCallDirection(CallSession call, String expectedDirection) {
    final actualDirection = call.direction.toString();
    final isCorrect = actualDirection.toLowerCase().contains(expectedDirection.toLowerCase());
    
    if (isCorrect) {
      VoipLogger().logInfo('✅ Call direction CORRECT: Expected=$expectedDirection, Actual=$actualDirection');
    } else {
      VoipLogger().logError('❌ Call direction MISMATCH: Expected=$expectedDirection, Actual=$actualDirection');
    }
  }
  
  /// Test TURN server connectivity
  static Future<void> testTurnServerConnectivity(Client client) async {
    VoipLogger().logInfo('🌐 Testing TURN server connectivity...');
    
    try {
      // Request TURN credentials from Matrix server
      final turnResponse = await client.getTurnServer();
      
      VoipLogger().logInfo('''
╔══════════════════════════════════════╗
║      TURN SERVER CREDENTIALS         ║
╠══════════════════════════════════════╣
║ Username: ${turnResponse.username}
║ Password: ${turnResponse.password.substring(0, 10)}...
║ TTL: ${turnResponse.ttl} seconds
║ URIs: ${turnResponse.uris}
╚══════════════════════════════════════╝
''');
      
      if (turnResponse.uris.isEmpty) {
        VoipLogger().logWarning('⚠️ No TURN URIs configured on server');
      } else {
        VoipLogger().logInfo('✅ TURN server credentials received successfully');
        for (final uri in turnResponse.uris) {
          VoipLogger().logInfo('  📍 TURN URI: $uri');
        }
      }
    } catch (e) {
      VoipLogger().logError('❌ Failed to get TURN server credentials', e);
    }
  }
  
  /// Log ICE configuration
  static void logIceConfiguration(Map<String, dynamic> configuration) {
    VoipLogger().logInfo('🧊 ICE Configuration:');
    
    if (configuration.containsKey('iceServers')) {
      final iceServers = configuration['iceServers'] as List;
      for (var i = 0; i < iceServers.length; i++) {
        final server = iceServers[i];
        VoipLogger().logInfo('  Server $i: ${server['urls']}');
      }
    }
    
    if (configuration.containsKey('iceTransportPolicy')) {
      VoipLogger().logInfo('  Transport Policy: ${configuration['iceTransportPolicy']}');
    }
  }
  
  /// Simulate incoming call for testing
  static void logIncomingCallTest(CallSession call) {
    VoipLogger().logInfo('''
╔══════════════════════════════════════╗
║      INCOMING CALL TEST              ║
╠══════════════════════════════════════╣
║ Call ID: ${call.callId}
║ Direction: ${call.direction}
║ State: ${call.state}
║ Is Incoming: ${call.direction == CallDirection.kIncoming}
║ Should Show Answer Button: ${call.direction == CallDirection.kIncoming && call.state == CallState.kRinging}
╚══════════════════════════════════════╝
''');
  }
  
  /// Simulate outgoing call for testing
  static void logOutgoingCallTest(CallSession call) {
    VoipLogger().logInfo('''
╔══════════════════════════════════════╗
║      OUTGOING CALL TEST              ║
╠══════════════════════════════════════╣
║ Call ID: ${call.callId}
║ Direction: ${call.direction}
║ State: ${call.state}
║ Is Outgoing: ${call.direction == CallDirection.kOutgoing}
║ Should Show Calling UI: ${call.direction == CallDirection.kOutgoing}
╚══════════════════════════════════════╝
''');
  }
  
  /// Generate test report
  static String generateTestReport(CallSession call, VoIP voip) {
    final buffer = StringBuffer();
    
    buffer.writeln('═══════════════════════════════════════');
    buffer.writeln('        VOIP TEST REPORT');
    buffer.writeln('═══════════════════════════════════════');
    buffer.writeln('Generated: ${DateTime.now().toIso8601String()}');
    buffer.writeln('');
    buffer.writeln('CALL INFORMATION:');
    buffer.writeln('  - Call ID: ${call.callId}');
    buffer.writeln('  - Type: ${call.type}');
    buffer.writeln('  - Direction: ${call.direction}');
    buffer.writeln('  - State: ${call.state}');
    buffer.writeln('');
    buffer.writeln('VOIP STATUS:');
    buffer.writeln('  - Current Call: ${voip.currentCID ?? "None"}');
    buffer.writeln('  - Active Calls: ${voip.calls.length}');
    buffer.writeln('');
    buffer.writeln('MEDIA STATUS:');
    buffer.writeln('  - Mic Muted: ${call.isMicrophoneMuted}');
    buffer.writeln('  - Video Muted: ${call.isLocalVideoMuted}');
    buffer.writeln('  - Screensharing: ${call.screensharingEnabled}');
    buffer.writeln('═══════════════════════════════════════');
    
    return buffer.toString();
  }
}
