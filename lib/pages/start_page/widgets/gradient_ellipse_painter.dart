import 'dart:ui' as ui;

import 'package:chat_pet/ui_kit/foundation/colors_foundation.dart';
import 'package:flutter/material.dart';

class GradientEllipsePainter extends CustomPainter {
  GradientEllipsePainter({required this.animationValue});

  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    const center = Offset(320.953, 143.115);
    const radiusX = 400.654;
    const radiusY = 122.26;
    const rotation = 134.23 * 3.1415926535 / 180;
    const opacity = 0.55;
    const blurSigma = 74.0;

    final color1 = _interpolateColor(
      ColorsFoundation.purpleLinearColor1,
      Colors.indigo,
      animationValue,
    );

    final color2 = _interpolateColor(
      Colors.deepPurple,
      ColorsFoundation.purpleLinearColor2,
      animationValue,
    );

    final gradient = ui.Gradient.linear(
      center,
      const Offset(-100.812, 107.022),
      [
        color1.withValues(alpha: opacity),
        color2.withValues(alpha: opacity),
      ],
    );

    canvas.save();

    final filter = ui.ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma);
    canvas.saveLayer(
      Rect.largest,
      Paint()..imageFilter = filter,
    );

    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);

    final paint = Paint()..shader = gradient;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: radiusX * 2,
        height: radiusY * 2,
      ),
      paint,
    );

    canvas.restore();
    canvas.restore();
  }

  Color _interpolateColor(Color a, Color b, double t) {
    return Color.lerp(a, b, t) ?? Colors.transparent;
  }

  @override
  bool shouldRepaint(covariant GradientEllipsePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
