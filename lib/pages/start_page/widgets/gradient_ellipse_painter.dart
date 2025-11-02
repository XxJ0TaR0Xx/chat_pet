import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:chat_pet/ui_kit/ui_kit.dart';

class GradientEllipsePainter extends CustomPainter {
  GradientEllipsePainter({required this.animationValue});

  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    // Основные параметры из SVG
    const center = Offset(320.953, 143.115);
    const radiusX = 350.654;
    const radiusY = 122.26;
    const rotation = 134.23 * pi / 180; // Используем константу pi
    const opacity = 0.63;
    const blurSigma = 74.0;

    // Рассчитываем промежуточные цвета
    final color1 = _interpolateColor(
      ColorsFoundation.purpleLinearColor1,
      ColorsFoundation.purpleLinearColor2,
      animationValue,
    );

    final color2 = _interpolateColor(
      ColorsFoundation.purpleLinearColor2,
      ColorsFoundation.purpleLinearColor1,
      animationValue,
    );

    // Создаем градиент
    final gradient = ui.Gradient.linear(
      const Offset(308.715, 127.731),
      const Offset(-100.812, 107.022),
      [
        color1.withValues(alpha: opacity),
        color2.withValues(alpha: opacity),
      ],
    );

    // Сохраняем состояние холста
    canvas.save();

    // Применяем размытие
    final filter = ui.ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma);
    canvas.saveLayer(
      Rect.largest,
      Paint()..imageFilter = filter,
    );

    // Поворачиваем холст
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);

    // Рисуем эллипс с градиентом
    final paint = Paint()..shader = gradient;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: radiusX * 2,
        height: radiusY * 2,
      ),
      paint,
    );

    // Восстанавливаем холст
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant GradientEllipsePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }

  Color _interpolateColor(Color a, Color b, double t) {
    return Color.lerp(a, b, t)!;
  }
}
