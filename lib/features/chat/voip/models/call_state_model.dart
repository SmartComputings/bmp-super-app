import 'package:equatable/equatable.dart';
import 'package:matrix/matrix.dart';

/// Clean call state model using Equatable for value comparison
class CallStateModel extends Equatable {
  final String callId;
  final String roomId;
  final CallState state;
  final CallDirection direction;
  final CallType type;
  final bool isActive;
  final bool isMuted;
  final bool isVideoMuted;
  final bool isOnHold;
  final DateTime startTime;

  const CallStateModel({
    required this.callId,
    required this.roomId,
    required this.state,
    required this.direction,
    required this.type,
    required this.isActive,
    required this.isMuted,
    required this.isVideoMuted,
    required this.isOnHold,
    required this.startTime,
  });

  factory CallStateModel.fromCallSession(CallSession call) {
    return CallStateModel(
      callId: call.callId,
      roomId: call.room.id,
      state: call.state,
      direction: call.direction,
      type: call.type,
      isActive: call.state == CallState.kConnected,
      isMuted: call.isMicrophoneMuted,
      isVideoMuted: call.isLocalVideoMuted,
      isOnHold: call.localHold || call.remoteOnHold,
      startTime: DateTime.now(),
    );
  }

  CallStateModel copyWith({
    String? callId,
    String? roomId,
    CallState? state,
    CallDirection? direction,
    CallType? type,
    bool? isActive,
    bool? isMuted,
    bool? isVideoMuted,
    bool? isOnHold,
    DateTime? startTime,
  }) {
    return CallStateModel(
      callId: callId ?? this.callId,
      roomId: roomId ?? this.roomId,
      state: state ?? this.state,
      direction: direction ?? this.direction,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
      isMuted: isMuted ?? this.isMuted,
      isVideoMuted: isVideoMuted ?? this.isVideoMuted,
      isOnHold: isOnHold ?? this.isOnHold,
      startTime: startTime ?? this.startTime,
    );
  }

  @override
  List<Object?> get props => [
    callId,
    roomId,
    state,
    direction,
    type,
    isActive,
    isMuted,
    isVideoMuted,
    isOnHold,
    startTime,
  ];
}