import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SunEffect extends StatefulWidget {
  const SunEffect({super.key});

  @override
  State<SunEffect> createState() => _SunEffectState();
}

class _SunEffectState extends State<SunEffect>
    with SingleTickerProviderStateMixin {
  double sizeSun = 60;

  late Animation<double> rotate;
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 80));
    rotate = Tween<double>(begin: 0, end: 1).animate(animationController);
    //reverse rotate back from 1 to 0 after ends
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      //color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
              top: 40,
              left: 40,
              child: RotationTransition(
                turns: rotate,
                child: CustomPaint(
                    painter: SunEffectPainter(
                        screenWidth: MediaQuery.of(context).size.width),
                    child: Container(
                      width: sizeSun,
                      height: sizeSun,
                      decoration: const BoxDecoration(
                          color: Colors.yellow, shape: BoxShape.circle),
                    )),
              ))
        ],
      ),
    );
  }
}

class SunEffectPainter extends CustomPainter {
  double? screenWidth;
  SunEffectPainter({this.screenWidth});

  @override
  void paint(Canvas canvas, Size size) {
    //offset for effect on center
    Offset offset = Offset(size.width / 2, size.height / 2);
    //radius for effect cover
    double radiusArchShape = screenWidth!;
    double totalEffectShine = 20;

    List<Color> colors = [
      Colors.white.withOpacity(0.2),
      Colors.white.withOpacity(0),
    ];

    Paint paint = Paint()
      ..shader = ui.Gradient.radial(offset, radiusArchShape, colors);

    //Generate arc for effect
    double radius = (1 * pi) / totalEffectShine;
    for (var i = 0; i < totalEffectShine; i++) {
      canvas.drawPath(
          drapPieShape(radiusArchShape, radius * (i * 2), radius, size, offset),
          paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  //This method generate pie shape for each shine effect
  Path drapPieShape(double radiusArchShape, double d, double radius, Size size,
      Offset offset) {
    return Path()
      ..moveTo(offset.dx, offset.dy)
      ..arcTo(
          Rect.fromCenter(
              center: offset, width: radiusArchShape, height: radiusArchShape),
          d,
          radius,
          false)
      ..close();
  }
}
