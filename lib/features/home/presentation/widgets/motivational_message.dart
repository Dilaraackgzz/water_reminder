import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class MotivationalMessage extends StatelessWidget {
  final double progressPercentage;
  final bool isCompact;

  const MotivationalMessage({
    super.key,
    required this.progressPercentage,
    this.isCompact = false,
  });

  String _getMessage() {
    if (progressPercentage >= 100) {
      final messages = [
        'Congratulations! You\'ve reached your goal!',
        'Amazing work! Stay hydrated tomorrow too!',
        'You\'re a hydration champion!',
        'Perfect! Keep up the great habits!',
      ];
      return messages[math.Random().nextInt(messages.length)];
    } else if (progressPercentage >= 75) {
      final messages = [
        'Almost there! Just a bit more to go!',
        'You\'re doing great! Keep it up!',
        'So close to your goal!',
        'Fantastic progress! Don\'t stop now!',
      ];
      return messages[math.Random().nextInt(messages.length)];
    } else if (progressPercentage >= 50) {
      final messages = [
        'Halfway there! You\'re doing awesome!',
        'Great job! Keep going!',
        'You\'re on the right track!',
        'Nice progress! Stay consistent!',
      ];
      return messages[math.Random().nextInt(messages.length)];
    } else if (progressPercentage >= 25) {
      final messages = [
        'Good start! Keep drinking water!',
        'You\'re off to a great start!',
        'Nice beginning! Stay hydrated!',
        'Keep going! Every sip counts!',
      ];
      return messages[math.Random().nextInt(messages.length)];
    } else {
      final messages = [
        'Time to start hydrating! Your body will thank you!',
        'Let\'s begin your hydration journey!',
        'Start your day with some water!',
        'Your health matters! Start drinking!',
      ];
      return messages[math.Random().nextInt(messages.length)];
    }
  }

  IconData _getIcon() {
    if (progressPercentage >= 100) {
      return Icons.emoji_events;
    } else if (progressPercentage >= 75) {
      return Icons.trending_up;
    } else if (progressPercentage >= 50) {
      return Icons.favorite;
    } else if (progressPercentage >= 25) {
      return Icons.water_drop;
    } else {
      return Icons.wb_sunny;
    }
  }

  Color _getColor() {
    if (progressPercentage >= 100) {
      return Colors.amber;
    } else if (progressPercentage >= 75) {
      return Colors.green;
    } else if (progressPercentage >= 50) {
      return const Color(0xFF00BCD4);
    } else {
      return Colors.blue;
    }
  }

  String _getShortMessage() {
    if (progressPercentage >= 100) {
      return 'Goal Reached!';
    } else if (progressPercentage >= 75) {
      return 'Almost there!';
    } else if (progressPercentage >= 50) {
      return 'Halfway!';
    } else if (progressPercentage >= 25) {
      return 'Good start!';
    } else {
      return 'Let\'s begin!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = _getMessage();
    final icon = _getIcon();
    final color = _getColor();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
            child: child,
          ),
        );
      },
      child: isCompact
          ? _CompactCard(
              key: ValueKey(progressPercentage ~/ 25),
              icon: icon,
              text: _getShortMessage(),
              color: color,
            )
          : _FullCard(
              key: ValueKey(progressPercentage ~/ 25),
              icon: icon,
              message: message,
              color: color,
            ),
    );
  }
}

class _CompactCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _CompactCard({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withAlpha(77),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.8, end: 1.0),
            duration: const Duration(milliseconds: 600),
            curve: Curves.elasticOut,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              );
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FullCard extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color color;

  const _FullCard({
    super.key,
    required this.icon,
    required this.message,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withAlpha(77),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.8, end: 1.0),
            duration: const Duration(milliseconds: 600),
            curve: Curves.elasticOut,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              );
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
