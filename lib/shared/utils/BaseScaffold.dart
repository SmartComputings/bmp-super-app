import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;

  /// Background color (only used if no gradient is provided)
  final Color backgroundColor;

  /// Allows full customization of the radial gradient
  final Alignment gradientCenter;
  final bool resizeToAvoidBottomInset;
  final bool isShowAppBar;
  final bool isBgShow;
  final double gradientRadius;
  final List<Color> gradientColors;
  final List<double>? gradientStops;
  const BaseScaffold({
    super.key,
    required this.body,
    this.backgroundColor = Colors.black,
    this.isShowAppBar=true,
    this.gradientCenter = const Alignment(0.0, -0.15),
    this.gradientRadius = 0.6,
    this.gradientColors = const [
      // Color(0xFF9C27B0),
      Color.fromARGB(255, 129, 13, 175),
      Color.fromARGB(255, 14, 13, 13),
    ],
    this.gradientStops = const [/*0.0,*/ 0.5, 1.0],  this.resizeToAvoidBottomInset=false,  this.isBgShow=true,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: _buildDynamicBoxDecoration(),
            child: Column(
              children: [
                if(isShowAppBar)
                // Container(
                //     margin: EdgeInsets.only(
                //         bottom:MediaQuery.of(context).size.height * 0.01),
                //     child: const DynamicHeader()),
                Expanded(child: body),
              ],
            ),
          ),
        ),
      ),
    );  
  }

  Decoration _buildDynamicBoxDecoration() {
    if(isBgShow){
      return BoxDecoration(
        gradient: RadialGradient(
          center: gradientCenter,
          radius: gradientRadius,
          colors: gradientColors,
          stops: gradientStops,
        ),
      );
    }
    return const BoxDecoration(
    );
  }
}

