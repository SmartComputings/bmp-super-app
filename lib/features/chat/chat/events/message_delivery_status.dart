import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

/// WhatsApp-style message delivery status indicator.
///
/// Maps Matrix event lifecycle states to visual tick indicators:
/// - Sending → animated clock icon
/// - Sent → single grey tick
/// - Delivered → double grey tick
/// - Read → double blue tick
/// - Error → red error icon
class MessageDeliveryStatus extends StatelessWidget {
  final Event event;
  final Timeline timeline;
  final double size;
  final Color? readColor;

  static const Color _brandBlue = Color(0xFF4FC3F7);
  static const Color _greyTick = Color(0x99FFFFFF);
  static const Color _errorRed = Color(0xFFFF5252);

  const MessageDeliveryStatus({
    required this.event,
    required this.timeline,
    this.size = 14,
    this.readColor,
    super.key,
  });

  /// Check if all other participants in the room have read this event.
  bool _isReadByAll() {
    final room = event.room;
    final ownUserId = room.client.userID;

    if (room.isDirectChat) {
      // In DM: check if the other user's read marker is at or past this event
      final otherUsers = room.getParticipants()
          .where((u) => u.id != ownUserId && u.membership == Membership.join)
          .toList();

      if (otherUsers.isEmpty) return false;

      for (final user in otherUsers) {
        if (!_hasUserReadEvent(room, user.id)) {
          return false;
        }
      }
      return true;
    } else {
      // In group: check if all active members have read
      final joinedMembers = room.getParticipants()
          .where((u) => u.id != ownUserId && u.membership == Membership.join)
          .toList();

      if (joinedMembers.isEmpty) return false;

      for (final member in joinedMembers) {
        if (!_hasUserReadEvent(room, member.id)) {
          return false;
        }
      }
      return true;
    }
  }

  /// Check if at least one other participant has synced/received this event.
  bool _isDelivered() {
    final room = event.room;
    final ownUserId = room.client.userID;

    final otherUsers = room.getParticipants()
        .where((u) => u.id != ownUserId && u.membership == Membership.join)
        .toList();

    if (otherUsers.isEmpty) return false;

    // If any user has a read receipt, it's at least delivered
    for (final user in otherUsers) {
      if (_hasUserAnyReceipt(room, user.id)) {
        return true;
      }
    }
    return false;
  }

  bool _hasUserReadEvent(Room room, String userId) {
    try {
      final receipt = room.receiptState;
      if (receipt == null) return false;

      // Check if user's read receipt event ID matches or is after this event
      final userReceipt = receipt.global.otherUsers[userId];
      if (userReceipt == null) return false;

      final receiptEventId = userReceipt.eventId;

      // If the receipt is for this exact event, it's read
      if (receiptEventId == event.eventId) return true;

      // Check if the receipt event comes after this event in the timeline
      final events = timeline.events;
      final thisIndex = events.indexWhere((e) => e.eventId == event.eventId);
      final receiptIndex = events.indexWhere((e) => e.eventId == receiptEventId);

      // Timeline events are in reverse chronological order (newest first)
      // So a lower index means newer event
      if (thisIndex >= 0 && receiptIndex >= 0) {
        return receiptIndex <= thisIndex;
      }

      return false;
    } catch (_) {
      return false;
    }
  }

  bool _hasUserAnyReceipt(Room room, String userId) {
    try {
      final receipt = room.receiptState;
      if (receipt == null) return false;
      return receipt.global.otherUsers.containsKey(userId);
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Only show for own messages
    final ownUserId = event.room.client.userID;
    if (event.senderId != ownUserId) return const SizedBox.shrink();

    final status = event.status;
    final Color tickColor;
    final Widget icon;

    if (status == EventStatus.error) {
      // Failed to send
      tickColor = _errorRed;
      icon = Icon(
        Icons.error_outline_rounded,
        size: size,
        color: tickColor,
      );
    } else if (status.isSending) {
      // Sending (local echo)
      tickColor = _greyTick;
      icon = SizedBox(
        width: size,
        height: size,
        child: _AnimatedClockIcon(size: size, color: tickColor),
      );
    } else if (status == EventStatus.sent) {
      // Sent to server - now check read receipts
      if (_isReadByAll()) {
        // Read by recipient(s)
        tickColor = readColor ?? _brandBlue;
        icon = _DoubleTick(size: size, color: tickColor);
      } else if (_isDelivered()) {
        // Delivered to at least one device
        tickColor = _greyTick;
        icon = _DoubleTick(size: size, color: tickColor);
      } else {
        // Sent but not yet delivered
        tickColor = _greyTick;
        icon = _SingleTick(size: size, color: tickColor);
      }
    } else if (status == EventStatus.synced) {
      // Synced — also check if read
      if (_isReadByAll()) {
        tickColor = readColor ?? _brandBlue;
        icon = _DoubleTick(size: size, color: tickColor);
      } else if (_isDelivered()) {
        tickColor = _greyTick;
        icon = _DoubleTick(size: size, color: tickColor);
      } else {
        tickColor = _greyTick;
        icon = _SingleTick(size: size, color: tickColor);
      }
    } else {
      // Default: single tick
      tickColor = _greyTick;
      icon = _SingleTick(size: size, color: tickColor);
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation, child: child),
      ),
      child: SizedBox(
        key: ValueKey('${event.eventId}_${status}_${_isReadByAll()}_${_isDelivered()}'),
        width: size + 4,
        height: size,
        child: icon,
      ),
    );
  }
}

/// Single tick (✓) for sent state
class _SingleTick extends StatelessWidget {
  final double size;
  final Color color;

  const _SingleTick({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SingleTickPainter(color: color),
    );
  }
}

/// Double tick (✓✓) for delivered/read state
class _DoubleTick extends StatelessWidget {
  final double size;
  final Color color;

  const _DoubleTick({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size + 4, size),
      painter: _DoubleTickPainter(color: color),
    );
  }
}

/// Animated clock icon for sending state
class _AnimatedClockIcon extends StatefulWidget {
  final double size;
  final Color color;

  const _AnimatedClockIcon({required this.size, required this.color});

  @override
  State<_AnimatedClockIcon> createState() => _AnimatedClockIconState();
}

class _AnimatedClockIconState extends State<_AnimatedClockIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: _ClockPainter(
            color: widget.color,
            progress: _controller.value,
          ),
        );
      },
    );
  }
}

class _SingleTickPainter extends CustomPainter {
  final Color color;

  _SingleTickPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Single check mark
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.42, size.height * 0.72);
    path.lineTo(size.width * 0.8, size.height * 0.28);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DoubleTickPainter extends CustomPainter {
  final Color color;

  _DoubleTickPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // First check mark (slightly left)
    final path1 = Path();
    path1.moveTo(size.width * 0.08, size.height * 0.5);
    path1.lineTo(size.width * 0.28, size.height * 0.72);
    path1.lineTo(size.width * 0.62, size.height * 0.28);
    canvas.drawPath(path1, paint);

    // Second check mark (slightly right, overlapping)
    final path2 = Path();
    path2.moveTo(size.width * 0.28, size.height * 0.5);
    path2.lineTo(size.width * 0.48, size.height * 0.72);
    path2.lineTo(size.width * 0.82, size.height * 0.28);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ClockPainter extends CustomPainter {
  final Color color;
  final double progress;

  _ClockPainter({required this.color, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.38;

    // Circle
    final circlePaint = Paint()
      ..color = color
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, circlePaint);

    // Hour hand (static)
    final hourPaint = Paint()
      ..color = color
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center,
      Offset(center.dx, center.dy - radius * 0.5),
      hourPaint,
    );

    // Minute hand (rotating)
    final angle = progress * 2 * 3.14159;
    final minuteEnd = Offset(
      center.dx + radius * 0.65 * _sin(angle),
      center.dy - radius * 0.65 * _cos(angle),
    );
    canvas.drawLine(center, minuteEnd, hourPaint);
  }

  double _sin(double radians) {
    return _sinApprox(radians);
  }

  double _cos(double radians) {
    return _sinApprox(radians + 1.5708);
  }

  double _sinApprox(double x) {
    // Normalize to [-pi, pi]
    x = x % 6.28318;
    if (x > 3.14159) x -= 6.28318;
    if (x < -3.14159) x += 6.28318;

    // Taylor series approximation
    final x3 = x * x * x;
    final x5 = x3 * x * x;
    return x - x3 / 6.0 + x5 / 120.0;
  }

  @override
  bool shouldRepaint(covariant _ClockPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
