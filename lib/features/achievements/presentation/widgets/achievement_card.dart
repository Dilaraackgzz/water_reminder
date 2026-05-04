import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../shared/models/achievement.dart';

class AchievementCard extends StatelessWidget {
  final Achievement achievement;
  final bool isUnlocked;
  final bool isPremiumLocked;

  const AchievementCard({
    super.key,
    required this.achievement,
    required this.isUnlocked,
    this.isPremiumLocked = false,
  });

  static const _iconMap = <String, IconData>{
    'water_drop': Icons.water_drop,
    'check_circle': Icons.check_circle,
    'local_fire_department': Icons.local_fire_department,
    'waves': Icons.waves,
    'event_available': Icons.event_available,
    'stars': Icons.stars,
    'military_tech': Icons.military_tech,
    'emoji_events': Icons.emoji_events,
    'bolt': Icons.bolt,
    'calendar_month': Icons.calendar_month,
  };

  IconData _getIcon(String iconName) =>
      _iconMap[iconName] ?? Icons.emoji_events;

  String _getLocalizedTitle(String key, AppLocalizations l10n) {
    switch (key) {
      case 'achievement_first_drop':
        return l10n.achievement_first_drop;
      case 'achievement_daily_goal_1':
        return l10n.achievement_daily_goal_1;
      case 'achievement_daily_goal_5':
        return l10n.achievement_daily_goal_5;
      case 'achievement_daily_goal_10':
        return l10n.achievement_daily_goal_10;
      case 'achievement_daily_goal_30':
        return l10n.achievement_daily_goal_30;
      case 'achievement_streak_3':
        return l10n.achievement_streak_3;
      case 'achievement_streak_7':
        return l10n.achievement_streak_7;
      case 'achievement_streak_14':
        return l10n.achievement_streak_14;
      case 'achievement_streak_30':
        return l10n.achievement_streak_30;
      case 'achievement_streak_60':
        return l10n.achievement_streak_60;
      case 'achievement_total_1l':
        return l10n.achievement_total_1l;
      case 'achievement_total_5l':
        return l10n.achievement_total_5l;
      case 'achievement_total_10l':
        return l10n.achievement_total_10l;
      case 'achievement_total_50l':
        return l10n.achievement_total_50l;
      case 'achievement_total_100l':
        return l10n.achievement_total_100l;
      case 'achievement_consistency':
        return l10n.achievement_consistency;
      case 'achievement_consistency_month':
        return l10n.achievement_consistency_month;
      default:
        return key;
    }
  }

  String _getLocalizedDescription(String key, AppLocalizations l10n) {
    switch (key) {
      case 'achievement_first_drop_desc':
        return l10n.achievement_first_drop_desc;
      case 'achievement_daily_goal_1_desc':
        return l10n.achievement_daily_goal_1_desc;
      case 'achievement_daily_goal_5_desc':
        return l10n.achievement_daily_goal_5_desc;
      case 'achievement_daily_goal_10_desc':
        return l10n.achievement_daily_goal_10_desc;
      case 'achievement_daily_goal_30_desc':
        return l10n.achievement_daily_goal_30_desc;
      case 'achievement_streak_3_desc':
        return l10n.achievement_streak_3_desc;
      case 'achievement_streak_7_desc':
        return l10n.achievement_streak_7_desc;
      case 'achievement_streak_14_desc':
        return l10n.achievement_streak_14_desc;
      case 'achievement_streak_30_desc':
        return l10n.achievement_streak_30_desc;
      case 'achievement_streak_60_desc':
        return l10n.achievement_streak_60_desc;
      case 'achievement_total_1l_desc':
        return l10n.achievement_total_1l_desc;
      case 'achievement_total_5l_desc':
        return l10n.achievement_total_5l_desc;
      case 'achievement_total_10l_desc':
        return l10n.achievement_total_10l_desc;
      case 'achievement_total_50l_desc':
        return l10n.achievement_total_50l_desc;
      case 'achievement_total_100l_desc':
        return l10n.achievement_total_100l_desc;
      case 'achievement_consistency_desc':
        return l10n.achievement_consistency_desc;
      case 'achievement_consistency_month_desc':
        return l10n.achievement_consistency_month_desc;
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    if (isPremiumLocked) {
      return _PremiumLockedCard(
        achievement: achievement,
        icon: _getIcon(achievement.iconName),
        title: _getLocalizedTitle(achievement.title, l10n),
        description: _getLocalizedDescription(achievement.description, l10n),
        isDark: isDark,
        colorScheme: colorScheme,
      );
    }

    final backgroundColor = isDark
        ? (isUnlocked
            ? colorScheme.primaryContainer.withAlpha(60)
            : colorScheme.surfaceContainerHighest)
        : (isUnlocked
            ? colorScheme.primaryContainer.withAlpha(100)
            : colorScheme.surfaceContainerLow);

    final borderColor = isUnlocked
        ? colorScheme.primary.withAlpha(isDark ? 180 : 200)
        : colorScheme.outlineVariant;

    return Container(
      margin: const EdgeInsets.only(bottom: UIConstants.spacingM),
      padding: const EdgeInsets.all(UIConstants.cardPaddingM),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(UIConstants.radiusL),
        border: Border.all(color: borderColor, width: isUnlocked ? 1.5 : 1),
      ),
      child: Row(
        children: [
          // İkon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? colorScheme.primary
                  : colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(UIConstants.radiusM),
            ),
            child: Icon(
              _getIcon(achievement.iconName),
              color: isUnlocked
                  ? Colors.white
                  : colorScheme.onSurfaceVariant.withAlpha(120),
              size: 26,
            ),
          ),
          const SizedBox(width: UIConstants.spacingM),

          // Metin + progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getLocalizedTitle(achievement.title, l10n),
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isUnlocked
                        ? colorScheme.onSurface
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _getLocalizedDescription(achievement.description, l10n),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: isUnlocked
                        ? colorScheme.onSurfaceVariant
                        : colorScheme.outline,
                  ),
                ),
                if (!isUnlocked) ...[
                  const SizedBox(height: UIConstants.spacingS),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: achievement.progress,
                      minHeight: 5,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation(colorScheme.primary),
                    ),
                  ),
                  const SizedBox(height: 3),
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

          // Sağ rozet
          if (isUnlocked)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(UIConstants.radiusS),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 13, color: Colors.white),
                  const SizedBox(width: 3),
                  Text(
                    '+${achievement.rewardPoints}',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
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

class _PremiumLockedCard extends StatelessWidget {
  final Achievement achievement;
  final IconData icon;
  final String title;
  final String description;
  final bool isDark;
  final ColorScheme colorScheme;

  const _PremiumLockedCard({
    required this.achievement,
    required this.icon,
    required this.title,
    required this.description,
    required this.isDark,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/paywall'),
      child: Container(
        margin: const EdgeInsets.only(bottom: UIConstants.spacingM),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UIConstants.radiusL),
          border: Border.all(
            color: colorScheme.primary.withAlpha(60),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(UIConstants.radiusL),
          child: Stack(
            children: [
              // Blur altında kartın içeriği
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                child: Container(
                  padding: const EdgeInsets.all(UIConstants.cardPaddingM),
                  color: isDark
                      ? colorScheme.surfaceContainerHighest.withAlpha(180)
                      : colorScheme.surfaceContainerLow,
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withAlpha(40),
                          borderRadius:
                              BorderRadius.circular(UIConstants.radiusM),
                        ),
                        child: Icon(icon,
                            color: colorScheme.primary.withAlpha(120), size: 26),
                      ),
                      const SizedBox(width: UIConstants.spacingM),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 14,
                              width: 100,
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface.withAlpha(80),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 10,
                              width: 160,
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface.withAlpha(40),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Üstteki premium overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withAlpha(100)
                        : colorScheme.primary.withAlpha(12),
                  ),
                ),
              ),

              // Kilit + premium etiketi
              Positioned.fill(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.lock_rounded,
                          size: 14,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Premium',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
