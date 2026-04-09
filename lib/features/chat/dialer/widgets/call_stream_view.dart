import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/voip/video_renderer.dart' as custom;
import 'package:bmp/shared/widgets/avatar.dart';

/// Displays video/audio stream with avatar fallback
/// Extracted from dialer.dart _StreamView
class CallStreamView extends StatelessWidget {
  const CallStreamView({
    required this.wrappedStream,
    required this.matrixClient,
    this.mainView = false,
    super.key,
  });

  final WrappedMediaStream wrappedStream;
  final Client matrixClient;
  final bool mainView;

  Uri? get avatarUrl => wrappedStream.getUser().avatarUrl;
  String? get displayName => wrappedStream.displayName;
  String get avatarName => wrappedStream.avatarName;
  bool get isLocal => wrappedStream.isLocal();
  
  bool get mirrored =>
      wrappedStream.isLocal() &&
      wrappedStream.purpose == SDPStreamMetadataPurpose.Usermedia;

  bool get audioMuted => wrappedStream.audioMuted;
  bool get videoMuted => wrappedStream.videoMuted;
  
  bool get isScreenSharing =>
      wrappedStream.purpose == SDPStreamMetadataPurpose.Screenshare;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          custom.VideoRenderer(
            wrappedStream,
            mirror: mirrored,
            fit: mainView 
                ? RTCVideoViewObjectFit.RTCVideoViewObjectFitCover 
                : RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          ),
          if (videoMuted) ...[
            Container(color: Colors.black54),
            Positioned(
              child: Avatar(
                mxContent: avatarUrl,
                name: displayName,
                size: mainView ? context.percentWidth * 24 : context.percentWidth * 12,
                client: matrixClient,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
