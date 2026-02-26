import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../shared/providers/achievement_provider.dart';
import '../widgets/achievement_card.dart';
import '../widgets/achievement_stats_card.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final achievementsAsync = ref.watch(achievementsProvider);
    final totalPoints = ref.watch(totalPointsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
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
            padding: const EdgeInsets.all(UIConstants.cardPaddingL),
            children: [
              AchievementStatsCard(
                unlockedCount: unlocked.length,
                totalCount: achievements.length,
                totalPoints: totalPoints.maybeWhen(
                  data: (points) => points,
                  orElse: () => 0,
                ),
                unlockedLabel: l10n.achievements_unlocked,
                pointsLabel: l10n.achievements_reward_points,
              ),

              if (unlocked.isNotEmpty) ...[
                const SizedBox(height: UIConstants.spacingXL),
                Text(
                  l10n.achievements_unlocked,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: UIConstants.spacingM),
                ...unlocked.map((achievement) => AchievementCard(
                      achievement: achievement,
                      isUnlocked: true,
                    )),
              ],

              if (locked.isNotEmpty) ...[
                const SizedBox(height: UIConstants.spacingXL),
                Text(
                  l10n.achievements_locked,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: UIConstants.spacingM),
                ...locked.map((achievement) => AchievementCard(
                      achievement: achievement,
                      isUnlocked: false,
                    )),
              ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('${l10n.common_error}: $error', style: GoogleFonts.poppins()),
        ),
      ),
    );
  }
}
