import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../core/providers/premium_provider.dart';
import '../../core/services/ad_service.dart';

const double _kBannerHeight = 50.0;

/// Premium olmayan kullanıcılara banner reklam gösterir.
/// Reklam yüklenene kadar placeholder gösterilir.
/// Premium kullanıcılarda hiçbir şey render etmez.
class BannerAdWidget extends ConsumerStatefulWidget {
  const BannerAdWidget({super.key});

  @override
  ConsumerState<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends ConsumerState<BannerAdWidget> {
  final AdService _adService = AdService();
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAdIfNeeded();
  }

  void _loadAdIfNeeded() {
    final isPremium = ref.read(isPremiumProvider).valueOrNull ?? false;
    if (!isPremium) {
      _adService.loadBannerAd(onLoaded: () {
        if (mounted) setState(() => _isAdLoaded = true);
      });
    }
  }

  @override
  void dispose() {
    _adService.disposeBannerAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPremium = ref.watch(isPremiumProvider).valueOrNull ?? false;

    if (isPremium) return const SizedBox.shrink();

    return SafeArea(
      top: false,
      child: SizedBox(
        height: _kBannerHeight,
        child: _isAdLoaded && _adService.bannerAd != null
            ? AdWidget(ad: _adService.bannerAd!)
            : const _BannerPlaceholder(),
      ),
    );
  }
}

class _BannerPlaceholder extends StatelessWidget {
  const _BannerPlaceholder();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5);
    final borderColor = isDark ? const Color(0xFF333333) : const Color(0xFFE0E0E0);
    final textColor = isDark ? const Color(0xFF666666) : const Color(0xFFBBBBBB);

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(top: BorderSide(color: borderColor, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, size: 16, color: textColor),
          const SizedBox(width: 6),
          Text(
            'Advertisement',
            style: TextStyle(
              fontSize: 11,
              color: textColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
