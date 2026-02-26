import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/ui_constants.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? photoUrl;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final displayInitial = name.isNotEmpty
        ? name.substring(0, 1).toUpperCase()
        : (email.isNotEmpty ? email.substring(0, 1).toUpperCase() : 'U');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(UIConstants.spacingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.primaryContainer.withAlpha(200),
          ],
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
            child: photoUrl != null
                ? ClipOval(
                    child: Image.network(
                      photoUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _buildInitialAvatar(displayInitial, colorScheme),
                    ),
                  )
                : _buildInitialAvatar(displayInitial, colorScheme),
          ),
          const SizedBox(height: UIConstants.spacingM),
          // User Name
          Text(
            name.isEmpty ? 'User' : name,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: UIConstants.spacingXS),
          // User Email
          Text(
            email,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: colorScheme.onPrimaryContainer.withAlpha(200),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialAvatar(String initial, ColorScheme colorScheme) {
    return Center(
      child: Text(
        initial,
        style: GoogleFonts.poppins(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
