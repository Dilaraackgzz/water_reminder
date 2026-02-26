import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../domain/models/user_profile.dart';
import '../providers/profile_providers.dart';
import '../widgets/profile_activity_dialog.dart';
import '../widgets/profile_edit_dialog.dart';
import '../widgets/profile_gender_dialog.dart';
import '../widgets/profile_goal_dialog.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_section_header.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final profileAsync = ref.watch(userProfileProvider);
    final user = FirebaseAuth.instance.currentUser;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: ModernAppBar(
        title: l10n.profile_title,
        subtitle: l10n.profile_edit,
      ),
      drawer: const AppDrawer(),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: colorScheme.error),
              const SizedBox(height: UIConstants.spacingM),
              Text(
                l10n.common_error,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
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
                  ProfileHeader(
                    name: profile.name.isEmpty ? l10n.profile_user_default : profile.name,
                    email: user?.email ?? '',
                  ),

                  const SizedBox(height: UIConstants.spacingL),

                  // Profile Info Cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: UIConstants.cardPaddingL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Personal Information Section
                        ProfileSectionHeader(title: l10n.profile_personal_info),
                        const SizedBox(height: UIConstants.cardPaddingS),
                        ProfileInfoCard(
                          icon: Icons.person,
                          title: l10n.profile_name,
                          value: profile.name.isEmpty ? l10n.profile_name : profile.name,
                          onTap: () => _showEditNameDialog(context, ref, profile, l10n),
                        ),
                        const SizedBox(height: UIConstants.spacingS),
                        ProfileInfoCard(
                          icon: Icons.email,
                          title: l10n.profile_email,
                          value: user?.email ?? l10n.profile_email,
                          onTap: null, // Email is not editable
                        ),
                        const SizedBox(height: UIConstants.spacingS),
                        ProfileInfoCard(
                          icon: Icons.cake,
                          title: l10n.profile_age,
                          value: '${profile.age}',
                          onTap: () => _showEditAgeDialog(context, ref, profile, l10n),
                        ),
                        const SizedBox(height: UIConstants.spacingS),
                        ProfileInfoCard(
                          icon: Icons.wc,
                          title: l10n.profile_gender,
                          value: _getGenderDisplayName(profile.gender, l10n),
                          onTap: () => _showGenderDialog(context, ref, profile, l10n),
                        ),

                        const SizedBox(height: UIConstants.spacingL),

                        // Body Metrics Section
                        ProfileSectionHeader(title: l10n.profile_body_metrics),
                        const SizedBox(height: UIConstants.cardPaddingS),
                        ProfileInfoCard(
                          icon: Icons.monitor_weight,
                          title: l10n.profile_weight,
                          value: '${profile.weight} ${l10n.unit_kg}',
                          onTap: () => _showEditWeightDialog(context, ref, profile, l10n),
                        ),
                        const SizedBox(height: UIConstants.spacingS),
                        ProfileInfoCard(
                          icon: Icons.height,
                          title: l10n.profile_height,
                          value: '${profile.height.toInt()} ${l10n.unit_cm}',
                          onTap: () => _showEditHeightDialog(context, ref, profile, l10n),
                        ),
                        const SizedBox(height: UIConstants.spacingS),
                        ProfileInfoCard(
                          icon: Icons.fitness_center,
                          title: l10n.profile_activity_level,
                          value: _getActivityLevelName(profile.activityLevel, l10n),
                          subtitle: _getActivityLevelDescription(profile.activityLevel, l10n),
                          onTap: () => _showActivityLevelDialog(context, ref, profile, l10n),
                        ),
                        const SizedBox(height: UIConstants.spacingS),
                        ProfileInfoCard(
                          icon: Icons.monitor_heart,
                          title: l10n.profile_bmi,
                          value: profile.bmi.toStringAsFixed(1),
                          subtitle: _getBmiCategoryName(profile.bmiCategory, l10n),
                          onTap: null,
                        ),

                        const SizedBox(height: UIConstants.spacingL),

                        // Hydration Goal Section
                        ProfileSectionHeader(title: l10n.profile_daily_goal),
                        const SizedBox(height: UIConstants.cardPaddingS),
                        ProfileInfoCard(
                          icon: Icons.water_drop,
                          title: l10n.profile_daily_goal,
                          value: '${profile.dailyGoalInLiters} ${l10n.unit_liter}',
                          subtitle: profile.isCustomGoal
                              ? l10n.profile_custom_goal
                              : '${profile.calculatedDailyGoal} ${l10n.unit_ml}',
                          trailing: profile.isCustomGoal
                              ? TextButton.icon(
                                  onPressed: () => _applyCalculatedGoal(context, ref, profile, l10n),
                                  icon: const Icon(Icons.calculate, size: UIConstants.iconSizeS),
                                  label: Text(
                                    l10n.profile_use_calculated_goal,
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                )
                              : null,
                          onTap: () => _showEditGoalDialog(context, ref, profile, l10n),
                        ),

                        const SizedBox(height: UIConstants.spacingXL),

                        // Action Buttons
                        _buildActionButtons(context, ref, profile, l10n),

                        const SizedBox(height: UIConstants.spacingXL),
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

  String _getActivityLevelDescription(ActivityLevel level, AppLocalizations l10n) {
    switch (level) {
      case ActivityLevel.sedentary:
        return l10n.activity_sedentary_desc;
      case ActivityLevel.light:
        return l10n.activity_light_desc;
      case ActivityLevel.moderate:
        return l10n.activity_moderate_desc;
      case ActivityLevel.active:
        return l10n.activity_very_active_desc;
      case ActivityLevel.veryActive:
        return l10n.activity_extra_active_desc;
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

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    final colorScheme = Theme.of(context).colorScheme;

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
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: UIConstants.spacingM),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UIConstants.radiusM),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Dialog Methods
  void _showEditNameDialog(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    ProfileEditDialog.show(
      context: context,
      title: l10n.profile_name,
      labelText: l10n.profile_name,
      initialValue: profile.name,
      onSave: (value) async {
        final updatedProfile = profile.copyWith(
          name: value,
          updatedAt: DateTime.now(),
        );
        await ref.read(profileControllerProvider).updateProfile(updatedProfile);
      },
    );
  }

  void _showEditAgeDialog(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    ProfileEditDialog.show(
      context: context,
      title: l10n.profile_age,
      labelText: l10n.profile_age,
      initialValue: profile.age.toString(),
      keyboardType: TextInputType.number,
      onSave: (value) async {
        final age = int.tryParse(value) ?? profile.age;
        final updatedProfile = profile.copyWith(
          age: age,
          updatedAt: DateTime.now(),
        );
        await ref.read(profileControllerProvider).updateProfile(updatedProfile);
      },
    );
  }

  void _showEditWeightDialog(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    ProfileEditDialog.show(
      context: context,
      title: l10n.profile_weight,
      labelText: '${l10n.profile_weight} (${l10n.unit_kg})',
      initialValue: profile.weight.toString(),
      keyboardType: TextInputType.number,
      onSave: (value) async {
        final weight = double.tryParse(value) ?? profile.weight;
        final updatedProfile = profile.copyWith(
          weight: weight,
          updatedAt: DateTime.now(),
        );
        await ref.read(profileControllerProvider).updateProfile(updatedProfile);
      },
    );
  }

  void _showEditHeightDialog(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    ProfileEditDialog.show(
      context: context,
      title: l10n.profile_height,
      labelText: '${l10n.profile_height} (${l10n.unit_cm})',
      initialValue: profile.height.toInt().toString(),
      keyboardType: TextInputType.number,
      onSave: (value) async {
        final height = double.tryParse(value) ?? profile.height;
        final updatedProfile = profile.copyWith(
          height: height,
          updatedAt: DateTime.now(),
        );
        await ref.read(profileControllerProvider).updateProfile(updatedProfile);
      },
    );
  }

  void _showGenderDialog(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    ProfileGenderDialog.show(
      context: context,
      currentGender: profile.gender,
      onSelect: (gender) async {
        final updatedProfile = profile.copyWith(
          gender: gender,
          updatedAt: DateTime.now(),
        );
        await ref.read(profileControllerProvider).updateProfile(updatedProfile);
      },
    );
  }

  void _showActivityLevelDialog(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    ProfileActivityDialog.show(
      context: context,
      currentLevel: profile.activityLevel,
      onSelect: (level) async {
        final updatedProfile = profile.copyWith(
          activityLevel: level,
          updatedAt: DateTime.now(),
        );
        await ref.read(profileControllerProvider).updateProfile(updatedProfile);
      },
    );
  }

  void _showEditGoalDialog(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) {
    ProfileGoalDialog.show(
      context: context,
      currentGoal: profile.dailyGoal,
      calculatedGoal: profile.calculatedDailyGoal,
      onSave: (goal) async {
        await ref.read(profileControllerProvider).updateDailyGoal(
          profile.userId,
          goal,
          isCustom: true,
        );
      },
    );
  }

  void _applyCalculatedGoal(BuildContext context, WidgetRef ref, UserProfile profile, AppLocalizations l10n) async {
    await ref.read(profileControllerProvider).applyCalculatedGoal(profile);
  }
}
