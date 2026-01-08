import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedWaterGlass extends StatelessWidget {
  final double fillPercentage; // 0.0 to 1.0
  final double width;
  final double height;
  final Color? waterColor;
  final Color glassColor;
  final Duration duration;

  const AnimatedWaterGlass({
    super.key,
    required this.fillPercentage,
    this.width = 120,
    this.height = 180,
    this.waterColor,
    this.glassColor = const Color(0xFFE0F7FA),
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  Widget build(BuildContext context) {
    final effectiveWaterColor = waterColor ?? Theme.of(context).colorScheme.primary;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: fillPercentage.clamp(0.0, 1.0)),
      duration: duration,
      curve: Curves.easeInOutCubic,
      builder: (context, animatedFill, child) {
        return SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              CustomPaint(
                painter: _WaterGlassPainter(
                  fillPercentage: animatedFill,
                  waterColor: effectiveWaterColor,
                  glassColor: glassColor,
                ),
              ),
              // Add wave animation on top
              if (animatedFill > 0)
                Positioned.fill(
                  child: _WaveAnimation(
                    fillPercentage: animatedFill,
                    waterColor: effectiveWaterColor,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _WaterGlassPainter extends CustomPainter {
  final double fillPercentage;
  final Color waterColor;
  final Color glassColor;

  _WaterGlassPainter({
    required this.fillPercentage,
    required this.waterColor,
    required this.glassColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final glassPath = Path()
      ..moveTo(size.width * 0.2, 0)
      ..lineTo(size.width * 0.1, size.height)
      ..lineTo(size.width * 0.9, size.height)
      ..lineTo(size.width * 0.8, 0)
      ..close();

    // Draw glass outline
    final Paint glassPaint = Paint()
      ..color = glassColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawPath(glassPath, glassPaint);

    // Draw water as simple filled area
    if (fillPercentage > 0) {
      final waterHeight = size.height * fillPercentage;
      final waterY = size.height - waterHeight;

      final waterPath = Path();

      // Start from bottom left
      final bottomLeftX = size.width * 0.1 + (size.height - waterY) * 0.07;
      waterPath.moveTo(bottomLeftX, size.height);

      // Draw left side up to water level
      final topLeftX = size.width * 0.2 + (size.height - waterY) * 0.07;
      waterPath.lineTo(topLeftX, waterY);

      // Draw straight line across the top (water surface)
      final topRightX = size.width * 0.8 - (size.height - waterY) * 0.07;
      waterPath.lineTo(topRightX, waterY);

      // Draw right side down to bottom
      final bottomRightX = size.width * 0.9 - (size.height - waterY) * 0.07;
      waterPath.lineTo(bottomRightX, size.height);
      waterPath.close();

      final waterPaint = Paint()
        ..color = waterColor.withAlpha(179) // 0.7 * 255
        ..style = PaintingStyle.fill;

      canvas.drawPath(waterPath, waterPaint);

      // Add shimmer effect
      final shimmerPaint = Paint()
        ..color = Colors.white.withAlpha(64) // 0.25 * 255
        ..style = PaintingStyle.fill;

      final shimmerPath = Path()
        ..moveTo(size.width * 0.25, waterY + 10)
        ..lineTo(size.width * 0.35, waterY + 10)
        ..lineTo(size.width * 0.32, waterY + 40)
        ..lineTo(size.width * 0.22, waterY + 40)
        ..close();

      canvas.drawPath(shimmerPath, shimmerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _WaterGlassPainter oldDelegate) {
    return oldDelegate.fillPercentage != fillPercentage;
  }
}

/// Wave animation for water surface
class _WaveAnimation extends StatefulWidget {
  final double fillPercentage;
  final Color waterColor;

  const _WaveAnimation({
    required this.fillPercentage,
    required this.waterColor,
  });

  @override
  State<_WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<_WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _WavePainter(
            fillPercentage: widget.fillPercentage,
            wavePhase: _controller.value,
            waterColor: widget.waterColor,
          ),
        );
      },
    );
  }
}

/// Painter for water wave effect
class _WavePainter extends CustomPainter {
  final double fillPercentage;
  final double wavePhase;
  final Color waterColor;

  _WavePainter({
    required this.fillPercentage,
    required this.wavePhase,
    required this.waterColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (fillPercentage <= 0) return;

    final waterHeight = size.height * fillPercentage;
    final waterY = size.height - waterHeight;

    // Calculate glass width at water level
    final topLeftX = size.width * 0.2 + (size.height - waterY) * 0.07;
    final topRightX = size.width * 0.8 - (size.height - waterY) * 0.07;
    final waveWidth = topRightX - topLeftX;

    final path = Path();
    path.moveTo(topLeftX, waterY);

    // Draw sine wave
    const waveCount = 2;
    const amplitude = 3.0;
    final step = waveWidth / 50;

    for (double x = 0; x <= waveWidth; x += step) {
      final xPos = topLeftX + x;
      final normalizedX = x / waveWidth;
      final angle = (normalizedX * waveCount + wavePhase) * 2 * math.pi;
      final yOffset = math.sin(angle) * amplitude;
      path.lineTo(xPos, waterY + yOffset);
    }

    // Complete the path
    path.lineTo(topRightX, waterY);
    path.lineTo(topRightX, waterY - 10);
    path.lineTo(topLeftX, waterY - 10);
    path.close();

    final wavePaint = Paint()
      ..color = waterColor.withAlpha(102) // 0.4 * 255
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) {
    return oldDelegate.wavePhase != wavePhase ||
        oldDelegate.fillPercentage != fillPercentage;
  }
}