import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../providers/home_providers.dart';
import '../providers/water_controller.dart';
import '../widgets/daily_progress_card.dart';
import '../widgets/quick_add_buttons.dart';
import '../widgets/motivational_message.dart';
import '../widgets/streak_card.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../core/providers/unit_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isAddingWater = false;

  Future<void> _handleAddWater(int amount) async {
    if (_isAddingWater) return;

    setState(() => _isAddingWater = true);

    try {
      final controller = ref.read(waterControllerProvider);
      await controller.addWater(amount);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to add water: $e',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isAddingWater = false);
      }
    }
  }

  void _showCustomAmountDialog() {
    final controller = TextEditingController();
    final waterUnit = ref.read(waterUnitProvider);
    final unitNotifier = ref.read(waterUnitProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          'Custom Amount',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Amount (${waterUnit.shortName})',
            labelStyle: GoogleFonts.poppins(
              color: isDark ? Colors.grey[400] : Colors.black54,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 2),
            ),
          ),
          style: GoogleFonts.poppins(
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final inputAmount = double.tryParse(controller.text);
              if (inputAmount != null && inputAmount > 0) {
                // Convert input to ml based on selected unit
                final amountInMl = unitNotifier.convertToMl(inputAmount);
                Navigator.pop(dialogContext);
                _handleAddWater(amountInMl);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00BCD4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Add',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progressPercentage = ref.watch(progressPercentageProvider);
    final todaysIntakesAsync = ref.watch(todaysWaterIntakesProvider);
    final unitNotifier = ref.watch(waterUnitProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: ModernAppBar(
        title: 'Aqualert',
        subtitle: DateFormat('EEEE, MMM d').format(DateTime.now()),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(todaysDailyGoalProvider);
            ref.invalidate(todaysWaterIntakesProvider);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Daily Progress Card (Compact)
                const DailyProgressCard(),

                const SizedBox(height: 16),

                // Quick Add Buttons (Priority placement)
                QuickAddButtons(
                  onAddWater: _handleAddWater,
                  isLoading: _isAddingWater,
                ),

                const SizedBox(height: 12),

                // Custom Amount Button (Compact)
                OutlinedButton.icon(
                  onPressed: _showCustomAmountDialog,
                  icon: const Icon(Icons.add_circle_outline, size: 20),
                  label: Text(
                    'Custom Amount',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF00BCD4),
                    side: const BorderSide(color: Color(0xFF00BCD4), width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Motivational Message Card
                MotivationalMessage(
                  progressPercentage: progressPercentage,
                  isCompact: true,
                ),

                const SizedBox(height: 12),

                // Streak Card
                const StreakCard(isCompact: true),

                const SizedBox(height: 24),

                // Today's History
                Text(
                  'Today\'s History',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),

                const SizedBox(height: 16),

                todaysIntakesAsync.when(
                  data: (intakes) {
                    if (intakes.isEmpty) {
                      return Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey[850] : Colors.grey[100],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 48,
                              color: isDark ? Colors.grey[600] : Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No water intake yet',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: isDark ? Colors.grey[400] : Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Start adding water to track your progress!',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: isDark ? Colors.grey[500] : Colors.grey[500],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: intakes.length,
                      itemBuilder: (context, index) {
                        final intake = intakes[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF00BCD4).withAlpha(26)
                                : const Color(0xFFE0F7FA).withAlpha(128),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF00BCD4).withAlpha(51),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00BCD4).withAlpha(51),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.water_drop,
                                  color: Color(0xFF00BCD4),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      unitNotifier.formatAmount(intake.amount),
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: isDark ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('h:mm a').format(intake.timestamp),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: isDark ? Colors.white60 : Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.red),
                                onPressed: () async {
                                  final controller = ref.read(waterControllerProvider);
                                  await controller.deleteWater(intake.id);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (error, stack) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        'Error loading history: $error',
                        style: GoogleFonts.poppins(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}