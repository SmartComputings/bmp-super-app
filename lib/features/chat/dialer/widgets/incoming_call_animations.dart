import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';

/// Animation controller for swipe-to-answer gesture
/// Handles drag logic, threshold detection, and rollback animations
class SwipeToAnswerController extends ChangeNotifier {
  double _dragOffset = 0.0;
  bool _isDragging = false;
  bool _hasAnswered = false;
  
  double get dragOffset => _dragOffset;
  bool get isDragging => _isDragging;
  bool get hasAnswered => _hasAnswered;

  /// Calculate drag progress (0.0 to 1.0)
  double getProgress(double maxDistance) {
    if (maxDistance <= 0) return 0.0;
    return (_dragOffset / maxDistance).clamp(0.0, 1.0);
  }

  /// Called when drag starts
  void onDragStart() {
    _isDragging = true;
    notifyListeners();
  }

  /// Called during drag update
  void onDragUpdate(double deltaX, double maxDistance) {
    // Negative deltaX means dragging left
    _dragOffset = (_dragOffset - deltaX).clamp(0.0, maxDistance);
    notifyListeners();
  }

  /// Called when drag ends
  /// Returns true if threshold was reached (call should be answered)
  bool onDragEnd(double maxDistance, {double threshold = 0.5}) {
    _isDragging = false;
    
    final progress = getProgress(maxDistance);
    
    if (progress >= threshold) {
      // Threshold reached - answer call
      _hasAnswered = true;
      HapticFeedback.mediumImpact();
      notifyListeners();
      return true;
    } else {
      // Spring back - will be animated by the widget
      notifyListeners();
      return false;
    }
  }

  /// Reset drag offset (for spring back animation)
  void resetOffset() {
    _dragOffset = 0.0;
    notifyListeners();
  }

  /// Set drag offset directly (for animation)
  void setOffset(double offset) {
    _dragOffset = offset;
    notifyListeners();
  }

  /// Reset controller state
  void reset() {
    _dragOffset = 0.0;
    _isDragging = false;
    _hasAnswered = false;
    notifyListeners();
  }
}

/// Widget that provides swipe-to-answer UI with animation
class SwipeToAnswerButton extends StatefulWidget {
  const SwipeToAnswerButton({
    required this.onAnswer,
    required this.onDecline,
    this.answerButtonColor = const Color(0x994754FF),
    this.declineButtonColor = const Color(0xFFF63D3D),
    this.trackColor = const Color.fromRGBO(0, 0, 0, 0.2),
    this.buttonSize = 60.0,
    this.threshold = 0.5,
    super.key,
  });

  final VoidCallback onAnswer;
  final VoidCallback onDecline;
  final Color answerButtonColor;
  final Color declineButtonColor;
  final Color trackColor;
  final double buttonSize;
  final double threshold;

  @override
  State<SwipeToAnswerButton> createState() => _SwipeToAnswerButtonState();
}

class _SwipeToAnswerButtonState extends State<SwipeToAnswerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _springController;
  late Animation<double> _springAnimation;
  final SwipeToAnswerController _controller = SwipeToAnswerController();

  @override
  void initState() {
    super.initState();
    _springController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _springAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _springController, curve: Curves.easeOutBack),
    );
    _springController.addListener(() {
      _controller.setOffset(_springAnimation.value);
    });
  }

  @override
  void dispose() {
    _springController.dispose();
    _controller.dispose();
    super.dispose();
  }

  double get _maxDragDistance {
    return context.screenWidth - context.percentWidth * 15;
  }

  void _onDragStart(DragStartDetails details) {
    _springController.stop();
    _controller.onDragStart();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    _controller.onDragUpdate(details.delta.dx, _maxDragDistance);
  }

  void _onDragEnd(DragEndDetails details) {
    final shouldAnswer = _controller.onDragEnd(
      _maxDragDistance,
      threshold: widget.threshold,
    );
    
    if (shouldAnswer) {
      widget.onAnswer();
    } else {
      // Spring back animation
      _springAnimation = Tween<double>(
        begin: _controller.dragOffset,
        end: 0,
      ).animate(CurvedAnimation(
        parent: _springController,
        curve: Curves.easeOutBack,
      ));
      _springController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        final progress = _controller.getProgress(_maxDragDistance);
        
        return Container(
          margin: EdgeInsets.symmetric(horizontal: context.percentWidth * 2.5),
          height: context.percentHeight * 9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Swipe track background
              Container(
                height: context.percentHeight * 6.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: widget.trackColor,
                ),
              ),
              
              // Chevron indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildChevrons(isLeft: true, progress: progress),
                  SizedBox(width: context.percentWidth * 15),
                  _buildChevrons(isLeft: false, progress: progress),
                ],
              ),
              
              // Decline button (left side, static)
              Positioned(
                left: 0,
                child: _buildDeclineButton(),
              ),
              
              // Answer button (right side, draggable)
              Positioned(
                right: _controller.dragOffset,
                child: _buildAnswerButton(progress),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDeclineButton() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        widget.onDecline();
      },
      child: Container(
        width: context.percentWidth * 15,
        height: context.percentWidth * 15,
        decoration: BoxDecoration(
          color: widget.declineButtonColor,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(246, 61, 61, 0.4),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.call_end,
          color: Colors.white,
          size: context.percentWidth * 8,
        ),
      ),
    );
  }

  Widget _buildAnswerButton(double progress) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      onTap: () {
        // Also allow tap to answer
        HapticFeedback.mediumImpact();
        widget.onAnswer();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: _controller.isDragging ? 0 : 50),
        width: context.percentWidth * 15,
        height: context.percentWidth * 15,
        decoration: BoxDecoration(
          color: widget.answerButtonColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(132, 28, 191, 0.8),
              blurRadius: 10 + (progress * 10),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.call,
          color: Colors.white,
          size: context.percentWidth * 8,
        ),
      ),
    );
  }

  Widget _buildChevrons({required bool isLeft, required double progress}) {
    final opacity = isLeft 
        ? (1.0 - progress).clamp(0.3, 1.0)
        : (0.3 + progress * 0.7).clamp(0.3, 1.0);
    
    return Opacity(
      opacity: opacity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isLeft ? Icons.chevron_left : Icons.chevron_right,
            color: const Color.fromRGBO(255, 255, 255, 0.5),
            size: context.percentWidth * 6,
          ),
          Icon(
            isLeft ? Icons.chevron_left : Icons.chevron_right,
            color: const Color.fromRGBO(255, 255, 255, 0.7),
            size: context.percentWidth * 6,
          ),
        ],
      ),
    );
  }
}
