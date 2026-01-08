import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Beautiful circular wave progress animation
class CircularWaveProgress extends StatefulWidget {
  final double progress; // 0.0 to 1.0
  final double size;
  final Color? waveColor;
  final Color backgroundColor;

  const CircularWaveProgress({
    super.key,
    required this.progress,
    this.size = 140,
    this.waveColor,
    this.backgroundColor = Colors.white,
  });

  @override
  State<CircularWaveProgress> createState() => _CircularWaveProgressState();
}

class _CircularWaveProgressState extends State<CircularWaveProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveWaveColor = widget.waveColor ?? Theme.of(context).colorScheme.primary;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: widget.progress.clamp(0.0, 1.0)),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOutCubic,
      builder: (context, animatedProgress, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background circle
              Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.backgroundColor,
                ),
              ),
              // Animated wave fill
              AnimatedBuilder(
                animation: _waveController,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(widget.size, widget.size),
                    painter: _CircularWavePainter(
                      progress: animatedProgress,
                      wavePhase: _waveController.value,
                      waveColor: effectiveWaveColor,
                    ),
                  );
                },
              ),
              // Progress percentage text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(animatedProgress * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: widget.size * 0.20,
                      fontWeight: FontWeight.bold,
                      color: animatedProgress > 0.5
                          ? Colors.white
                          : effectiveWaveColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Icon(
                    Icons.water_drop,
                    size: widget.size * 0.15,
                    color: animatedProgress > 0.5
                        ? Colors.white.withAlpha(204) // 0.8 * 255
                        : effectiveWaveColor.withAlpha(153), // 0.6 * 255
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Custom painter for circular wave effect
class _CircularWavePainter extends CustomPainter {
  final double progress;
  final double wavePhase;
  final Color waveColor;

  _CircularWavePainter({
    required this.progress,
    required this.wavePhase,
    required this.waveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Create circular clip path
    final clipPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
    canvas.clipPath(clipPath);

    // Calculate water level
    final waterLevel = size.height * (1 - progress);

    // Draw primary wave
    _drawWave(
      canvas,
      size,
      waterLevel,
      wavePhase,
      waveColor.withAlpha(204), // 0.8 * 255
      8.0, // amplitude
      2.0, // frequency
    );

    // Draw secondary wave (offset for layered effect)
    _drawWave(
      canvas,
      size,
      waterLevel + 4,
      wavePhase + 0.5,
      waveColor.withAlpha(128), // 0.5 * 255
      6.0, // amplitude
      1.5, // frequency
    );

    // Draw base fill (solid color below waves)
    final fillPaint = Paint()
      ..color = waveColor.withAlpha(230) // 0.9 * 255
      ..style = PaintingStyle.fill;

    final fillRect = Rect.fromLTWH(
      0,
      waterLevel + 10,
      size.width,
      size.height,
    );
    canvas.drawRect(fillRect, fillPaint);

    // Add shimmer effect on top
    if (progress > 0.1) {
      _drawShimmer(canvas, size, waterLevel);
    }
  }

  void _drawWave(
    Canvas canvas,
    Size size,
    double baseLevel,
    double phase,
    Color color,
    double amplitude,
    double frequency,
  ) {
    final wavePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);

    // Draw wave using sine function
    for (double x = 0; x <= size.width; x += 2) {
      final normalizedX = x / size.width;
      final angle = (normalizedX * frequency + phase) * 2 * math.pi;
      final y = baseLevel + math.sin(angle) * amplitude;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, wavePaint);
  }

  void _drawShimmer(Canvas canvas, Size size, double waterLevel) {
    final shimmerPaint = Paint()
      ..color = Colors.white.withAlpha(77) // 0.3 * 255
      ..style = PaintingStyle.fill;

    // Create curved shimmer shape
    final shimmerPath = Path();
    final shimmerY = waterLevel + 20;
    final shimmerWidth = size.width * 0.4;
    final shimmerX = size.width * 0.3;

    shimmerPath.moveTo(shimmerX, shimmerY);
    shimmerPath.quadraticBezierTo(
      shimmerX + shimmerWidth / 2,
      shimmerY - 10,
      shimmerX + shimmerWidth,
      shimmerY,
    );
    shimmerPath.quadraticBezierTo(
      shimmerX + shimmerWidth / 2,
      shimmerY + 30,
      shimmerX,
      shimmerY + 20,
    );
    shimmerPath.close();

    canvas.drawPath(shimmerPath, shimmerPaint);
  }

  @override
  bool shouldRepaint(covariant _CircularWavePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.wavePhase != wavePhase;
  }
}
