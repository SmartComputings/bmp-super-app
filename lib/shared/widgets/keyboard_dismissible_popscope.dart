import 'package:flutter/material.dart';

/// A wrapper widget that handles keyboard dismissal before navigation.
/// 
/// When the back button is pressed:
/// 1. If keyboard is open (any focusNode has focus), it closes the keyboard
/// 2. If keyboard is closed, it allows normal back navigation
/// 
/// Usage:
/// ```dart
/// KeyboardDismissiblePopScope(
///   focusNodes: [emailFocusNode, passwordFocusNode],
///   child: YourWidget(),
/// )
/// ```
class KeyboardDismissiblePopScope extends StatefulWidget {
  final Widget child;
  final List<FocusNode> focusNodes;
  final VoidCallback? onNavigateBack;

  const KeyboardDismissiblePopScope({
    super.key,
    required this.child,
    required this.focusNodes,
    this.onNavigateBack,
  });

  @override
  State<KeyboardDismissiblePopScope> createState() => _KeyboardDismissiblePopScopeState();
}

class _KeyboardDismissiblePopScopeState extends State<KeyboardDismissiblePopScope> {
  bool get _hasAnyFocus => widget.focusNodes.any((node) => node.hasFocus);

  @override
  void initState() {
    super.initState();
    for (final node in widget.focusNodes) {
      node.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    for (final node in widget.focusNodes) {
      node.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_hasAnyFocus && widget.onNavigateBack == null,
      onPopInvokedWithResult: (didPop, result) {
        debugPrint('onPopInvokedWithResult: didPop=$didPop, hasFocus=$_hasAnyFocus');
        if (didPop) return;
        
        if (_hasAnyFocus) {
          for (final node in widget.focusNodes) {
            if (node.hasFocus) {
              node.unfocus();
            }
          }
        } else {
          if (widget.onNavigateBack != null) {
            debugPrint('Invoking custom onNavigateBack callback');
            widget.onNavigateBack!();
          } else if (Navigator.of(context).canPop()) {
            debugPrint('No focus nodes focused, performing normal pop');
            Navigator.of(context).pop();
          }
        }
      },
      child: widget.child,
    );
  }
}
