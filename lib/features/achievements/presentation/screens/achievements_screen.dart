import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/providers/premium_provider.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../shared/providers/achievement_provider.dart';
import '../widgets/achievement_card.dart';
import '../widgets/achievement_stats_card.dart';
import '../../domain/constants/achievement_premium_ids.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final achievementsAsync = ref.watch(achievementsProvider);
    final totalPoints = ref.watch(totalPointsProvider);
    final isPremiumAsync = ref.watch(isPremiumProvider);
    final isPremium = isPremiumAsync.valueOrNull ?? false;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: ModernAppBar(
        title: l10n.achievements_title,
        subtitle: l10n.achievements_progress,
      ),
      drawer: const AppDrawer(),
      body: achievementsAsync.when(
        data: (achievements) {
          final premiumLockedIds =
              isPremium ? <String>{} : kPremiumAchievementIds;

          final unlocked = achievements.where((a) => a.isUnlocked).toList();
          final inProgress = achievements
              .where((a) =>
                  !a.isUnlocked &&
                  a.currentValue > 0 &&
                  !premiumLockedIds.contains(a.id))
              .toList();
          final notStarted = achievements
              .where((a) =>
                  !a.isUnlocked &&
                  a.currentValue == 0 &&
                  !premiumLockedIds.contains(a.id))
              .toList();
          final premiumLocked = achievements
              .where((a) => premiumLockedIds.contains(a.id))
              .toList();

          return ListView(
            padding: const EdgeInsets.fromLTRB(
              UIConstants.cardPaddingL,
              UIConstants.cardPaddingL,
              UIConstants.cardPaddingL,
              UIConstants.spacingXXL,
            ),
            children: [
              // Özet kart
              AchievementStatsCard(
                unlockedCount: unlocked.length,
                totalCount: achievements.length,
                totalPoints: totalPoints,
                unlockedLabel: l10n.achievements_unlocked,
                pointsLabel: l10n.achievements_reward_points,
              ),

              // Kazanıldı
              if (unlocked.isNotEmpty) ...[
                const SizedBox(height: UIConstants.spacingXL),
                _SectionHeader(
                  icon: Icons.emoji_events_rounded,
                  label: l10n.achievements_unlocked,
                  color: Colors.amber,
                  count: unlocked.length,
                ),
                const SizedBox(height: UIConstants.spacingM),
                ...unlocked.map((a) => AchievementCard(
                      achievement: a,
                      isUnlocked: true,
                    )),
              ],

              // Devam ediyor
              if (inProgress.isNotEmpty) ...[
                const SizedBox(height: UIConstants.spacingXL),
                _SectionHeader(
                  icon: Icons.trending_up_rounded,
                  label: 'Devam Ediyor',
                  color: colorScheme.primary,
                  count: inProgress.length,
                ),
                const SizedBox(height: UIConstants.spacingM),
                ...inProgress.map((a) => AchievementCard(
                      achievement: a,
                      isUnlocked: false,
                    )),
              ],

              // Başlanmadı
              if (notStarted.isNotEmpty) ...[
                const SizedBox(height: UIConstants.spacingXL),
                _SectionHeader(
                  icon: Icons.lock_open_rounded,
                  label: l10n.achievements_locked,
                  color: colorScheme.onSurfaceVariant,
                  count: notStarted.length,
                ),
                const SizedBox(height: UIConstants.spacingM),
                ...notStarted.map((a) => AchievementCard(
                      achievement: a,
                      isUnlocked: false,
                    )),
              ],

              // Premium kilitli
              if (premiumLocked.isNotEmpty) ...[
                const SizedBox(height: UIConstants.spacingXL),
                _SectionHeader(
                  icon: Icons.workspace_premium_rounded,
                  label: 'Premium Başarımlar',
                  color: colorScheme.primary,
                  count: premiumLocked.length,
                  isPremium: true,
                ),
                const SizedBox(height: UIConstants.spacingM),
                ...premiumLocked.map((a) => AchievementCard(
                      achievement: a,
                      isUnlocked: false,
                      isPremiumLocked: true,
                    )),
              ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child:
              Text('${l10n.common_error}: $error', style: GoogleFonts.poppins()),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final int count;
  final bool isPremium;

  const _SectionHeader({
    required this.icon,
    required this.label,
    required this.color,
    required this.count,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: isPremium
                ? colorScheme.primary.withAlpha(30)
                : color.withAlpha(30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$count',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isPremium ? colorScheme.primary : color,
            ),
          ),
        ),
      ],
    );
  }
}
