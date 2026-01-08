import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../shared/providers/achievement_provider.dart';
import '../../../../shared/models/achievement.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final achievementsAsync = ref.watch(achievementsProvider);
    final totalPoints = ref.watch(totalPointsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: ModernAppBar(
        title: l10n.achievements_title,
        subtitle: l10n.achievements_progress,
      ),
      drawer: const AppDrawer(),
      body: achievementsAsync.when(
        data: (achievements) {
          final unlocked = achievements.where((a) => a.isUnlocked).toList();
          final locked = achievements.where((a) => !a.isUnlocked).toList();

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Stats Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withAlpha(220),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StatItem(
                      icon: Icons.emoji_events,
                      label: l10n.achievements_unlocked,
                      value: '${unlocked.length}/${achievements.length}',
                    ),
                    Container(width: 1, height: 40, color: Colors.white38),
                    _StatItem(
                      icon: Icons.star,
                      label: l10n.achievements_reward_points,
                      value: totalPoints.maybeWhen(
                        data: (points) => points.toString(),
                        orElse: () => '0',
                      ),
                    ),
                  ],
                ),
              ),

              if (unlocked.isNotEmpty) ...[
                const SizedBox(height: 32),
                Text(
                  l10n.achievements_unlocked,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                ...unlocked.map((achievement) => _AchievementCard(
                      achievement: achievement,
                      isUnlocked: true,
                      isDark: isDark,
                      l10n: l10n,
                    )),
              ],

              if (locked.isNotEmpty) ...[
                const SizedBox(height: 32),
                Text(
                  l10n.achievements_locked,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                ...locked.map((achievement) => _AchievementCard(
                      achievement: achievement,
                      isUnlocked: false,
                      isDark: isDark,
                      l10n: l10n,
                    )),
              ],
            ],
          );
        },
        loading: () => Center(child: Text(l10n.common_loading)),
        error: (error, stack) => Center(
          child: Text('${l10n.common_error}: $error', style: GoogleFonts.poppins()),
        ),
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
        Icon(icon, color: Colors.white, size: 32),
        const SizedBox(height: 8),
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

class _AchievementCard extends StatelessWidget {
  final Achievement achievement;
  final bool isUnlocked;
  final bool isDark;
  final AppLocalizations l10n;

  const _AchievementCard({
    required this.achievement,
    required this.isUnlocked,
    required this.isDark,
    required this.l10n,
  });

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'water_drop':
        return Icons.water_drop;
      case 'check_circle':
        return Icons.check_circle;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'waves':
        return Icons.waves;
      case 'event_available':
        return Icons.event_available;
      default:
        return Icons.emoji_events;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = isDark
        ? (isUnlocked ? colorScheme.primaryContainer.withAlpha(60) : Colors.grey[850]!)
        : (isUnlocked ? colorScheme.primaryContainer.withAlpha(100) : Colors.grey[100]!);

    final borderColor = isDark
        ? (isUnlocked ? colorScheme.primary : Colors.grey[700]!)
        : (isUnlocked ? colorScheme.primary : Colors.grey[300]!);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUnlocked
                  ? colorScheme.primary
                  : (isDark ? Colors.grey[700] : Colors.grey[400]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getIcon(achievement.iconName),
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isUnlocked
                        ? (isDark ? Colors.white : Colors.black87)
                        : (isDark ? Colors.grey[400] : Colors.grey[600]),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  achievement.description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: isUnlocked
                        ? (isDark ? Colors.white70 : Colors.black54)
                        : (isDark ? Colors.grey[500] : Colors.grey[500]),
                  ),
                ),
                if (!isUnlocked) ...[
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: achievement.progress,
                    backgroundColor: isDark ? Colors.grey[700] : Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation(colorScheme.primary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    achievement.progressText,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (isUnlocked)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.white),
                  const SizedBox(width: 4),
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
