import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../home/domain/models/user_streak.dart';
import '../../../home/presentation/providers/streak_providers.dart';

/// Widget displaying streak statistics
class StreakStatsCard extends ConsumerWidget {
  const StreakStatsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streakAsync = ref.watch(userStreakProvider);

    return streakAsync.when(
      data: (streak) {
        if (streak == null) {
          return const SizedBox.shrink();
        }
        return _StreakStatsContent(streak: streak);
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _StreakStatsContent extends StatelessWidget {
  final UserStreak streak;

  const _StreakStatsContent({required this.streak});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: streak.currentStreak >= 7
              ? [Colors.amber.shade100, Colors.amber.shade200]
              : [
                  colorScheme.primaryContainer.withAlpha(180),
                  colorScheme.primaryContainer.withAlpha(140),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                streak.streakEmoji,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 12),
              Text(
                'Your Streak',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Stats Grid
          Row(
            children: [
              Expanded(
                child: _StatBox(
                  icon: Icons.local_fire_department,
                  label: 'Current',
                  value: '${streak.currentStreak}',
                  unit: 'days',
                  isHighlighted: streak.currentStreak > 0,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatBox(
                  icon: Icons.emoji_events,
                  label: 'Best',
                  value: '${streak.longestStreak}',
                  unit: 'days',
                  isHighlighted: streak.isPersonalBest,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _StatBox(
                  icon: Icons.calendar_today,
                  label: 'Completed',
                  value: '${streak.completedDates.length}',
                  unit: 'days',
                  isHighlighted: false,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatBox(
                  icon: Icons.trending_up,
                  label: 'Next Goal',
                  value: '${streak.daysToNextMilestone}',
                  unit: 'days',
                  isHighlighted: false,
                ),
              ),
            ],
          ),

          // Milestone indicator
          if (streak.isStreakMilestone()) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.celebration,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      streak.getMilestoneText(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final bool isHighlighted;

  const _StatBox({
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlighted
            ? Colors.white.withAlpha(230)
            : Colors.white.withAlpha(179),
        borderRadius: BorderRadius.circular(16),
        border: isHighlighted
            ? Border.all(color: Colors.amber, width: 2)
            : null,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: isHighlighted ? Colors.amber[700] : Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.0,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
