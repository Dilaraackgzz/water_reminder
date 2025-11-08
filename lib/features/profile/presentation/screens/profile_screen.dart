import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../domain/models/user_profile.dart';
import '../providers/profile_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final profileAsync = ref.watch(userProfileProvider);
    final user = FirebaseAuth.instance.currentUser;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: ModernAppBar(
        title: l10n.profile_title,
        subtitle: l10n.profile_edit,
      ),
      drawer: const AppDrawer(),
      body: profileAsync.when(
        loading: () => Center(child: Text(l10n.common_loading)),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                l10n.common_error,
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
        ),
        data: (profile) {
          if (profile == null) {
            return Center(child: Text(l10n.common_error));
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Profile Header
                  _buildProfileHeader(context, user, profile, l10n),

                  const SizedBox(height: 24),

                  // Profile Info Cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Personal Information Section
                        _SectionHeader(title: l10n.profile_personal_info, isDark: isDark),
                        const SizedBox(height: 12),
                        _InfoCard(
                          icon: Icons.person,
                          title: l10n.profile_name,
                          value: profile.name.isEmpty ? l10n.profile_name : profile.name,
                          isDark: isDark,
                          onTap: () => _showEditNameDialog(context, ref, profile, isDark, l10n),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.email,
                          title: l10n.profile_email,
                          value: user?.email ?? l10n.profile_email,
                          isDark: isDark,
                          onTap: null, // Email is not editable
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.cake,
                          title: l10n.profile_age,
                          value: '${profile.age}',
                          isDark: isDark,
                          onTap: () => _showEditAgeDialog(context, ref, profile, isDark, l10n),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.wc,
                          title: l10n.profile_gender,
                          value: _getGenderDisplayName(profile.gender, l10n),
                          isDark: isDark,
                          onTap: () => _showGenderDialog(context, ref, profile, isDark, l10n),
                        ),

                        const SizedBox(height: 24),

                        // Body Metrics Section
                        _SectionHeader(title: l10n.profile_body_metrics, isDark: isDark),
                        const SizedBox(height: 12),
                        _InfoCard(
                          icon: Icons.monitor_weight,
                          title: l10n.profile_weight,
                          value: '${profile.weight} ${l10n.unit_kg}',
                          isDark: isDark,
                          onTap: () => _showEditWeightDialog(context, ref, profile, isDark, l10n),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.height,
                          title: l10n.profile_height,
                          value: '${profile.height.toInt()} ${l10n.unit_cm}',
                          isDark: isDark,
                          onTap: () => _showEditHeightDialog(context, ref, profile, isDark, l10n),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.fitness_center,
                          title: l10n.profile_activity_level,
                          value: _getActivityLevelName(profile.activityLevel, l10n),
                          subtitle: profile.activityLevel.description,
                          isDark: isDark,
                          onTap: () => _showActivityLevelDialog(context, ref, profile, isDark, l10n),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.monitor_heart,
                          title: l10n.profile_bmi,
                          value: profile.bmi.toStringAsFixed(1),
                          subtitle: _getBmiCategoryName(profile.bmiCategory, l10n),
                          isDark: isDark,
                          onTap: null,
                        ),

                        const SizedBox(height: 24),

                        // Hydration Goal Section
                        _SectionHeader(title: l10n.profile_daily_goal, isDark: isDark),
                        const SizedBox(height: 12),
                        _InfoCard(
                          icon: Icons.water_drop,
                          title: l10n.profile_daily_goal,
                          value: '${profile.dailyGoalInLiters} ${l10n.unit_liter}',
                          subtitle: profile.isCustomGoal
                              ? l10n.profile_custom_goal
                              : '${profile.calculatedDailyGoal} ${l10n.unit_ml}',
                          isDark: isDark,
                          trailing: profile.isCustomGoal
                              ? TextButton.icon(
                                  onPressed: () => _applyCalculatedGoal(context, ref, profile, l10n),
                                  icon: const Icon(Icons.calculate, size: 16),
                                  label: Text(
                                    l10n.profile_use_calculated_goal,
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                )
                              : null,
                          onTap: () => _showEditGoalDialog(context, ref, profile, isDark, l10n),
                        ),

                        const SizedBox(height: 32),

                        // Action Buttons
                        _buildActionButtons(context, ref, profile, l10n),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getGenderDisplayName(Gender gender, AppLocalizations l10n) {
    switch (gender) {
      case Gender.male:
        return l10n.gender_male;
      case Gender.female:
        return l10n.gender_female;
      case Gender.other:
        return l10n.gender_other;
    }
  }

  String _getActivityLevelName(ActivityLevel level, AppLocalizations l10n) {
    switch (level) {
      case ActivityLevel.sedentary:
        return l10n.activity_sedentary;
      case ActivityLevel.light:
        return l10n.activity_light;
      case ActivityLevel.moderate:
        return l10n.activity_moderate;
      case ActivityLevel.active:
        return l10n.activity_very_active;
      case ActivityLevel.veryActive:
        return l10n.activity_extra_active;
    }
  }

  String _getBmiCategoryName(String category, AppLocalizations l10n) {
    switch (category.toLowerCase()) {
      case 'underweight':
        return l10n.bmi_underweight;
      case 'normal':
      case 'normal weight':
        return l10n.bmi_normal;
      case 'overweight':
        return l10n.bmi_overweight;
      case 'obese':
        return l10n.bmi_obese;
      default:
        return category;
    }
  }

  Widget _buildProfileHeader(BuildContext context, User? user, UserProfile profile, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00BCD4), Color(0xFF00ACC1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Profile Avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(26),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                profile.name.isNotEmpty
                    ? profile.name.substring(0, 1).toUpperCase()
                    : user?.email?.substring(0, 1).toUpperCase() ?? 'U',
                style: GoogleFonts.poppins(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF00BCD4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // User Name
          Text(
            profile.name.isEmpty ? l10n.profile_user_default : profile.name,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          // User Email
          Text(
            user?.email ?? '',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white.withAlpha(230),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    return Column(
      children: [
        // Calculate Goal Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _applyCalculatedGoal(context, ref, profile, l10n),
            icon: const Icon(Icons.calculate),
            label: Text(
              l10n.profile_use_calculated_goal,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00BCD4),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Dialog Methods
  void _showEditNameDialog(BuildContext context, WidgetRef ref, UserProfile profile, bool isDark, AppLocalizations l10n) {
    final controller = TextEditingController(text: profile.name);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.profile_name,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: TextField(
          controller: controller,
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
          decoration: InputDecoration(
            labelText: l10n.profile_name,
            labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
          ),
          TextButton(
            onPressed: () async {
              final updatedProfile = profile.copyWith(
                name: controller.text,
                updatedAt: DateTime.now(),
              );
              await ref.read(profileControllerProvider).updateProfile(updatedProfile);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(l10n.common_save, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showEditAgeDialog(BuildContext context, WidgetRef ref, UserProfile profile, bool isDark, AppLocalizations l10n) {
    final controller = TextEditingController(text: profile.age.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.profile_age,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
          decoration: InputDecoration(
            labelText: l10n.profile_age,
            labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
          ),
          TextButton(
            onPressed: () async {
              final age = int.tryParse(controller.text) ?? profile.age;
              final updatedProfile = profile.copyWith(
                age: age,
                updatedAt: DateTime.now(),
              );
              await ref.read(profileControllerProvider).updateProfile(updatedProfile);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(l10n.common_save, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showEditWeightDialog(BuildContext context, WidgetRef ref, UserProfile profile, bool isDark, AppLocalizations l10n) {
    final controller = TextEditingController(text: profile.weight.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.profile_weight,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
          decoration: InputDecoration(
            labelText: '${l10n.profile_weight} (${l10n.unit_kg})',
            labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
          ),
          TextButton(
            onPressed: () async {
              final weight = double.tryParse(controller.text) ?? profile.weight;
              final updatedProfile = profile.copyWith(
                weight: weight,
                updatedAt: DateTime.now(),
              );
              await ref.read(profileControllerProvider).updateProfile(updatedProfile);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(l10n.common_save, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showEditHeightDialog(BuildContext context, WidgetRef ref, UserProfile profile, bool isDark, AppLocalizations l10n) {
    final controller = TextEditingController(text: profile.height.toInt().toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.profile_height,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
          decoration: InputDecoration(
            labelText: '${l10n.profile_height} (${l10n.unit_cm})',
            labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
          ),
          TextButton(
            onPressed: () async {
              final height = double.tryParse(controller.text) ?? profile.height;
              final updatedProfile = profile.copyWith(
                height: height,
                updatedAt: DateTime.now(),
              );
              await ref.read(profileControllerProvider).updateProfile(updatedProfile);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(l10n.common_save, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showGenderDialog(BuildContext context, WidgetRef ref, UserProfile profile, bool isDark, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.profile_gender,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: Gender.values.map((gender) {
            return RadioListTile<Gender>(
              title: Text(
                _getGenderDisplayName(gender, l10n),
                style: GoogleFonts.poppins(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              value: gender,
              groupValue: profile.gender,
              onChanged: (value) async {
                if (value != null) {
                  final updatedProfile = profile.copyWith(
                    gender: value,
                    updatedAt: DateTime.now(),
                  );
                  await ref.read(profileControllerProvider).updateProfile(updatedProfile);
                  if (context.mounted) Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showActivityLevelDialog(BuildContext context, WidgetRef ref, UserProfile profile, bool isDark, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.profile_activity_level,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ActivityLevel.values.map((level) {
              return RadioListTile<ActivityLevel>(
                title: Text(
                  _getActivityLevelName(level, l10n),
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                subtitle: Text(
                  level.description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
                value: level,
                groupValue: profile.activityLevel,
                onChanged: (value) async {
                  if (value != null) {
                    final updatedProfile = profile.copyWith(
                      activityLevel: value,
                      updatedAt: DateTime.now(),
                    );
                    await ref.read(profileControllerProvider).updateProfile(updatedProfile);
                    if (context.mounted) Navigator.pop(context);
                  }
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showEditGoalDialog(BuildContext context, WidgetRef ref, UserProfile profile, bool isDark, AppLocalizations l10n) {
    final controller = TextEditingController(text: profile.dailyGoal.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.profile_daily_goal,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                labelText: '${l10n.profile_daily_goal} (${l10n.unit_ml})',
                labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${profile.calculatedDailyGoal} ${l10n.unit_ml}',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: isDark ? Colors.grey[400] : Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
          ),
          TextButton(
            onPressed: () async {
              final goal = int.tryParse(controller.text) ?? profile.dailyGoal;
              await ref.read(profileControllerProvider).updateDailyGoal(
                profile.userId,
                goal,
                isCustom: true,
              );
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(l10n.common_save, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _applyCalculatedGoal(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) async {
    await ref.read(profileControllerProvider).applyCalculatedGoal(profile);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${l10n.profile_daily_goal}: ${profile.calculatedDailyGoal} ${l10n.unit_ml}',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: const Color(0xFF00BCD4),
        ),
      );
    }
  }
}

// Section Header Widget
class _SectionHeader extends StatelessWidget {
  final String title;
  final bool isDark;

  const _SectionHeader({
    required this.title,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : Colors.black87,
      ),
    );
  }
}

// Info Card Widget
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? subtitle;
  final bool isDark;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.isDark,
    this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[850] : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00BCD4).withAlpha(26),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: const Color(0xFF00BCD4), size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: isDark ? Colors.white60 : Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: isDark ? Colors.grey[400] : Colors.grey[500],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else if (onTap != null)
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
