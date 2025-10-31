import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../domain/models/user_profile.dart';
import '../providers/profile_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ModernAppBar(
        title: 'Profile',
        subtitle: 'Manage your information',
      ),
      drawer: const AppDrawer(),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Error loading profile',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
        ),
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('No profile found'));
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Profile Header
                  _buildProfileHeader(context, user, profile),

                  const SizedBox(height: 24),

                  // Profile Info Cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Personal Information Section
                        _SectionHeader(title: 'Personal Information'),
                        const SizedBox(height: 12),
                        _InfoCard(
                          icon: Icons.person,
                          title: 'Name',
                          value: profile.name.isEmpty ? 'Not set' : profile.name,
                          onTap: () => _showEditNameDialog(context, ref, profile),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.email,
                          title: 'Email',
                          value: user?.email ?? 'Not available',
                          onTap: null, // Email is not editable
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.cake,
                          title: 'Age',
                          value: '${profile.age} years',
                          onTap: () => _showEditAgeDialog(context, ref, profile),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.wc,
                          title: 'Gender',
                          value: profile.gender.displayName,
                          onTap: () => _showGenderDialog(context, ref, profile),
                        ),

                        const SizedBox(height: 24),

                        // Body Metrics Section
                        _SectionHeader(title: 'Body Metrics'),
                        const SizedBox(height: 12),
                        _InfoCard(
                          icon: Icons.monitor_weight,
                          title: 'Weight',
                          value: '${profile.weight} kg',
                          onTap: () => _showEditWeightDialog(context, ref, profile),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.height,
                          title: 'Height',
                          value: '${profile.height.toInt()} cm',
                          onTap: () => _showEditHeightDialog(context, ref, profile),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.fitness_center,
                          title: 'Activity Level',
                          value: profile.activityLevel.displayName,
                          subtitle: profile.activityLevel.description,
                          onTap: () => _showActivityLevelDialog(context, ref, profile),
                        ),
                        const SizedBox(height: 8),
                        _InfoCard(
                          icon: Icons.monitor_heart,
                          title: 'BMI',
                          value: profile.bmi.toStringAsFixed(1),
                          subtitle: profile.bmiCategory,
                          onTap: null,
                        ),

                        const SizedBox(height: 24),

                        // Hydration Goal Section
                        _SectionHeader(title: 'Hydration Goal'),
                        const SizedBox(height: 12),
                        _InfoCard(
                          icon: Icons.water_drop,
                          title: 'Daily Goal',
                          value: '${profile.dailyGoalInLiters} L',
                          subtitle: profile.isCustomGoal
                              ? 'Custom goal'
                              : 'Calculated goal (${profile.calculatedDailyGoal} ml)',
                          trailing: profile.isCustomGoal
                              ? TextButton.icon(
                                  onPressed: () => _applyCalculatedGoal(context, ref, profile),
                                  icon: const Icon(Icons.calculate, size: 16),
                                  label: Text(
                                    'Use Calculated',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                )
                              : null,
                          onTap: () => _showEditGoalDialog(context, ref, profile),
                        ),

                        const SizedBox(height: 32),

                        // Action Buttons
                        _buildActionButtons(context, ref, profile),

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

  Widget _buildProfileHeader(BuildContext context, User? user, UserProfile profile) {
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
            profile.name.isEmpty ? 'User' : profile.name,
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

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, UserProfile profile) {
    return Column(
      children: [
        // Calculate Goal Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _applyCalculatedGoal(context, ref, profile),
            icon: const Icon(Icons.calculate),
            label: Text(
              'Recalculate Recommended Goal',
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
  void _showEditNameDialog(BuildContext context, WidgetRef ref, UserProfile profile) {
    final controller = TextEditingController(text: profile.name);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Name', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.poppins()),
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
            child: Text('Save', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showEditAgeDialog(BuildContext context, WidgetRef ref, UserProfile profile) {
    final controller = TextEditingController(text: profile.age.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Age', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Age (years)',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.poppins()),
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
            child: Text('Save', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showEditWeightDialog(BuildContext context, WidgetRef ref, UserProfile profile) {
    final controller = TextEditingController(text: profile.weight.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Weight', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Weight (kg)',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.poppins()),
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
            child: Text('Save', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showEditHeightDialog(BuildContext context, WidgetRef ref, UserProfile profile) {
    final controller = TextEditingController(text: profile.height.toInt().toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Height', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Height (cm)',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.poppins()),
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
            child: Text('Save', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showGenderDialog(BuildContext context, WidgetRef ref, UserProfile profile) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Gender', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: Gender.values.map((gender) {
            return RadioListTile<Gender>(
              title: Text(gender.displayName, style: GoogleFonts.poppins()),
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

  void _showActivityLevelDialog(BuildContext context, WidgetRef ref, UserProfile profile) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Activity Level', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ActivityLevel.values.map((level) {
              return RadioListTile<ActivityLevel>(
                title: Text(level.displayName, style: GoogleFonts.poppins()),
                subtitle: Text(level.description, style: GoogleFonts.poppins(fontSize: 12)),
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

  void _showEditGoalDialog(BuildContext context, WidgetRef ref, UserProfile profile) {
    final controller = TextEditingController(text: profile.dailyGoal.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Daily Goal', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Daily Goal (ml)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Recommended: ${profile.calculatedDailyGoal} ml',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.poppins()),
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
            child: Text('Save', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _applyCalculatedGoal(BuildContext context, WidgetRef ref, UserProfile profile) async {
    await ref.read(profileControllerProvider).applyCalculatedGoal(profile);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Daily goal updated to ${profile.calculatedDailyGoal} ml',
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

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
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
  final VoidCallback? onTap;
  final Widget? trailing;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
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
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.withAlpha(51),
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
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else if (onTap != null)
                const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
