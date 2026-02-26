import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/ui_constants.dart';

class AchievementStatsCard extends StatelessWidget {
  final int unlockedCount;
  final int totalCount;
  final int totalPoints;
  final String unlockedLabel;
  final String pointsLabel;

  const AchievementStatsCard({
    super.key,
    required this.unlockedCount,
    required this.totalCount,
    required this.totalPoints,
    required this.unlockedLabel,
    required this.pointsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(UIConstants.cardPaddingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primary.withAlpha(220),
          ],
        ),
        borderRadius: BorderRadius.circular(UIConstants.radiusL),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem(
            icon: Icons.emoji_events,
            label: unlockedLabel,
            value: '$unlockedCount/$totalCount',
          ),
          const VerticalDivider(
            width: 1,
            thickness: 1,
            color: Colors.white38,
          ),
          _StatItem(
            icon: Icons.star,
            label: pointsLabel,
            value: totalPoints.toString(),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: UIConstants.iconSizeXL),
        const SizedBox(height: UIConstants.spacingS),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
