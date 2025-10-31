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
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
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
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00BCD4), Color(0xFF00ACC1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00BCD4).withAlpha(77), // 0.3 * 255
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.label,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
