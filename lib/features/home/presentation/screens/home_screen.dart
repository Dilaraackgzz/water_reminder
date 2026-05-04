import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/providers/unit_provider.dart';
import '../../../../core/providers/premium_provider.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/utils/snackbar_helper.dart';
import '../../../../l10n/app_localizations.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isAddingWater = false;

  Future<void> _handleAddWater(int amount) async {
    if (_isAddingWater) return;

    HapticFeedback.mediumImpact();
    setState(() => _isAddingWater = true);

    try {
      final controller = ref.read(waterControllerProvider);
      await controller.addWater(amount);
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        SnackBarHelper.showError(context, l10n.home_add_water_failed);
      }
    } finally {
      if (mounted) {
        setState(() => _isAddingWater = false);
      }
    }
  }

  void _showCustomAmountDialog() {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();
    final waterUnit = ref.read(waterUnitProvider);
    final unitNotifier = ref.read(waterUnitProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Theme-aware colors
    final backgroundColor = isDark ? AppTheme.surfaceDark : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    HapticFeedback.selectionClick();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: backgroundColor,
        title: Text(
          l10n.home_custom_amount,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        content: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          autofocus: true,
          decoration: InputDecoration(
            labelText: '${l10n.home_amount_label} (${waterUnit.shortName})',
            labelStyle: GoogleFonts.poppins(
              color: subtitleColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIConstants.radiusM),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIConstants.radiusM),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
            ),
          ),
          style: GoogleFonts.poppins(
            color: textColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              l10n.common_cancel,
              style: GoogleFonts.poppins(color: subtitleColor),
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
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UIConstants.radiusM),
              ),
            ),
            child: Text(
              l10n.common_add,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIConstants.radiusL),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final progressPercentage = ref.watch(progressPercentageProvider);
    final todaysIntakesAsync = ref.watch(todaysWaterIntakesProvider);
    final unitNotifier = ref.watch(waterUnitProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    // Theme-aware colors
    final backgroundColor = isDark ? colorScheme.surface : Colors.grey[50];
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];
    final cardColor = isDark ? AppTheme.surfaceDark : Colors.grey[100];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: ModernAppBar(
        title: l10n.appName,
        subtitle: DateFormat('EEEE, MMM d').format(DateTime.now()),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Semantics(
          label: l10n.home_title,
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(todaysDailyGoalProvider);
              ref.invalidate(todaysWaterIntakesProvider);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(UIConstants.spacingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Daily Progress Card (Compact)
                  const DailyProgressCard(),

                  const SizedBox(height: UIConstants.spacingM),

                  // Quick Add Buttons (Priority placement)
                  QuickAddButtons(
                    onAddWater: _handleAddWater,
                    isLoading: _isAddingWater,
                  ),

                  const SizedBox(height: UIConstants.spacingM),

                  // Custom Amount Button — Premium only
                  Consumer(
                    builder: (context, ref, _) {
                      final isPremium =
                          ref.watch(isPremiumProvider).valueOrNull ?? false;
                      return Semantics(
                        button: true,
                        label: l10n.home_custom_amount,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            if (isPremium) {
                              _showCustomAmountDialog();
                            } else {
                              context.push('/paywall');
                            }
                          },
                          icon: Icon(
                            isPremium
                                ? Icons.add_circle_outline
                                : Icons.lock_outline,
                            size: 20,
                          ),
                          label: Text(
                            l10n.home_custom_amount,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: colorScheme.primary,
                            side: BorderSide(
                                color: colorScheme.primary, width: 2),
                            padding: const EdgeInsets.symmetric(
                                vertical: UIConstants.spacingM),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(UIConstants.radiusL),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: UIConstants.spacingM),

                  // Motivational Message Card
                  MotivationalMessage(
                    progressPercentage: progressPercentage,
                    isCompact: true,
                  ),

                  const SizedBox(height: UIConstants.spacingM),

                  // Streak Card
                  const StreakCard(isCompact: true),

                  const SizedBox(height: UIConstants.spacingL),

                  // Today's History
                  Text(
                    l10n.home_today,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: UIConstants.spacingM),

                todaysIntakesAsync.when(
                  data: (intakes) {
                    if (intakes.isEmpty) {
                      return Container(
                        padding: const EdgeInsets.all(UIConstants.spacingXL),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(UIConstants.radiusL),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 48,
                              color: subtitleColor,
                            ),
                            const SizedBox(height: UIConstants.spacingM),
                            Text(
                              l10n.home_no_records_today,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: subtitleColor,
                              ),
                            ),
                            const SizedBox(height: UIConstants.spacingS),
                            Text(
                              l10n.home_start_drinking,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: subtitleColor,
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
                        return Semantics(
                          label: '${unitNotifier.formatAmount(intake.amount)} at ${DateFormat('h:mm a').format(intake.timestamp)}',
                          child: Container(
                            margin: const EdgeInsets.only(bottom: UIConstants.spacingM),
                            padding: const EdgeInsets.all(UIConstants.spacingM),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? colorScheme.primary.withAlpha(26)
                                  : const Color(0xFFE0F7FA).withAlpha(128),
                              borderRadius: BorderRadius.circular(UIConstants.radiusM),
                              border: Border.all(
                                color: colorScheme.primary.withAlpha(51),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(UIConstants.spacingM),
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary.withAlpha(51),
                                    borderRadius: BorderRadius.circular(UIConstants.radiusM),
                                  ),
                                  child: Icon(
                                    Icons.water_drop,
                                    color: colorScheme.primary,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: UIConstants.spacingM),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        unitNotifier.formatAmount(intake.amount),
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('h:mm a').format(intake.timestamp),
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: subtitleColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Semantics(
                                  button: true,
                                  label: l10n.common_delete,
                                  child: IconButton(
                                    icon: Icon(Icons.delete_outline, color: AppTheme.errorRed),
                                    onPressed: () => _showDeleteConfirmation(intake.id),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(UIConstants.spacingXL),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (error, stack) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(UIConstants.spacingXL),
                      child: Text(
                        l10n.error_generic,
                        style: GoogleFonts.poppins(color: AppTheme.errorRed),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }

  void _showDeleteConfirmation(String intakeId) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    HapticFeedback.selectionClick();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: isDark ? AppTheme.surfaceDark : Colors.white,
        title: Text(
          l10n.home_delete_water_confirm,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              l10n.common_cancel,
              style: GoogleFonts.poppins(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              final controller = ref.read(waterControllerProvider);
              await controller.deleteWater(intakeId);
              if (mounted) {
                SnackBarHelper.showSuccess(context, l10n.home_delete_water_success);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UIConstants.radiusM),
              ),
            ),
            child: Text(
              l10n.common_delete,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIConstants.radiusL),
        ),
      ),
    );
  }
}