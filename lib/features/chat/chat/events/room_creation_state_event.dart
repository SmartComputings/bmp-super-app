import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class RoomCreationStateEvent extends StatelessWidget {
  final Event event;

  const RoomCreationStateEvent({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
