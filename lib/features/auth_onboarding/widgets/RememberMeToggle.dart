import 'package:flutter/material.dart';
import '../services/remember_me_service.dart';

import '../../../core/localization/l10n.dart';

class ToggleSwitchPainter extends CustomPainter {
  final bool isToggled;

  ToggleSwitchPainter({required this.isToggled});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4754FF)
      ..style = PaintingStyle.fill;

    final path = Path();
    
    if (isToggled) {
      // SVG path for ON state
      path.moveTo(13.3981, 8.59602);
      path.lineTo(26.6751, 8.59602);
      path.cubicTo(29.7233, 8.56696, 32.6583, 9.7514, 34.8351, 11.889);
      path.cubicTo(37.0119, 14.0267, 38.2525, 16.9426, 38.2841, 19.996);
      path.cubicTo(38.2525, 23.0501, 37.0114, 25.9667, 34.8337, 28.1044);
      path.cubicTo(32.656, 30.2422, 29.72, 31.4261, 26.6711, 31.396);
      path.lineTo(13.3941, 31.396);
      path.cubicTo(10.3459, 31.4251, 7.41092, 30.2406, 5.23411, 28.103);
      path.cubicTo(3.05729, 25.9654, 1.81677, 23.0494, 1.78516, 19.996);
      path.cubicTo(1.81677, 16.9419, 3.05784, 14.0254, 5.23552, 11.8876);
      path.cubicTo(7.4132, 9.74986, 10.3492, 8.5659, 13.3981, 8.59602);
      path.close();
      
      // Circle path
      path.moveTo(26.6751, 24.887);
      path.cubicTo(27.6355, 24.8669, 28.5686, 24.5634, 29.3575, 24.0143);
      path.cubicTo(30.1463, 23.4653, 30.7559, 22.6952, 31.1097, 21.8007);
      path.cubicTo(31.4636, 20.9061, 31.546, 19.9268, 31.3466, 18.9855);
      path.cubicTo(31.1472, 18.0442, 30.6749, 17.1828, 29.9889, 16.5093);
      path.cubicTo(29.3029, 15.8357, 28.4337, 15.38, 27.4903, 15.1992);
      path.cubicTo(26.5468, 15.0183, 25.5711, 15.1205, 24.6853, 15.4928);
      path.cubicTo(23.7995, 15.8651, 23.0432, 16.491, 22.511, 17.2921);
      path.cubicTo(21.9788, 18.0932, 21.6945, 19.0338, 21.6937, 19.996);
      path.cubicTo(21.6997, 20.6445, 21.8332, 21.2855, 22.0866, 21.8823);
      path.cubicTo(22.34, 22.4791, 22.7082, 23.0201, 23.1704, 23.4743);
      path.cubicTo(23.6325, 23.9285, 24.1795, 24.2871, 24.78, 24.5295);
      path.cubicTo(25.3805, 24.7718, 26.0228, 24.8934, 26.6701, 24.887);
      path.close();
    } else {
      // Simple rounded rectangle for OFF state
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(2, 12, 36, 16),
        const Radius.circular(8),
      );
      paint.color = const Color(0x7F050926);
      canvas.drawRRect(rect, paint);
      
      // Circle for OFF state
      paint.color = Colors.white;
      canvas.drawCircle(const Offset(10, 20), 6, paint);
      return;
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RememberMeToggle extends StatefulWidget {
  final Function(bool)? onChanged;
  final bool initialValue;

  const RememberMeToggle({
    super.key,
    this.onChanged,
    this.initialValue = false,
  });

  @override
  State<RememberMeToggle> createState() => _RememberMeToggleState();
}

class _RememberMeToggleState extends State<RememberMeToggle> {
  late bool isToggled;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialValue;
    _loadRememberMeState();
  }

  Future<void> _loadRememberMeState() async {
    final savedState = await RememberMeService.getRememberMeState();
    if (mounted) {
      setState(() {
        isToggled = savedState;
      });
    }
  }

  Future<void> _saveRememberMeState(bool value) async {
    await RememberMeService.setRememberMeState(value);
  }

  @override
  void didUpdateWidget(RememberMeToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        isToggled = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final newValue = !isToggled;
        setState(() {
          isToggled = newValue;
        });
        await _saveRememberMeState(newValue);
        widget.onChanged?.call(newValue);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            L10n.of(context).rememberMe,
            style: const TextStyle(
              color: Color(0xFFD2D4E5),
              fontSize: 12,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            height: 40,
            child: CustomPaint(
              painter: ToggleSwitchPainter(isToggled: isToggled),
            ),
          ),
        ],
      ),
    );
  }
}