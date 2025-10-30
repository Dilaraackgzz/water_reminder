import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water_reminder/features/home/domain/models/daily_goal.dart';
import '../providers/home_providers.dart';
import 'water_progress_ring.dart';
import 'circular_wave_progress.dart';

class DailyProgressCard extends ConsumerWidget {
  const DailyProgressCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyGoalAsync = ref.watch(todaysDailyGoalProvider);
    final totalIntake = ref.watch(todaysTotalIntakeProvider);

    // Show default goal while loading
    final goal = dailyGoalAsync.maybeWhen(
      data: (goal) => goal,
      orElse: () => DailyGoal(
        userId: '',
        targetAmount: 2000,
        date: DateTime.now(),
        currentAmount: 0,
      ),
    );

    final progress = goal.progressPercentage / 100;
    final remaining = goal.remainingAmount;

    return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFE0F7FA), Color(0xFFB2EBF2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(13), // 0.05 * 255
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Progress Ring with Circular Wave
              WaterProgressRing(
                progress: progress,
                size: 160,
                strokeWidth: 12,
                child: CircularWaveProgress(
                  progress: progress,
                  size: 130,
                  waveColor: const Color(0xFF00BCD4),
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(width: 24),
              // Progress Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Progress',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${totalIntake}ml',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00BCD4),
                        height: 1.0,
                      ),
                    ),
                    Text(
                      'of ${goal.targetAmount}ml',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (remaining > 0) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00BCD4).withAlpha(51), // 0.2 * 255
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${remaining}ml to go!',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF00BCD4),
                          ),
                        ),
                      ),
                    ] else ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withAlpha(51), // 0.2 * 255
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Completed!',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
  }
}