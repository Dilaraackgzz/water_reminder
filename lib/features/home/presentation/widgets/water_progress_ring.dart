import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaterProgressRing extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double size;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;
  final Widget? child;

  const WaterProgressRing({
    super.key,
    required this.progress,
    this.size = 200,
    this.strokeWidth = 16,
    this.progressColor = const Color(0xFF00BCD4),
    this.backgroundColor = const Color(0xFFE0F7FA),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          CustomPaint(
            size: Size(size, size),
            painter: _CirclePainter(
              progress: 1.0,
              color: backgroundColor,
              strokeWidth: strokeWidth,
            ),
          ),
          // Progress circle
          CustomPaint(
            size: Size(size, size),
            painter: _CirclePainter(
              progress: progress.clamp(0.0, 1.0),
              color: progressColor,
              strokeWidth: strokeWidth,
            ),
          ),
          // Child content
          if (child != null) child!,
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _CirclePainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}