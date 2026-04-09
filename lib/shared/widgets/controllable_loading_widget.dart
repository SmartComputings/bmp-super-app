import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:flutter/material.dart';

class ControllableLoadingWidget extends StatefulWidget {
  final String title;
  final String description;
  final bool isVisible;
  final Widget? child;

  const ControllableLoadingWidget({
    super.key,
    this.title = 'Loading...',
    this.description = '',
    required this.isVisible,
    this.child,
  });

  @override
  State<ControllableLoadingWidget> createState() =>
      _ControllableLoadingWidgetState();
}

class _ControllableLoadingWidgetState extends State<ControllableLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.child != null) widget.child!,
        if (widget.isVisible)
          Container(
            color: Colors.black54,
            child: Center(
              child: Container(
                width: 382,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: ShapeDecoration(
                  color: const Color(0xFF222C37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 58,
                      height: 58,
                      child: RotationTransition(
                        turns: _controller,
                        child: const AppLoadingWidget()
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFF3F7F8),
                        fontSize: 16,
                        fontFamily: 'Neometric',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFC6D4DB),
                        fontSize: 14,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Icon(
                      Icons.hourglass_empty,
                      color: Color(0xFF6F8DA1),
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
