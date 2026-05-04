import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/providers/premium_provider.dart';
import '../../../../core/services/premium_service.dart';
import '../../../../l10n/app_localizations.dart';

/// RevenueCat paket ID'leri — Adım 1'den sonra gerçek ID'lerle değiştir
const _kLifetimePackageId = '\$rc_lifetime';
const _kMonthlyPackageId = '\$rc_monthly';
const _kAnnualPackageId = '\$rc_annual';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  int _selectedPlanIndex = 1; // Varsayılan: Yıllık
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, colorScheme),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    _buildFeatureList(colorScheme),
                    const SizedBox(height: 28),
                    _buildPlanSelector(colorScheme, isDark),
                    const SizedBox(height: 24),
                    _buildPurchaseButton(context, l10n, colorScheme),
                    const SizedBox(height: 16),
                    _buildFooter(context, l10n, colorScheme),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme colorScheme) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withAlpha(180),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.water_drop_rounded,
                  color: colorScheme.onPrimary,
                  size: 36,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Aqualert Premium',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Hidrasyon hedeflerine tam potansiyelinle ulaş',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: colorScheme.onSurface.withAlpha(160),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.close_rounded,
              color: colorScheme.onSurface.withAlpha(180),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureList(ColorScheme colorScheme) {
    final features = [
      (Icons.bar_chart_rounded, 'Haftalık, Aylık & Yıllık İstatistikler'),
      (Icons.notifications_active_rounded, 'Sınırsız Özel Hatırlatıcı'),
      (Icons.emoji_events_rounded, 'Tüm Başarımlar'),
      (Icons.upload_file_rounded, 'Veri Dışa Aktarım'),
      (Icons.palette_rounded, 'Premium Temalar'),
      (Icons.star_rounded, 'Gelecekteki Tüm Özellikler'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(80),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withAlpha(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: features
            .map((f) => _FeatureRow(icon: f.$1, label: f.$2, colorScheme: colorScheme))
            .toList(),
      ),
    );
  }

  Widget _buildPlanSelector(ColorScheme colorScheme, bool isDark) {
    final plans = [
      _PlanOption(
        label: 'Aylık',
        price: '\$0.99',
        period: '/ay',
        packageId: _kMonthlyPackageId,
        isBestValue: false,
      ),
      _PlanOption(
        label: 'Yıllık',
        price: '\$4.99',
        period: '/yıl',
        packageId: _kAnnualPackageId,
        isBestValue: true,
      ),
      _PlanOption(
        label: 'Ömür Boyu',
        price: '\$2.99',
        period: '',
        packageId: _kLifetimePackageId,
        isBestValue: false,
      ),
    ];

    return Column(
      children: [
        Row(
          children: List.generate(plans.length, (i) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: i == 0 ? 0 : 6,
                  right: i == plans.length - 1 ? 0 : 6,
                ),
                child: _PlanCard(
                  option: plans[i],
                  isSelected: _selectedPlanIndex == i,
                  colorScheme: colorScheme,
                  isDark: isDark,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() => _selectedPlanIndex = i);
                  },
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPurchaseButton(
    BuildContext context,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    final plans = [_kMonthlyPackageId, _kAnnualPackageId, _kLifetimePackageId];

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton(
        onPressed: _isLoading
            ? null
            : () => _handlePurchase(context, plans[_selectedPlanIndex]),
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: _isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colorScheme.onPrimary,
                ),
              )
            : Text(
                'Premium\'a Geç',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildFooter(
    BuildContext context,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        TextButton(
          onPressed: _isLoading ? null : () => _handleRestore(context),
          child: Text(
            'Satın alımı geri yükle',
            style: TextStyle(
              color: colorScheme.onSurface.withAlpha(160),
              fontSize: 13,
            ),
          ),
        ),
        Text(
          'Ödeme Google Play / App Store üzerinden işlenir.\nİptal etmek için hesap ayarlarını kullan.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorScheme.onSurface.withAlpha(100),
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Future<void> _handlePurchase(BuildContext context, String packageId) async {
    setState(() => _isLoading = true);
    HapticFeedback.mediumImpact();

    final router = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final result = await ref
        .read(premiumNotifierProvider.notifier)
        .purchase(packageId);

    if (!mounted) return;
    setState(() => _isLoading = false);

    switch (result) {
      case PurchaseResult.success:
        HapticFeedback.heavyImpact();
        _showSnackBarWithMessenger(messenger, 'Premium\'a hoş geldin! 🎉', isError: false);
        router.pop();
      case PurchaseResult.cancelled:
        break;
      case PurchaseResult.failed:
        _showSnackBarWithMessenger(messenger, 'Satın alma başarısız. Tekrar dene.', isError: true);
      case PurchaseResult.notFound:
        _showSnackBarWithMessenger(messenger, 'Paket bulunamadı.', isError: true);
    }
  }

  Future<void> _handleRestore(BuildContext context) async {
    setState(() => _isLoading = true);
    HapticFeedback.lightImpact();

    final router = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final result = await ref
        .read(premiumNotifierProvider.notifier)
        .restore();

    if (!mounted) return;
    setState(() => _isLoading = false);

    switch (result) {
      case PurchaseResult.success:
        _showSnackBarWithMessenger(messenger, 'Satın alım geri yüklendi!', isError: false);
        router.pop();
      case PurchaseResult.notFound:
        _showSnackBarWithMessenger(messenger, 'Önceki satın alım bulunamadı.', isError: true);
      case PurchaseResult.failed:
      case PurchaseResult.cancelled:
        _showSnackBarWithMessenger(messenger, 'Geri yükleme başarısız.', isError: true);
    }
  }

  void _showSnackBarWithMessenger(
    ScaffoldMessengerState messenger,
    String message, {
    required bool isError,
  }) {
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red[700] : Colors.green[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorScheme colorScheme;

  const _FeatureRow({
    required this.icon,
    required this.label,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Icon(Icons.check_circle_rounded, color: colorScheme.primary, size: 18),
        ],
      ),
    );
  }
}

class _PlanOption {
  final String label;
  final String price;
  final String period;
  final String packageId;
  final bool isBestValue;

  const _PlanOption({
    required this.label,
    required this.price,
    required this.period,
    required this.packageId,
    required this.isBestValue,
  });
}

class _PlanCard extends StatelessWidget {
  final _PlanOption option;
  final bool isSelected;
  final ColorScheme colorScheme;
  final bool isDark;
  final VoidCallback onTap;

  const _PlanCard({
    required this.option,
    required this.isSelected,
    required this.colorScheme,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withAlpha(30)
              : (isDark ? colorScheme.surfaceContainerHighest : Colors.white),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withAlpha(60),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            if (option.isBestValue)
              Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'En İyi',
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else
              const SizedBox(height: 22),
            Text(
              option.price,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              ),
            ),
            if (option.period.isNotEmpty)
              Text(
                option.period,
                style: TextStyle(
                  fontSize: 10,
                  color: colorScheme.onSurface.withAlpha(140),
                ),
              ),
            const SizedBox(height: 4),
            Text(
              option.label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface.withAlpha(180),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
