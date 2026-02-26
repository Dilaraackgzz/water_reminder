import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/constants/ui_constants.dart';
import '../widgets/reminder_status_card.dart';
import '../widgets/pending_count_card.dart';
import '../widgets/schedule_info_card.dart';
import '../widgets/reminder_action_card.dart';
import '../widgets/reminder_info_card.dart';

class RemindersScreen extends ConsumerStatefulWidget {
  const RemindersScreen({super.key});

  @override
  ConsumerState<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends ConsumerState<RemindersScreen> {
  int? _pendingCount;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPendingCount();
  }

  Future<void> _loadPendingCount() async {
    final reminderService = ref.read(reminderServiceProvider);
    final count = await reminderService.getPendingRemindersCount();
    if (mounted) {
      setState(() {
        _pendingCount = count;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final reminderService = ref.watch(reminderServiceProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: ModernAppBar(
        title: l10n.reminders_title,
        subtitle: l10n.reminders_active,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await _loadPendingCount();
          },
          color: Theme.of(context).colorScheme.primary,
          child: ListView(
            padding: const EdgeInsets.all(UIConstants.cardPaddingL),
            children: [
              // Reminder Status Card
              ReminderStatusCard(
                isEnabled: reminderService.isReminderEnabled(),
                isDark: isDark,
                l10n: l10n,
                onToggle: (value) async {
                  await reminderService.setReminderEnabled(value);
                  ref.invalidate(reminderServiceProvider);
                  await _loadPendingCount();
                },
              ),

              const SizedBox(height: 16),

              // Pending Reminders Count
              if (!_isLoading && reminderService.isReminderEnabled())
                PendingCountCard(
                  count: _pendingCount ?? 0,
                  isDark: isDark,
                  l10n: l10n,
                ),

              const SizedBox(height: 24),

              // Current Schedule Info
              if (reminderService.isReminderEnabled()) ...[
                ScheduleInfoCard(
                  reminderService: reminderService,
                  isDark: isDark,
                  l10n: l10n,
                ),
                const SizedBox(height: 24),
              ],

              // Quick Actions
              Text(
                l10n.settings_reminders,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              ReminderActionCard(
                icon: Icons.refresh,
                title: l10n.reminders_reschedule,
                subtitle: l10n.reminders_reschedule_subtitle,
                isDark: isDark,
                onTap: () async {
                  await reminderService.scheduleReminders();
                  await _loadPendingCount();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.reminders_schedule_success),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 12),

              ReminderActionCard(
                icon: Icons.clear_all,
                title: l10n.reminders_cancel_all,
                subtitle: l10n.reminders_cancel_all_subtitle,
                isDark: isDark,
                onTap: () async {
                  await reminderService.cancelAllReminders();
                  await _loadPendingCount();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.reminders_cancel_success),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 24),

              // Info Section
              ReminderInfoCard(isDark: isDark, l10n: l10n),
            ],
          ),
        ),
      ),
    );
  }
}
