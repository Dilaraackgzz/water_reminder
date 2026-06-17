import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Gerçek Ad Unit ID'leri — AdMob konsolundan alınır ve buraya girilir.
// Yayın öncesinde test ID'leri gerçek ID'lerle mutlaka değiştirilmeli.
const String _androidBannerAdUnitId =
    'ca-app-pub-3940256099942544/6300978111'; // Google test banner ID
const String _iosBannerAdUnitId =
    'ca-app-pub-3940256099942544/2934735716'; // Google test banner ID

class AdService {
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;

  bool get isBannerAdLoaded => _isBannerAdLoaded;
  BannerAd? get bannerAd => _bannerAd;

  /// MobileAds SDK'sını başlatır. main.dart'tan bir kez çağrılır.
  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  String get _bannerAdUnitId =>
      Platform.isAndroid ? _androidBannerAdUnitId : _iosBannerAdUnitId;

  /// Banner reklam yükler ve hazır olunca [onLoaded] callback'ini çağırır.
  void loadBannerAd({required VoidCallback onLoaded}) {
    _bannerAd = BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          _isBannerAdLoaded = true;
          onLoaded();
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('AdService: Banner yüklenemedi — $error');
          ad.dispose();
          _bannerAd = null;
          _isBannerAdLoaded = false;
        },
      ),
    )..load();
  }

  /// Banner reklamı serbest bırakır.
  void disposeBannerAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
    _isBannerAdLoaded = false;
  }
}
