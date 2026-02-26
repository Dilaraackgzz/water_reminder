import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../core/constants/ui_constants.dart';

class WaterProgressRing extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double size;
  final double strokeWidth;
  final Color? progressColor;
  final Color backgroundColor;
  final Widget? child;
  final Duration duration;

  const WaterProgressRing({
    super.key,
    required this.progress,
    this.size = 200,
    this.strokeWidth = 16,
    this.progressColor,
    this.backgroundColor = const Color(0xFFE0F7FA),
    this.child,
    this.duration = UIConstants.progressAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveProgressColor = progressColor ?? Theme.of(context).colorScheme.primary;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: progress.clamp(0.0, 1.0)),
      duration: duration,
      curve: Curves.easeInOutCubic,
      builder: (context, animatedProgress, _) {
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
              // Animated progress circle with glow effect
              if (animatedProgress > 0) ...[
                // Glow effect
                CustomPaint(
                  size: Size(size, size),
                  painter: _CirclePainter(
                    progress: animatedProgress,
                    color: effectiveProgressColor.withAlpha(77), // 0.3 * 255
                    strokeWidth: strokeWidth + 4,
                  ),
                ),
                // Main progress
                CustomPaint(
                  size: Size(size, size),
                  painter: _CirclePainter(
                    progress: animatedProgress,
                    color: effectiveProgressColor,
                    strokeWidth: strokeWidth,
                  ),
                ),
              ],
              // Child content
              if (child != null) child!,
            ],
          ),
        );
      },
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