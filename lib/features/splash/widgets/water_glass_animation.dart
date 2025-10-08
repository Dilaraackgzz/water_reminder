import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../core/themes/app_theme.dart';

class WaterGlassAnimation extends StatelessWidget {
  final AnimationController animationController;

  const WaterGlassAnimation({
    super.key,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Made bigger
      height: 380, // Made bigger
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Water droplet falling from top
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              // Droplet falls in first 40% of animation
              final dropProgress = (animationController.value / 0.4).clamp(0.0, 1.0);

              if (dropProgress >= 1.0) return const SizedBox.shrink();

              // Calculate droplet position (falling down) - adjusted for bigger size
              final topPosition = 30.0 + (180 * dropProgress);

              // Add slight bounce at the end
              final bounceOffset = dropProgress > 0.8
                  ? math.sin((dropProgress - 0.8) * math.pi * 5) * 4
                  : 0.0;

              return Positioned(
                top: topPosition + bounceOffset,
                child: Opacity(
                  opacity: 1.0 - (dropProgress * 0.3),
                  child: CustomPaint(
                    size: const Size(40, 55), // Bigger droplet
                    painter: WaterDropletPainter(),
                  ),
                ),
              );
            },
          ),

          // Glass container - rounded bottom like in the image (bigger)
          Positioned(
            bottom: 60,
            child: CustomPaint(
              size: const Size(240, 200), // Bigger glass
              painter: RoundedGlassPainter(),
            ),
          ),

          // Water filling the glass with ripple effect - starts half full
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              // Water starts at 50% (half full) and slightly increases after droplet hits
              final baseLevel = 0.5; // Start at 50%
              final rippleStart = 0.38;

              // Very subtle increase in water level (just 5% increase)
              final fillIncrease = animationController.value > rippleStart
                  ? ((animationController.value - rippleStart) / (1.0 - rippleStart)).clamp(0.0, 1.0) * 0.05
                  : 0.0;

              final fillValue = baseLevel + fillIncrease;

              // Ripple effect when droplet hits
              final rippleProgress = animationController.value > rippleStart && animationController.value < rippleStart + 0.25
                  ? (animationController.value - rippleStart) / 0.25
                  : 0.0;

              return Positioned(
                bottom: 60,
                child: ClipPath(
                  clipper: RoundedGlassClipper(),
                  child: CustomPaint(
                    size: const Size(240, 200), // Bigger glass
                    painter: RippleWaterFillPainter(
                      fillLevel: fillValue,
                      time: animationController.value * 3 * math.pi,
                      rippleIntensity: rippleProgress,
                      isInitiallyHalfFull: true,
                    ),
                  ),
                ),
              );
            },
          ),

          // Splash effect when droplet hits water
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              final splashStart = 0.38;
              final splashEnd = 0.55;

              if (animationController.value < splashStart ||
                  animationController.value > splashEnd) {
                return const SizedBox.shrink();
              }

              final splashProgress = ((animationController.value - splashStart) / (splashEnd - splashStart))
                  .clamp(0.0, 1.0);

              return Positioned(
                bottom: 165, // Adjusted for half-full water level and bigger size
                child: Opacity(
                  opacity: 1.0 - splashProgress,
                  child: CustomPaint(
                    size: const Size(100, 40), // Bigger splash
                    painter: SplashEffectPainter(progress: splashProgress),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Cute cloud/faucet
class CuteTapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.lightBlue
      ..style = PaintingStyle.fill;

    // Draw cute cloud shape
    final cloudPath = Path();
    cloudPath.addOval(Rect.fromLTWH(10, 15, 25, 25));
    cloudPath.addOval(Rect.fromLTWH(25, 10, 30, 30));
    cloudPath.addOval(Rect.fromLTWH(45, 15, 25, 25));

    canvas.drawPath(cloudPath, paint);

    // Draw faucet opening with outline
    final outlinePaint = Paint()
      ..color = AppTheme.darkBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final innerPaint = Paint()
      ..color = AppTheme.primaryBlue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final faucetPath = Path();
    faucetPath.moveTo(size.width * 0.4, size.height * 0.7);
    faucetPath.quadraticBezierTo(
      size.width * 0.5, size.height * 0.85,
      size.width * 0.6, size.height * 0.7,
    );

    canvas.drawPath(faucetPath, innerPaint);
    canvas.drawPath(faucetPath, outlinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Cute water stream
class CuteWaterPouringPainter extends CustomPainter {
  final double progress;
  final double time;

  CuteWaterPouringPainter({required this.progress, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppTheme.lightBlue.withOpacity(0.8),
          AppTheme.primaryBlue.withOpacity(0.9),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final outlinePaint = Paint()
      ..color = AppTheme.darkBlue.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final width = size.width;
    final height = size.height * progress;

    if (height > 0) {
      // Create cartoon-style water stream
      final path = Path();

      // Left side with subtle wave
      path.moveTo(width * 0.35, 0);
      for (var i = 0; i <= 10; i++) {
        final y = (height / 10) * i;
        final x = width * 0.35 + math.sin(time + i * 0.3) * 2;
        path.lineTo(x, y);
      }

      // Bottom curve
      path.quadraticBezierTo(
        width * 0.5, height + 3,
        width * 0.65, height,
      );

      // Right side with subtle wave
      for (var i = 10; i >= 0; i--) {
        final y = (height / 10) * i;
        final x = width * 0.65 + math.sin(time + i * 0.3) * 2;
        path.lineTo(x, y);
      }

      path.close();

      canvas.drawPath(path, paint);
      canvas.drawPath(path, outlinePaint);
    }
  }

  @override
  bool shouldRepaint(CuteWaterPouringPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.time != time;
  }
}

class GlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primaryBlue.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final path = Path();
    final width = size.width;
    final height = size.height;

    // Draw glass outline
    path.moveTo(width * 0.25, 0);
    path.lineTo(width * 0.15, height);
    path.lineTo(width * 0.85, height);
    path.lineTo(width * 0.75, 0);
    path.close();

    canvas.drawPath(path, paint);

    // Add glass shine effect
    final shinePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.6),
          Colors.white.withOpacity(0.1),
          Colors.white.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, width * 0.3, height))
      ..style = PaintingStyle.fill;

    final shinePath = Path();
    shinePath.moveTo(width * 0.25, 0);
    shinePath.lineTo(width * 0.2, height * 0.5);
    shinePath.lineTo(width * 0.3, height * 0.5);
    shinePath.lineTo(width * 0.35, 0);
    shinePath.close();

    canvas.drawPath(shinePath, shinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WaterFillPainter extends CustomPainter {
  final double fillLevel;
  final double time;

  WaterFillPainter({
    required this.fillLevel,
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppTheme.lightBlue.withOpacity(0.7),
          AppTheme.primaryBlue.withOpacity(0.8),
          AppTheme.darkBlue.withOpacity(0.9),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    final width = size.width;
    final height = size.height;
    final waterHeight = height * fillLevel;

    // Create wave effect at the top of water
    path.moveTo(0, height - waterHeight);

    // Draw wave
    final waveCount = 3;
    final waveHeight = 8.0;
    final waveLength = width / waveCount;

    for (var i = 0; i <= waveCount; i++) {
      final x = i * waveLength;
      final y = height - waterHeight +
          math.sin((i / waveCount) * 2 * math.pi + time) * waveHeight;

      if (i == 0) {
        path.lineTo(x, y);
      } else {
        final prevX = (i - 1) * waveLength;
        final prevY = height - waterHeight +
            math.sin(((i - 1) / waveCount) * 2 * math.pi + time) * waveHeight;

        final cpX1 = prevX + waveLength / 3;
        final cpY1 = prevY;
        final cpX2 = x - waveLength / 3;
        final cpY2 = y;

        path.cubicTo(cpX1, cpY1, cpX2, cpY2, x, y);
      }
    }

    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, paint);

    // Add bubble effect
    if (fillLevel > 0.1 && fillLevel < 0.95) {
      _drawBubbles(canvas, size, waterHeight);
    }
  }

  void _drawBubbles(Canvas canvas, Size size, double waterHeight) {
    final bubblePaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    final bubbles = [
      Offset(size.width * 0.3, size.height - waterHeight * 0.3),
      Offset(size.width * 0.7, size.height - waterHeight * 0.5),
      Offset(size.width * 0.5, size.height - waterHeight * 0.7),
    ];

    for (final bubble in bubbles) {
      canvas.drawCircle(bubble, 4, bubblePaint);
    }
  }

  @override
  bool shouldRepaint(WaterFillPainter oldDelegate) {
    return oldDelegate.fillLevel != fillLevel || oldDelegate.time != time;
  }
}

// Cute glass with rounded edges
class CuteGlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final outlinePaint = Paint()
      ..color = AppTheme.darkBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final shinePaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    // Draw glass outline with rounded corners
    final glassPath = Path();
    glassPath.moveTo(width * 0.3, 0);
    glassPath.quadraticBezierTo(width * 0.2, height * 0.1, width * 0.15, height * 0.95);
    glassPath.quadraticBezierTo(width * 0.15, height, width * 0.2, height);
    glassPath.lineTo(width * 0.8, height);
    glassPath.quadraticBezierTo(width * 0.85, height, width * 0.85, height * 0.95);
    glassPath.quadraticBezierTo(width * 0.8, height * 0.1, width * 0.7, 0);
    glassPath.close();

    canvas.drawPath(glassPath, outlinePaint);

    // Add cute shine effect
    final shinePath = Path();
    shinePath.moveTo(width * 0.28, height * 0.1);
    shinePath.quadraticBezierTo(width * 0.25, height * 0.3, width * 0.24, height * 0.5);
    shinePath.lineTo(width * 0.3, height * 0.5);
    shinePath.quadraticBezierTo(width * 0.32, height * 0.3, width * 0.35, height * 0.1);
    shinePath.close();

    canvas.drawPath(shinePath, shinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Cute water fill with bubbles
class CuteWaterFillPainter extends CustomPainter {
  final double fillLevel;
  final double time;

  CuteWaterFillPainter({required this.fillLevel, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    if (fillLevel <= 0) return;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppTheme.lightBlue.withOpacity(0.8),
          AppTheme.primaryBlue.withOpacity(0.9),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;
    final waterHeight = height * fillLevel;

    final path = Path();

    // Start from bottom left
    path.moveTo(width * 0.15, height);
    path.lineTo(width * 0.85, height);
    path.quadraticBezierTo(width * 0.85, height * 0.95, width * 0.84, height * 0.9);

    // Draw wavy water surface
    final waveStart = height - waterHeight;
    final points = 20;

    for (var i = points; i >= 0; i--) {
      final t = i / points;
      final x = width * 0.15 + (width * 0.7) * (1 - t);
      final waveOffset = math.sin(t * math.pi * 3 + time) * 5;
      final y = waveStart + waveOffset;

      if (i == points) {
        path.lineTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.quadraticBezierTo(width * 0.15, height * 0.95, width * 0.15, height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw cute bubbles
    if (fillLevel > 0.2) {
      _drawCuteBubbles(canvas, size, waterHeight, time);
    }
  }

  void _drawCuteBubbles(Canvas canvas, Size size, double waterHeight, double time) {
    final bubblePaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    final bubbleOutline = Paint()
      ..color = AppTheme.lightBlue.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final bubbles = [
      (Offset(size.width * 0.3, size.height - waterHeight * 0.4), 8.0),
      (Offset(size.width * 0.6, size.height - waterHeight * 0.6), 6.0),
      (Offset(size.width * 0.45, size.height - waterHeight * 0.3), 5.0),
      (Offset(size.width * 0.7, size.height - waterHeight * 0.5), 7.0),
    ];

    for (var i = 0; i < bubbles.length; i++) {
      final (pos, radius) = bubbles[i];
      final float = math.sin(time * 2 + i) * 3;
      final adjustedPos = Offset(pos.dx, pos.dy + float);

      canvas.drawCircle(adjustedPos, radius, bubblePaint);
      canvas.drawCircle(adjustedPos, radius, bubbleOutline);

      // Add highlight
      canvas.drawCircle(
        Offset(adjustedPos.dx - radius * 0.3, adjustedPos.dy - radius * 0.3),
        radius * 0.3,
        Paint()..color = Colors.white.withOpacity(0.8),
      );
    }
  }

  @override
  bool shouldRepaint(CuteWaterFillPainter oldDelegate) {
    return oldDelegate.fillLevel != fillLevel || oldDelegate.time != time;
  }
}

// Cute glass clipper
class CuteGlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(width * 0.3, 0);
    path.quadraticBezierTo(width * 0.2, height * 0.1, width * 0.15, height * 0.95);
    path.quadraticBezierTo(width * 0.15, height, width * 0.2, height);
    path.lineTo(width * 0.8, height);
    path.quadraticBezierTo(width * 0.85, height, width * 0.85, height * 0.95);
    path.quadraticBezierTo(width * 0.8, height * 0.1, width * 0.7, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Happy face painter
class HappyFacePainter extends CustomPainter {
  final double animationValue;

  HappyFacePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final facePaint = Paint()
      ..color = AppTheme.darkBlue
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Blinking eyes
    final eyeOpen = (math.sin(animationValue * math.pi * 3) > 0.7) ? 1.0 : 0.3;

    // Left eye
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX - 15, centerY - 5),
        width: 8,
        height: 12 * eyeOpen,
      ),
      facePaint,
    );

    // Right eye
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 15, centerY - 5),
        width: 8,
        height: 12 * eyeOpen,
      ),
      facePaint,
    );

    // Happy smile
    final smilePaint = Paint()
      ..color = AppTheme.darkBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final smilePath = Path();
    smilePath.moveTo(centerX - 20, centerY + 10);
    smilePath.quadraticBezierTo(
      centerX, centerY + 25,
      centerX + 20, centerY + 10,
    );

    canvas.drawPath(smilePath, smilePaint);

    // Cute blush
    final blushPaint = Paint()
      ..color = Colors.pink.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX - 30, centerY + 5),
        width: 12,
        height: 8,
      ),
      blushPaint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 30, centerY + 5),
        width: 12,
        height: 8,
      ),
      blushPaint,
    );
  }

  @override
  bool shouldRepaint(HappyFacePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

// Simple water pouring - clean stream
class SimpleWaterPouringPainter extends CustomPainter {
  final double progress;

  SimpleWaterPouringPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppTheme.lightBlue.withOpacity(0.7),
          AppTheme.primaryBlue.withOpacity(0.85),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height * progress;

    final path = Path();
    path.moveTo(width * 0.3, 0);
    path.lineTo(width * 0.3, height);
    path.lineTo(width * 0.7, height);
    path.lineTo(width * 0.7, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SimpleWaterPouringPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

// Simple glass - wider and shorter
class SimpleGlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final outlinePaint = Paint()
      ..color = AppTheme.primaryBlue.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final width = size.width;
    final height = size.height;

    // Draw simple glass shape - wider at top
    final glassPath = Path();
    glassPath.moveTo(width * 0.25, 0);
    glassPath.lineTo(width * 0.15, height);
    glassPath.lineTo(width * 0.85, height);
    glassPath.lineTo(width * 0.75, 0);

    canvas.drawPath(glassPath, outlinePaint);

    // Add subtle shine
    final shinePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final shinePath = Path();
    shinePath.moveTo(width * 0.3, height * 0.1);
    shinePath.lineTo(width * 0.27, height * 0.5);
    shinePath.lineTo(width * 0.33, height * 0.5);
    shinePath.lineTo(width * 0.36, height * 0.1);
    shinePath.close();

    canvas.drawPath(shinePath, shinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Simple water fill with gentle wave
class SimpleWaterFillPainter extends CustomPainter {
  final double fillLevel;
  final double time;

  SimpleWaterFillPainter({required this.fillLevel, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    if (fillLevel <= 0) return;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppTheme.lightBlue.withOpacity(0.75),
          AppTheme.primaryBlue.withOpacity(0.85),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;
    final waterHeight = height * fillLevel;

    final path = Path();

    // Start from bottom
    path.moveTo(width * 0.15, height);
    path.lineTo(width * 0.85, height);
    path.lineTo(width * 0.75, height - waterHeight);

    // Draw gentle wave at water surface
    final wavePoints = 15;
    for (var i = 0; i <= wavePoints; i++) {
      final t = i / wavePoints;
      final x = width * 0.75 - (width * 0.5) * t;
      final waveOffset = math.sin(t * math.pi * 2 + time) * 3;
      final y = (height - waterHeight) + waveOffset;

      path.lineTo(x, y);
    }

    path.lineTo(width * 0.15, height);
    path.close();

    canvas.drawPath(path, paint);

    // Add simple bubbles
    if (fillLevel > 0.3) {
      _drawSimpleBubbles(canvas, size, waterHeight);
    }
  }

  void _drawSimpleBubbles(Canvas canvas, Size size, double waterHeight) {
    final bubblePaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final bubbles = [
      (Offset(size.width * 0.35, size.height - waterHeight * 0.5), 5.0),
      (Offset(size.width * 0.55, size.height - waterHeight * 0.7), 4.0),
      (Offset(size.width * 0.65, size.height - waterHeight * 0.4), 3.5),
    ];

    for (final (pos, radius) in bubbles) {
      canvas.drawCircle(pos, radius, bubblePaint);
    }
  }

  @override
  bool shouldRepaint(SimpleWaterFillPainter oldDelegate) {
    return oldDelegate.fillLevel != fillLevel || oldDelegate.time != time;
  }
}

// Simple glass clipper
class SimpleGlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(width * 0.25, 0);
    path.lineTo(width * 0.15, height);
    path.lineTo(width * 0.85, height);
    path.lineTo(width * 0.75, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Water droplet painter - like in the image
class WaterDropletPainter extends CustomPainter {
  WaterDropletPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF64B5F6), // Light blue/cyan like in image
          const Color(0xFF42A5F5),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final outlinePaint = Paint()
      ..color = Colors.white.withAlpha(100)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final width = size.width;
    final height = size.height;

    // Draw water droplet shape
    final path = Path();

    // Top curve
    path.moveTo(width * 0.5, 0);

    // Right side
    path.quadraticBezierTo(
      width * 0.85, height * 0.3,
      width * 0.7, height * 0.7,
    );

    // Bottom curve
    path.quadraticBezierTo(
      width * 0.5, height,
      width * 0.3, height * 0.7,
    );

    // Left side
    path.quadraticBezierTo(
      width * 0.15, height * 0.3,
      width * 0.5, 0,
    );

    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, outlinePaint);

    // Add shine/highlight
    final shinePaint = Paint()
      ..color = Colors.white.withAlpha(150)
      ..style = PaintingStyle.fill;

    final shinePath = Path();
    shinePath.addOval(
      Rect.fromLTWH(width * 0.55, height * 0.15, width * 0.15, height * 0.1),
    );

    canvas.drawPath(shinePath, shinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Rounded glass painter - like in the image
class RoundedGlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final outlinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final width = size.width;
    final height = size.height;

    // Draw glass outline with rounded bottom
    final glassPath = Path();

    // Top left
    glassPath.moveTo(width * 0.28, 0);

    // Curve to left side
    glassPath.quadraticBezierTo(
      width * 0.18, height * 0.15,
      width * 0.15, height * 0.5,
    );

    // Curve to rounded bottom left
    glassPath.quadraticBezierTo(
      width * 0.13, height * 0.85,
      width * 0.25, height * 0.95,
    );

    // Bottom curve
    glassPath.quadraticBezierTo(
      width * 0.5, height,
      width * 0.75, height * 0.95,
    );

    // Rounded bottom right
    glassPath.quadraticBezierTo(
      width * 0.87, height * 0.85,
      width * 0.85, height * 0.5,
    );

    // Right side
    glassPath.quadraticBezierTo(
      width * 0.82, height * 0.15,
      width * 0.72, 0,
    );

    canvas.drawPath(glassPath, outlinePaint);

    // Add subtle shine
    final shinePaint = Paint()
      ..color = Colors.white.withAlpha(80)
      ..style = PaintingStyle.fill;

    final shinePath = Path();
    shinePath.moveTo(width * 0.32, height * 0.1);
    shinePath.lineTo(width * 0.28, height * 0.4);
    shinePath.lineTo(width * 0.35, height * 0.4);
    shinePath.lineTo(width * 0.39, height * 0.1);
    shinePath.close();

    canvas.drawPath(shinePath, shinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Rounded glass clipper
class RoundedGlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(width * 0.28, 0);
    path.quadraticBezierTo(width * 0.18, height * 0.15, width * 0.15, height * 0.5);
    path.quadraticBezierTo(width * 0.13, height * 0.85, width * 0.25, height * 0.95);
    path.quadraticBezierTo(width * 0.5, height, width * 0.75, height * 0.95);
    path.quadraticBezierTo(width * 0.87, height * 0.85, width * 0.85, height * 0.5);
    path.quadraticBezierTo(width * 0.82, height * 0.15, width * 0.72, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Ripple water fill painter - with wave effect
class RippleWaterFillPainter extends CustomPainter {
  final double fillLevel;
  final double time;
  final double rippleIntensity;
  final bool isInitiallyHalfFull;

  RippleWaterFillPainter({
    required this.fillLevel,
    required this.time,
    required this.rippleIntensity,
    this.isInitiallyHalfFull = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (fillLevel <= 0) return;

    final paint = Paint()
      ..color = const Color(0xFF5DCCDB) // Cyan/turquoise like in image
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;
    final waterHeight = height * fillLevel * 0.7; // Fill to 70% max

    final path = Path();

    // Bottom of glass
    path.moveTo(width * 0.25, height * 0.95);
    path.quadraticBezierTo(width * 0.5, height, width * 0.75, height * 0.95);

    // Right side
    path.lineTo(width * 0.78, height - waterHeight);

    // Water surface with ripple effect
    final wavePoints = 25;
    final baseWaveHeight = 4.0;
    final rippleWaveHeight = baseWaveHeight + (rippleIntensity * 12);

    for (var i = 0; i <= wavePoints; i++) {
      final t = i / wavePoints;
      final x = width * 0.78 - (width * 0.56) * t;

      // Create ripple pattern
      var waveOffset = math.sin(t * math.pi * 3 + time) * baseWaveHeight;

      // Add ripple effect when droplet hits
      if (rippleIntensity > 0) {
        final rippleDistance = (t - 0.5).abs();
        final rippleEffect = math.cos(rippleDistance * math.pi * 4) *
            (1 - rippleDistance) *
            rippleWaveHeight *
            rippleIntensity;
        waveOffset += rippleEffect;
      }

      final y = (height - waterHeight) + waveOffset;

      path.lineTo(x, y);
    }

    // Left side
    path.lineTo(width * 0.22, height - waterHeight);
    path.quadraticBezierTo(width * 0.13, height * 0.85, width * 0.25, height * 0.95);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RippleWaterFillPainter oldDelegate) {
    return oldDelegate.fillLevel != fillLevel ||
        oldDelegate.time != time ||
        oldDelegate.rippleIntensity != rippleIntensity;
  }
}

// Splash effect when droplet hits water
class SplashEffectPainter extends CustomPainter {
  final double progress;

  SplashEffectPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF64B5F6).withAlpha((255 * (1 - progress)).toInt())
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw splash droplets
    for (var i = 0; i < 6; i++) {
      final angle = (i / 6) * 2 * math.pi;
      final distance = 20 * progress;
      final x = centerX + math.cos(angle) * distance;
      final y = centerY + math.sin(angle) * distance * 0.5; // Flatten vertically

      final dropletSize = 4.0 * (1 - progress);

      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(x, y),
          width: dropletSize,
          height: dropletSize * 1.5,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(SplashEffectPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}