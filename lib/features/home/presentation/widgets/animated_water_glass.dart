import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedWaterGlass extends StatefulWidget {
  final double fillPercentage; // 0.0 to 1.0
  final double width;
  final double height;
  final Color waterColor;
  final Color glassColor;

  const AnimatedWaterGlass({
    super.key,
    required this.fillPercentage,
    this.width = 120,
    this.height = 180,
    this.waterColor = const Color(0xFF00BCD4),
    this.glassColor = const Color(0xFFE0F7FA),
  });

  @override
  State<AnimatedWaterGlass> createState() => _AnimatedWaterGlassState();
}

class _AnimatedWaterGlassState extends State<AnimatedWaterGlass>
    with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _waveController,
        builder: (context, child) {
          return CustomPaint(
            painter: _WaterGlassPainter(
              fillPercentage: widget.fillPercentage.clamp(0.0, 1.0),
              waterColor: widget.waterColor,
              glassColor: widget.glassColor,
              wavePhase: _waveController.value,
            ),
          );
        },
      ),
    );
  }
}

class _WaterGlassPainter extends CustomPainter {
  final double fillPercentage;
  final Color waterColor;
  final Color glassColor;
  final double wavePhase;

  _WaterGlassPainter({
    required this.fillPercentage,
    required this.waterColor,
    required this.glassColor,
    required this.wavePhase,
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
    final glassPaint = Paint()
      ..color = glassColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawPath(glassPath, glassPaint);

    // Draw water
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

      // Draw wave on top of water
      final wavePoints = 50;
      final waveWidth = size.width * 0.6;
      final waveAmplitude = 4.0;

      for (int i = 0; i <= wavePoints; i++) {
        final x = topLeftX + (waveWidth * i / wavePoints);
        final phase = wavePhase * 2 * math.pi;
        final waveY = waterY +
            math.sin((i / wavePoints) * 4 * math.pi + phase) * waveAmplitude;

        if (i == 0) {
          waterPath.lineTo(x, waveY);
        } else {
          waterPath.lineTo(x, waveY);
        }
      }

      // Draw right side down to bottom
      final bottomRightX = size.width * 0.9 - (size.height - waterY) * 0.07;
      final topRightX = topLeftX + waveWidth;
      waterPath.lineTo(topRightX, waterY);
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
    return oldDelegate.fillPercentage != fillPercentage ||
        oldDelegate.wavePhase != wavePhase;
  }
}