import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;

import 'voip_logger.dart';

/// Debug helper to check if .env is loaded
void debugEnvVariables() {
  final allKeys = dotenv.env.keys.toList();
  VoipLogger().logInfo('Total .env keys loaded: ${allKeys.length}');
  VoipLogger().logInfo('TURN-related keys: ${allKeys.where((k) => k.contains("TURN")).toList()}');
}

/// TURN Server Credentials Generator
/// 
/// Generates time-limited credentials for TURN server authentication
/// using HMAC-SHA1 with shared secret (coturn compatible)
class TurnCredentials {
  /// TURN server URL from .env
  static String get turnServerUrl => 
      dotenv.env['TURN_SERVER_URL'] ?? '';
  
  /// Shared secret for TURN authentication from .env
  static String get turnSharedSecret {
    final secret = dotenv.env['TURN_SHARED_SECRET'];
    if (secret == null || secret.isEmpty) {
      // Try alternative key names
      return dotenv.env['TURN_SECRET'] ?? '';
    }
    return secret;
  }
  
  /// Credential lifetime in milliseconds from .env (default 24 hours)
  static int get turnUserLifetime => 
      int.tryParse(dotenv.env['TURN_USER_LIFETIME'] ?? '') ?? 86400000;
  
  /// Generate TURN credentials using HMAC-SHA1 (coturn REST API compatible)
  /// 
  /// The username is: <timestamp>:<userId>
  /// The password is: HMAC-SHA1(username, sharedSecret) in base64
  static Map<String, dynamic> generateCredentials({String? userId}) {
    final secret = turnSharedSecret;
    
    if (secret.isEmpty) {
      VoipLogger().logWarning('! TURN_SHARED_SECRET not configured in .env');
      VoipLogger().logInfo('   Add to .env: TURN_SHARED_SECRET=your_secret_here');
      VoipLogger().logInfo('   Current .env keys: ${dotenv.env.keys.where((k) => k.contains("TURN")).toList()}');
      return {};
    }
    
    VoipLogger().logInfo('✅ TURN credentials loaded from .env');
    VoipLogger().logInfo('   Server: $turnServerUrl');
    VoipLogger().logInfo('   Secret: ${secret.substring(0, 5)}... (configured)');
    
    // Username format: timestamp:userId (coturn REST API format)
    // Timestamp is Unix time when credentials expire
    final expiryTime = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 
        (turnUserLifetime ~/ 1000);
    final username = '$expiryTime:${userId ?? 'bmp_user'}';
    
    // Generate HMAC-SHA1 password
    final key = utf8.encode(secret);
    final bytes = utf8.encode(username);
    final hmacSha1 = Hmac(sha1, key);
    final digest = hmacSha1.convert(bytes);
    final password = base64.encode(digest.bytes);
    
    VoipLogger().logInfo('');
    VoipLogger().logInfo('╔══════════════════════════════════════╗');
    VoipLogger().logInfo('║    TURN CREDENTIALS GENERATED        ║');
    VoipLogger().logInfo('╠══════════════════════════════════════╣');
    VoipLogger().logInfo('║ Server: $turnServerUrl');
    VoipLogger().logInfo('║ Username: $username');
    VoipLogger().logInfo('║ Password: ${password.substring(0, 10)}... (HMAC-SHA1)');
    VoipLogger().logInfo('║ Expires: ${DateTime.fromMillisecondsSinceEpoch(expiryTime * 1000)}');
    VoipLogger().logInfo('╚══════════════════════════════════════╝');
    
    return {
      'username': username,
      'password': password,
      'ttl': turnUserLifetime ~/ 1000,
      'uris': [
        'turn:$turnServerUrl?transport=udp',
        'turn:$turnServerUrl?transport=tcp',
      ],
    };
  }
  
  /// Get ICE servers configuration with Google STUN and TURN credentials
  static List<Map<String, dynamic>> getIceServers({String? userId}) {
    final credentials = generateCredentials(userId: userId);
    
    if (credentials.isEmpty) {
      VoipLogger().logWarning('No TURN credentials');
      return [];
    }
    
    return [
      {
        'urls': [
          'stun:stun.l.google.com:19302',
          'stun:stun1.l.google.com:19302',
        ],
      },
      {
        'urls': ['turn:$turnServerUrl?transport=udp'],
        'username': credentials['username'],
        'credential': credentials['password'],
      },
      {
        'urls': ['turn:$turnServerUrl?transport=tcp'],
        'username': credentials['username'],
        'credential': credentials['password'],
      },
    ];
  }
  
  /// Test TURN server connectivity using actual WebRTC ICE gathering
  /// This creates a real RTCPeerConnection and checks for relay candidates
  static Future<bool> testConnectivity() async {
    VoipLogger().logInfo('');
    VoipLogger().logInfo('╔══════════════════════════════════════════════════════════╗');
    VoipLogger().logInfo('║         TURN SERVER CONNECTIVITY TEST                    ║');
    VoipLogger().logInfo('╚══════════════════════════════════════════════════════════╝');
    
    try {
      final credentials = generateCredentials(userId: 'test_user');
      if (credentials.isEmpty) {
        VoipLogger().logError('  Cannot test - no TURN credentials configured');
        return false;
      }
      
      VoipLogger().logInfo('🔧 Step 1: Credentials Generated');
      VoipLogger().logInfo('   └─ Server: $turnServerUrl');
      VoipLogger().logInfo('   └─ Username: ${credentials['username']}');
      
      // Create ICE servers configuration
      final iceServers = getIceServers(userId: 'test_user');
      
      VoipLogger().logInfo('');
      VoipLogger().logInfo('🌐 Step 2: Creating WebRTC PeerConnection for ICE test...');
      VoipLogger().logInfo('   └─ ICE Servers count: ${iceServers.length}');
      for (var i = 0; i < iceServers.length; i++) {
        final server = iceServers[i];
        VoipLogger().logInfo('   └─ Server $i: ${server['urls']}');
      }
      
      // Create peer connection with TURN servers
      final config = {
        'iceServers': iceServers,
        'iceCandidatePoolSize': 0,
      };
      
      final pc = await webrtc.createPeerConnection(config);
      
      VoipLogger().logInfo('   └─ ✅ PeerConnection created');
      
      // Track ICE candidates
      final candidates = <Map<String, dynamic>>[];
      final completer = Completer<bool>();
      bool hasRelay = false;
      bool hasStun = false;
      bool hasHost = false;
      
      VoipLogger().logInfo('');
      VoipLogger().logInfo('🧊 Step 3: Gathering ICE Candidates...');
      
      pc.onIceCandidate = (candidate) {
        if (candidate.candidate != null && candidate.candidate!.isNotEmpty) {
          final candidateStr = candidate.candidate!;
          
          // Parse candidate type
          var candidateType = 'unknown';
          if (candidateStr.contains('typ relay')) {
            candidateType = 'relay (TURN)';
            hasRelay = true;
          } else if (candidateStr.contains('typ srflx')) {
            candidateType = 'srflx (STUN)';
            hasStun = true;
          } else if (candidateStr.contains('typ host')) {
            candidateType = 'host (local)';
            hasHost = true;
          }
          
          candidates.add({
            'type': candidateType,
            'candidate': candidateStr,
          });
          
          VoipLogger().logInfo('   └─ Found: $candidateType');
          if (candidateType == 'relay (TURN)') {
            VoipLogger().logInfo('      └─ 🎉 TURN SERVER WORKING!');
          }
        }
      };
      
      pc.onIceGatheringState = (state) {
        VoipLogger().logInfo('   └─ ICE Gathering State: $state');
        if (state == webrtc.RTCIceGatheringState.RTCIceGatheringStateComplete) {
          if (!completer.isCompleted) {
            completer.complete(hasRelay);
          }
        }
      };
      
      pc.onIceConnectionState = (state) {
        VoipLogger().logInfo('   └─ ICE Connection State: $state');
      };
      
      // Create a data channel to trigger ICE gathering
      await pc.createDataChannel('test', webrtc.RTCDataChannelInit());
      
      // Create offer to start ICE gathering
      final offer = await pc.createOffer();
      await pc.setLocalDescription(offer);
      
      VoipLogger().logInfo('   └─ Offer created, waiting for ICE candidates...');
      
      // Wait for ICE gathering with timeout
      final result = await completer.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          VoipLogger().logWarning('   └─ ⏱️ ICE gathering timeout (10s)');
          return hasRelay;
        },
      );
      
      // Cleanup
      await pc.close();
      
      // Log results
      VoipLogger().logInfo('');
      VoipLogger().logInfo('╔══════════════════════════════════════════════════════════╗');
      VoipLogger().logInfo('║              TEST RESULTS                                ║');
      VoipLogger().logInfo('╠══════════════════════════════════════════════════════════╣');
      VoipLogger().logInfo('║ Total Candidates Found: ${candidates.length}');
      VoipLogger().logInfo('║ Host (Local IP):    ${hasHost ? "✅ Found" : "  Not Found"}');
      VoipLogger().logInfo('║ STUN (Public IP):   ${hasStun ? "✅ Found" : "  Not Found"}');
      VoipLogger().logInfo('║ TURN (Relay):       ${hasRelay ? "✅ Found - SERVER WORKING!" : "  Not Found - CHECK SERVER!"}');
      VoipLogger().logInfo('╠══════════════════════════════════════════════════════════╣');
      
      if (hasRelay) {
        VoipLogger().logInfo('║ 🎉 TURN SERVER IS CONNECTED AND WORKING!                ║');
      } else if (hasStun) {
        VoipLogger().logWarning('║ ⚠️  STUN working but TURN unreachable                   ║');
      } else if (hasHost) {
        VoipLogger().logError('║   Only host candidates - STUN/TURN unreachable         ║');
      } else {
        VoipLogger().logError('║   No candidates found - network issue                   ║');
      }
      
      VoipLogger().logInfo('╚══════════════════════════════════════════════════════════╝');
      VoipLogger().logInfo('');
      
      return result;
    } catch (e, s) {
      VoipLogger().logError('  TURN connectivity test failed', e, s);
      return false;
    }
  }
  
  /// Quick test - just checks if credentials can be generated
  static Future<bool> quickTest() async {
    try {
      VoipLogger().logInfo('🔄 Quick TURN credentials test...');
      final credentials = generateCredentials(userId: 'quick_test');
      if (credentials.isEmpty) {
        VoipLogger().logError('  TURN credentials not configured');
        return false;
      }
      VoipLogger().logInfo('✅ TURN credentials generated successfully');
      VoipLogger().logInfo('   Server: $turnServerUrl');
      VoipLogger().logInfo('   URIs: ${credentials['uris']}');
      return true;
    } catch (e) {
      VoipLogger().logError('  TURN test failed', e);
      return false;
    }
  }
}
