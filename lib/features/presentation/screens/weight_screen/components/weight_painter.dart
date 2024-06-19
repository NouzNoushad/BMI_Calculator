import 'package:bmi_design/core/utils/colors.dart';
import 'package:flutter/material.dart';

class WeightPainter extends CustomPainter {
  WeightPainter({
    required this.value,
  });

  final int value;
  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    Offset offset = Offset(w * 0.5, h * 0.5);
    // Paint paint = Paint()
    //   ..color = Colors.black
    //   ..strokeWidth = 2
    //   ..style = PaintingStyle.stroke;

    Paint backgroundBorderPaint = Paint()
      ..color = Colors.black38
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    Paint backgroundPaint = Paint()
      ..shader = const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.blueColor,
            AppColors.lightBlueColor,
          ]).createShader(Rect.fromCenter(center: offset, width: w, height: h));

    Paint needlePaint = Paint()..color = Colors.white;

    drawText(String text, Offset offset, Color color, double size) {
      TextPainter textPainter = TextPainter(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: size, color: color, fontWeight: FontWeight.w600),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, offset);
    }

    ///-> background
    Path backgroundPath = Path()
      ..moveTo(0, h * 0.3)
      ..lineTo(w * 0.1, h)
      ..lineTo(w * 0.9, h)
      ..lineTo(w, h * 0.3)
      ..quadraticBezierTo(w * 1, h * 0.08, w * 0.8, 0)
      ..lineTo(w * 0.2, 0)
      ..quadraticBezierTo(w * 0, h * 0.08, 0, h * 0.3);
    canvas.drawShadow(backgroundPath, Colors.black, 10, false);
    canvas.drawPath(backgroundPath, backgroundPaint);
    canvas.drawPath(backgroundPath, backgroundBorderPaint);

    ///-> needle indicator
    Offset needleOffset = Offset(offset.dx, offset.dy + h * 0.25);
    Path needlePath = Path()
      ..moveTo(needleOffset.dx, needleOffset.dy)
      ..lineTo(needleOffset.dx + w * 0.06, needleOffset.dy)
      ..lineTo(needleOffset.dx, needleOffset.dy - h * 0.45)
      ..lineTo(needleOffset.dx - w * 0.06, needleOffset.dy)
      ..close();

    canvas.drawPath(
        Path()
          ..moveTo(w * 0.49, 0)
          ..lineTo(w * 0.51, 0)
          ..lineTo(w * 0.5, h * 0.05)
          ..close(),
        needlePaint);

    // triangle
    canvas.drawShadow(needlePath, Colors.black, 10, false);
    canvas.drawPath(needlePath, needlePaint);
    // circle
    canvas.drawShadow(
        Path()
          ..addOval(Rect.fromCircle(center: needleOffset, radius: w * 0.14)),
        Colors.black,
        10,
        false);
    canvas.drawCircle(needleOffset, w * 0.14, needlePaint);
    drawText(
        value.toString(),
        Offset(
            needleOffset.dx -
                (value.toString().length > 2 ? w * 0.1 : w * 0.06),
            needleOffset.dy - h * 0.09),
        AppColors.blueColor,
        35);
    drawText(
        'kg',
        Offset(needleOffset.dx - w * 0.03, needleOffset.dy + h * 0.04),
        Colors.grey.shade800,
        22);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
