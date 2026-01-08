import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import 'dart:math' as math;

class MotivationalMessage extends StatelessWidget {
  final double progressPercentage;
  final bool isCompact;

  const MotivationalMessage({
    super.key,
    required this.progressPercentage,
    this.isCompact = false,
  });

  String _getMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (progressPercentage >= 100) {
      final messages = [
        l10n.motivational_100_1,
        l10n.motivational_100_2,
        l10n.motivational_100_3,
        l10n.motivational_100_4,
      ];
      return messages[math.Random().nextInt(messages.length)];
    } else if (progressPercentage >= 75) {
      final messages = [
        l10n.motivational_75_1,
        l10n.motivational_75_2,
        l10n.motivational_75_3,
        l10n.motivational_75_4,
      ];
      return messages[math.Random().nextInt(messages.length)];
    } else if (progressPercentage >= 50) {
      final messages = [
        l10n.motivational_50_1,
        l10n.motivational_50_2,
        l10n.motivational_50_3,
        l10n.motivational_50_4,
      ];
      return messages[math.Random().nextInt(messages.length)];
    } else if (progressPercentage >= 25) {
      final messages = [
        l10n.motivational_25_1,
        l10n.motivational_25_2,
        l10n.motivational_25_3,
        l10n.motivational_25_4,
      ];
      return messages[math.Random().nextInt(messages.length)];
    } else {
      final messages = [
        l10n.motivational_0_1,
        l10n.motivational_0_2,
        l10n.motivational_0_3,
        l10n.motivational_0_4,
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

  Color _getColor(BuildContext context) {
    if (progressPercentage >= 100) {
      return Colors.amber;
    } else if (progressPercentage >= 75) {
      return Colors.green;
    } else if (progressPercentage >= 50) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Colors.blue;
    }
  }

  String _getShortMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (progressPercentage >= 100) {
      return l10n.motivational_100_short;
    } else if (progressPercentage >= 75) {
      return l10n.motivational_75_short;
    } else if (progressPercentage >= 50) {
      return l10n.motivational_50_short;
    } else if (progressPercentage >= 25) {
      return l10n.motivational_25_short;
    } else {
      return l10n.motivational_0_short;
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = _getMessage(context);
    final icon = _getIcon();
    final color = _getColor(context);

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
              text: _getShortMessage(context),
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
