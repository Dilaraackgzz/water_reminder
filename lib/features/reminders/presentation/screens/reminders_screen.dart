import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../shared/services/reminder_service.dart';
import '../../../../core/providers/app_providers.dart';

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
    final reminderService = ref.watch(reminderServiceProvider);
    final notificationService = ref.watch(notificationServiceProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: const ModernAppBar(
        title: 'Reminders',
        subtitle: 'Manage your water reminders',
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await _loadPendingCount();
          },
          color: const Color(0xFF00BCD4),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Reminder Status Card
              _ReminderStatusCard(
                isEnabled: reminderService.isReminderEnabled(),
                isDark: isDark,
                onToggle: (value) async {
                  await reminderService.setReminderEnabled(value);
                  ref.invalidate(reminderServiceProvider);
                  await _loadPendingCount();
                },
              ),

              const SizedBox(height: 16),

              // Pending Reminders Count
              if (!_isLoading && reminderService.isReminderEnabled())
                _PendingCountCard(
                  count: _pendingCount ?? 0,
                  isDark: isDark,
                ),

              const SizedBox(height: 24),

              // Current Schedule Info
              if (reminderService.isReminderEnabled()) ...[
                _ScheduleInfoCard(
                  reminderService: reminderService,
                  isDark: isDark,
                ),
                const SizedBox(height: 24),
              ],

              // Quick Actions
              Text(
                'Quick Actions',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              _ActionCard(
                icon: Icons.notifications_active,
                title: 'Test Notification',
                subtitle: 'Send a test reminder now',
                isDark: isDark,
                onTap: () async {
                  try {
                    // Request permissions first
                    final hasPermission = await notificationService.requestPermissions();

                    if (!hasPermission) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please enable notification permissions',
                              style: GoogleFonts.poppins(),
                            ),
                            backgroundColor: Colors.orange,
                            action: SnackBarAction(
                              label: 'Settings',
                              textColor: Colors.white,
                              onPressed: () async {
                                await openAppSettings();
                              },
                            ),
                          ),
                        );
                      }
                      return;
                    }

                    // Send test notification
                    await notificationService.showNotification(
                      id: 9999,
                      title: '💧 Test Reminder',
                      body: 'This is a test notification. Stay hydrated!',
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Test notification sent! Check your notification panel.',
                            style: GoogleFonts.poppins(),
                          ),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Failed to send notification: ${e.toString()}',
                            style: GoogleFonts.poppins(),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
              ),

              const SizedBox(height: 12),

              _ActionCard(
                icon: Icons.refresh,
                title: 'Refresh Schedule',
                subtitle: 'Reschedule all reminders',
                isDark: isDark,
                onTap: () async {
                  await reminderService.scheduleReminders();
                  await _loadPendingCount();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Reminders rescheduled successfully!',
                          style: GoogleFonts.poppins(),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 12),

              _ActionCard(
                icon: Icons.clear_all,
                title: 'Clear All Reminders',
                subtitle: 'Cancel all scheduled reminders',
                isDark: isDark,
                onTap: () async {
                  await reminderService.cancelAllReminders();
                  await _loadPendingCount();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'All reminders cancelled!',
                          style: GoogleFonts.poppins(),
                        ),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 24),

              // Info Section
              _InfoCard(isDark: isDark),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReminderStatusCard extends StatelessWidget {
  final bool isEnabled;
  final bool isDark;
  final Function(bool) onToggle;

  const _ReminderStatusCard({
    required this.isEnabled,
    required this.isDark,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = isDark
        ? (isEnabled
            ? [const Color(0xFF004D5F), const Color(0xFF006978)]
            : [Colors.grey[800]!, Colors.grey[850]!])
        : (isEnabled
            ? [const Color(0xFFE0F7FA), const Color(0xFFB2EBF2)]
            : [Colors.grey[100]!, Colors.grey[200]!]);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDark ? 26 : 13),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isEnabled
                  ? const Color(0xFF00BCD4).withAlpha(51)
                  : Colors.grey.withAlpha(51),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isEnabled ? Icons.notifications_active : Icons.notifications_off,
              color: isEnabled ? const Color(0xFF00BCD4) : Colors.grey,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEnabled ? 'Reminders Active' : 'Reminders Disabled',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isEnabled
                      ? 'You will receive water reminders'
                      : 'Enable to start receiving reminders',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isEnabled,
            onChanged: onToggle,
            activeColor: const Color(0xFF00BCD4),
          ),
        ],
      ),
    );
  }
}

class _PendingCountCard extends StatelessWidget {
  final int count;
  final bool isDark;

  const _PendingCountCard({
    required this.count,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00BCD4).withAlpha(26),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.schedule,
              color: Color(0xFF00BCD4),
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pending Reminders',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  count == 0
                      ? 'No reminders scheduled'
                      : count == 1
                          ? '1 reminder scheduled'
                          : '$count reminders scheduled',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00BCD4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$count',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleInfoCard extends StatelessWidget {
  final ReminderService reminderService;
  final bool isDark;

  const _ScheduleInfoCard({
    required this.reminderService,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final startTime = reminderService.getReminderStartTime();
    final endTime = reminderService.getReminderEndTime();
    final interval = reminderService.getReminderInterval();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.schedule, color: Color(0xFF00BCD4), size: 24),
              const SizedBox(width: 12),
              Text(
                'Current Schedule',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _InfoRow(
            label: 'Start Time',
            value:
                '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}',
            isDark: isDark,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            label: 'End Time',
            value:
                '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}',
            isDark: isDark,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            label: 'Interval',
            value: '$interval minutes',
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: isDark ? Colors.white60 : Colors.black54,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF00BCD4),
          ),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isDark;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDark ? Colors.grey[850] : Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00BCD4).withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF00BCD4), size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final bool isDark;

  const _InfoCard({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.blue[900]!.withAlpha(77) : Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.blue[800]! : Colors.blue[100]!,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: isDark ? Colors.blue[300] : Colors.blue[700],
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Reminders help you stay hydrated throughout the day. You can customize the schedule in Settings.',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: isDark ? Colors.blue[200] : Colors.blue[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}