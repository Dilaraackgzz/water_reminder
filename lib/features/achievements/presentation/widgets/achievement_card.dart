import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../shared/models/achievement.dart';

class AchievementCard extends StatelessWidget {
  final Achievement achievement;
  final bool isUnlocked;

  const AchievementCard({
    super.key,
    required this.achievement,
    required this.isUnlocked,
  });

  static const _iconMap = <String, IconData>{
    'water_drop': Icons.water_drop,
    'check_circle': Icons.check_circle,
    'local_fire_department': Icons.local_fire_department,
    'waves': Icons.waves,
    'event_available': Icons.event_available,
  };

  IconData _getIcon(String iconName) {
    return _iconMap[iconName] ?? Icons.emoji_events;
  }

  String _getLocalizedTitle(String titleKey, AppLocalizations l10n) {
    switch (titleKey) {
      case 'achievement_first_drop':
        return l10n.achievement_first_drop;
      case 'achievement_daily_goal_1':
        return l10n.achievement_daily_goal_1;
      case 'achievement_streak_3':
        return l10n.achievement_streak_3;
      case 'achievement_streak_7':
        return l10n.achievement_streak_7;
      case 'achievement_streak_30':
        return l10n.achievement_streak_30;
      case 'achievement_total_10l':
        return l10n.achievement_total_10l;
      case 'achievement_total_100l':
        return l10n.achievement_total_100l;
      case 'achievement_consistency':
        return l10n.achievement_consistency;
      default:
        return titleKey;
    }
  }

  String _getLocalizedDescription(String descKey, AppLocalizations l10n) {
    switch (descKey) {
      case 'achievement_first_drop_desc':
        return l10n.achievement_first_drop_desc;
      case 'achievement_daily_goal_1_desc':
        return l10n.achievement_daily_goal_1_desc;
      case 'achievement_streak_3_desc':
        return l10n.achievement_streak_3_desc;
      case 'achievement_streak_7_desc':
        return l10n.achievement_streak_7_desc;
      case 'achievement_streak_30_desc':
        return l10n.achievement_streak_30_desc;
      case 'achievement_total_10l_desc':
        return l10n.achievement_total_10l_desc;
      case 'achievement_total_100l_desc':
        return l10n.achievement_total_100l_desc;
      case 'achievement_consistency_desc':
        return l10n.achievement_consistency_desc;
      default:
        return descKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor = isDark
        ? (isUnlocked ? colorScheme.primaryContainer.withAlpha(60) : colorScheme.surfaceContainerHighest)
        : (isUnlocked ? colorScheme.primaryContainer.withAlpha(100) : colorScheme.surfaceContainerLow);

    final borderColor = isDark
        ? (isUnlocked ? colorScheme.primary : colorScheme.outlineVariant)
        : (isUnlocked ? colorScheme.primary : colorScheme.outlineVariant);

    final textColor = isUnlocked
        ? colorScheme.onSurface
        : colorScheme.onSurfaceVariant;

    final subtitleColor = isUnlocked
        ? colorScheme.onSurfaceVariant
        : colorScheme.outline;

    return Container(
      margin: const EdgeInsets.only(bottom: UIConstants.spacingM),
      padding: const EdgeInsets.all(UIConstants.cardPaddingM),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(UIConstants.radiusL),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(UIConstants.cardPaddingS),
            decoration: BoxDecoration(
              color: isUnlocked
                  ? colorScheme.primary
                  : colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(UIConstants.radiusM),
            ),
            child: Icon(
              _getIcon(achievement.iconName),
              color: isUnlocked ? Colors.white : colorScheme.onSurfaceVariant,
              size: 28,
            ),
          ),
          const SizedBox(width: UIConstants.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getLocalizedTitle(achievement.title, l10n),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: UIConstants.spacingXS),
                Text(
                  _getLocalizedDescription(achievement.description, l10n),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: subtitleColor,
                  ),
                ),
                if (!isUnlocked) ...[
                  const SizedBox(height: UIConstants.spacingS),
                  LinearProgressIndicator(
                    value: achievement.progress,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation(colorScheme.primary),
                  ),
                  const SizedBox(height: UIConstants.spacingXS),
                  Text(
                    achievement.progressText,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: colorScheme.outline,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (isUnlocked)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.spacingS,
                vertical: UIConstants.spacingXS,
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(UIConstants.radiusS),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.white),
                  const SizedBox(width: UIConstants.spacingXS),
                  Text(
                    '+${achievement.rewardPoints}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
