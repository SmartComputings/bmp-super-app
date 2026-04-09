import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  final String? message;
  final Color backgroundColor;
  final Color loaderColor;
  final double? size;

  const AppLoadingWidget({
    super.key,
    this.message,
    this.backgroundColor = const Color(0xFF1B1C30),
    this.loaderColor = Colors.white,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size ?? 24,
                height: size ?? 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: loaderColor,
                ),
              ),
              if (message != null)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    message!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}