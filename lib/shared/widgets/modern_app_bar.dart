import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModernAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool showDrawerButton;
  final List<Widget>? actions;
  final VoidCallback? onDrawerTap;

  const ModernAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.showDrawerButton = true,
    this.actions,
    this.onDrawerTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00BCD4), Color(0xFF00ACC1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00BCD4).withAlpha(77), // 0.3 * 255
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: showDrawerButton
            ? IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                onPressed: onDrawerTap ?? () => Scaffold.of(context).openDrawer(),
              )
            : null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(
                subtitle!,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withAlpha(230), // 0.9 * 255
                ),
              ),
            ],
          ],
        ),
        actions: actions,
      ),
    );
  }
}