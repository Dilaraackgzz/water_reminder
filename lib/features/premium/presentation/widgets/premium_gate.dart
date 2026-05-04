import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/providers/premium_provider.dart';

/// Premium olmayan kullanıcılar için içeriği bulanıklaştırır ve kilit ikonu gösterir.
/// Üzerine tıklanınca paywall ekranına yönlendirir.
class PremiumGate extends ConsumerWidget {
  final Widget child;
  final double blurSigma;

  const PremiumGate({
    super.key,
    required this.child,
    this.blurSigma = 6.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final premiumAsync = ref.watch(isPremiumProvider);

    return premiumAsync.when(
      data: (isPremium) {
        if (isPremium) return child;
        return _LockedOverlay(blurSigma: blurSigma, child: child);
      },
      loading: () => child,
      error: (_, __) => _LockedOverlay(blurSigma: blurSigma, child: child),
    );
  }
}

class _LockedOverlay extends StatelessWidget {
  final Widget child;
  final double blurSigma;

  const _LockedOverlay({required this.child, required this.blurSigma});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => context.push('/paywall'),
      child: Stack(
        children: [
          AbsorbPointer(child: child),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                child: Container(
                  color: colorScheme.surface.withAlpha(100),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.lock_rounded,
                            color: colorScheme.onPrimary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Premium',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
