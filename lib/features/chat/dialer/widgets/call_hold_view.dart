import 'package:flutter/material.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';

/// Displays hold status when call is on hold
class CallHoldView extends StatelessWidget {
  const CallHoldView({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.pause,
            size: context.percentWidth * 12,
            color: Colors.white,
          ),
          SizedBox(height: context.percentHeight * 2),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.percentWidth * 6,
            ),
          ),
        ],
      ),
    );
  }
}
