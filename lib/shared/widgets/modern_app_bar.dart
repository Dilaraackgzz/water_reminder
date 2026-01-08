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
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
            ? [colorScheme.surface, colorScheme.surfaceContainerHigh]
            : [colorScheme.primaryContainer.withAlpha(180), colorScheme.primaryContainer.withAlpha(150)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withAlpha(20),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: showDrawerButton
            ? IconButton(
                icon: Icon(Icons.menu, color: colorScheme.onPrimaryContainer, size: 28),
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
                color: colorScheme.onPrimaryContainer,
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
                  color: colorScheme.onPrimaryContainer.withAlpha(200),
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