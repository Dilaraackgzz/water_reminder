import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/providers/unit_provider.dart';

class QuickAddButtons extends ConsumerWidget {
  final Function(int) onAddWater;
  final bool isLoading;

  const QuickAddButtons({
    super.key,
    required this.onAddWater,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitNotifier = ref.watch(waterUnitProvider.notifier);
    final amounts = unitNotifier.getQuickAddAmounts();
    final labels = unitNotifier.getQuickAddLabels();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final icons = [
      Icons.local_drink,
      Icons.local_cafe,
      Icons.sports_bar,
      Icons.water_drop,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Quick Add',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _QuickAddButton(
                amount: amounts[0],
                label: labels[0],
                icon: icons[0],
                onPressed: () => onAddWater(amounts[0]),
                isLoading: isLoading,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _QuickAddButton(
                amount: amounts[1],
                label: labels[1],
                icon: icons[1],
                onPressed: () => onAddWater(amounts[1]),
                isLoading: isLoading,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _QuickAddButton(
                amount: amounts[2],
                label: labels[2],
                icon: icons[2],
                onPressed: () => onAddWater(amounts[2]),
                isLoading: isLoading,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _QuickAddButton(
                amount: amounts[3],
                label: labels[3],
                icon: icons[3],
                onPressed: () => onAddWater(amounts[3]),
                isLoading: isLoading,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickAddButton extends StatefulWidget {
  final int amount;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isLoading;

  const _QuickAddButton({
    required this.amount,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  State<_QuickAddButton> createState() => _QuickAddButtonState();
}

class _QuickAddButtonState extends State<_QuickAddButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (!widget.isLoading) {
      _scaleController.forward().then((_) {
        _scaleController.reverse();
      });
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Dynamic sizing based on available space
        final buttonWidth = constraints.maxWidth;
        final verticalPadding = (buttonWidth * 0.15).clamp(12.0, 24.0);
        final horizontalPadding = (buttonWidth * 0.12).clamp(10.0, 20.0);
        final iconSize = (buttonWidth * 0.24).clamp(28.0, 40.0);
        final fontSize = (iconSize * 0.45).clamp(13.0, 18.0);
        final spacing = (iconSize * 0.20).clamp(6.0, 10.0);

        return ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _handleTap,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding,
                  horizontal: horizontalPadding,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withAlpha(220),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withAlpha(60),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.white,
                      size: iconSize,
                    ),
                    SizedBox(height: spacing),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.label,
                        style: GoogleFonts.poppins(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
