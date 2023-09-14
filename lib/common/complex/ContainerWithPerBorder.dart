import 'package:flutter/material.dart';
import 'dart:math';

import '../constants.dart';

double deg2rad(double deg) => deg * pi / 180;

class PieChart extends CustomPainter {
  final double progressValue;
  Color emptyProgressColor, progressColor;

  PieChart(
      {required this.progressValue,
        required this.emptyProgressColor,
        required this.progressColor});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    final rect =
    Rect.fromCenter(center: center, width: size.width, height: size.height);

    Paint paint = Paint()
      ..color = emptyProgressColor
      ..style = PaintingStyle.fill;

    Paint paint2 = Paint()
      ..color = progressColor
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      rect,
      deg2rad(-90),
      deg2rad(360),
      false,
      paint,
    );

    //bg
    final _path = Path();
    _path.moveTo(center.dx, center.dy);
    _path.arcTo(rect, deg2rad(-45),
        deg2rad(progressValue >= 0.5 ? 180 : 360 * progressValue), false);
    _path.moveTo(center.dx, center.dy);
    _path.arcTo(rect, deg2rad(135),
        deg2rad(progressValue >= 0.5 ? 360 * (progressValue - 0.5) : 0), false);

    canvas.drawPath(_path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

Widget ContainerWithPerBorder({
  required double height,
  required double width,
  required double progressValue,
  required double radius,
  required Color emptyProgressColor,
  required Color progressColor,
  required Widget child,
  double progressWidth = 5,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                Positioned(
                  top: -height / 2,
                  // bottom: -50,
                  left: -width / 2,
                  // right: -50,
                  child: SizedBox(
                    height: height * 2,
                    width: width * 2,
                    child: CustomPaint(
                      painter: PieChart(
                          progressValue: progressValue,
                          emptyProgressColor: emptyProgressColor,
                          progressColor: progressColor),
                      child: SizedBox(
                        height: screenHeight / 2,
                        width: screenWidth / 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(progressWidth),
          child: child,
        )
      ],
    ),
  );
}