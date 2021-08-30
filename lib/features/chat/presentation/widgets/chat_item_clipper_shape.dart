import 'package:connectycube_chat/core/src/colors.dart';
import 'package:flutter/material.dart';

class SenderMessageItemCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.cubicTo(
        size.width * 0.1500556,
        size.height * 0.2980800,
        size.width * 0.7170333,
        size.height * 0.1456000,
        size.width,
        size.height * 0.0811600);
    path_0.quadraticBezierTo(
        size.width * 1.0497556, size.height * 0.0310600, size.width, 0);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(0, size.height * 0.2500000, 0, size.height);
    path_0.close();


    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = CustomColors.primaryColor;
    canvas.drawShadow(path_0, Colors.black38, 2, false);
    canvas.drawPath(path_0, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RecieverMessageItemCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.9880000);
    path_0.cubicTo(
        size.width * 0.6222556,
        size.height * 0.2855600,
        size.width * 0.3475889,
        size.height * 0.2268800,
        0,
        size.height * 0.1642600);
    path_0.quadraticBezierTo(
        size.width * -0.1141778, size.height * 0.0748400, 0, 0);
    path_0.lineTo(size.width, 0);
    path_0.quadraticBezierTo(size.width, size.height * 0.2470000, size.width,
        size.height * 0.9880000);
    path_0.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = CustomColors.brownLightColor;
    canvas.drawShadow(path_0, Colors.black38, 2, false);
    canvas.drawPath(path_0, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
