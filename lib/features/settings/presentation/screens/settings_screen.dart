import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../shared/services/reminder_service.dart';
import '../../../../core/providers/app_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderService = ref.watch(reminderServiceProvider);
    final isReminderEnabled = reminderService.isReminderEnabled();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ModernAppBar(
        title: 'Settings',
        subtitle: 'Customize your experience',
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Notifications Section
            _SectionHeader(title: 'Notifications'),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.notifications_active,
              title: 'Enable Reminders',
              subtitle: isReminderEnabled
                  ? 'Water reminders are active'
                  : 'Turn on to get reminders',
              trailing: Switch(
                value: isReminderEnabled,
                onChanged: (value) async {
                  await reminderService.setReminderEnabled(value);
                  // Force rebuild
                  ref.invalidate(reminderServiceProvider);
                },
                activeColor: const Color(0xFF00BCD4),
              ),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.schedule,
              title: 'Reminder Interval',
              subtitle: '${reminderService.getReminderInterval()} minutes',
              onTap: () => _showIntervalDialog(context, ref, reminderService),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.access_time,
              title: 'Start Time',
              subtitle: _formatTime(reminderService.getReminderStartTime()),
              onTap: () => _showTimePickerDialog(
                context,
                ref,
                reminderService,
                isStartTime: true,
              ),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.bedtime,
              title: 'End Time',
              subtitle: _formatTime(reminderService.getReminderEndTime()),
              onTap: () => _showTimePickerDialog(
                context,
                ref,
                reminderService,
                isStartTime: false,
              ),
            ),

            const SizedBox(height: 32),

            // App Settings Section
            _SectionHeader(title: 'App Settings'),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.palette,
              title: 'Theme',
              subtitle: 'Light Mode',
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Theme customization - Coming Soon!',
                      style: GoogleFonts.poppins(),
                    ),
                    backgroundColor: const Color(0xFF00BCD4),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.language,
              title: 'Language',
              subtitle: 'English',
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Language settings - Coming Soon!',
                      style: GoogleFonts.poppins(),
                    ),
                    backgroundColor: const Color(0xFF00BCD4),
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // Account Section
            _SectionHeader(title: 'Account'),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.person,
              title: 'Edit Profile',
              subtitle: 'Update your information',
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Profile editing - Coming Soon!',
                      style: GoogleFonts.poppins(),
                    ),
                    backgroundColor: const Color(0xFF00BCD4),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.water_drop,
              title: 'Daily Goal',
              subtitle: 'Customize your water intake goal',
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Goal customization - Coming Soon!',
                      style: GoogleFonts.poppins(),
                    ),
                    backgroundColor: const Color(0xFF00BCD4),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Future<void> _showIntervalDialog(
    BuildContext context,
    WidgetRef ref,
    ReminderService service,
  ) async {
    final intervals = [30, 45, 60, 90, 120, 180];
    final current = service.getReminderInterval();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Reminder Interval',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: intervals.map((interval) {
            return RadioListTile<int>(
              title: Text(
                '$interval minutes',
                style: GoogleFonts.poppins(),
              ),
              value: interval,
              groupValue: current,
              onChanged: (value) async {
                if (value != null) {
                  await service.setReminderInterval(value);
                  ref.invalidate(reminderServiceProvider);
                  if (context.mounted) Navigator.pop(context);
                }
              },
              activeColor: const Color(0xFF00BCD4),
            );
          }).toList(),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  Future<void> _showTimePickerDialog(
    BuildContext context,
    WidgetRef ref,
    ReminderService service, {
    required bool isStartTime,
  }) async {
    final initialTime = isStartTime
        ? service.getReminderStartTime()
        : service.getReminderEndTime();

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      if (isStartTime) {
        await service.setReminderStartTime(picked);
      } else {
        await service.setReminderEndTime(picked);
      }
      ref.invalidate(reminderServiceProvider);
    }
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _SettingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
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
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
