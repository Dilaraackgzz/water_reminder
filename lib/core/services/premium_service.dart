import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _entitlementId = 'premium';

// RevenueCat API Key'leri — app.revenuecat.com konsolundan alınır
const String _androidApiKey = 'YOUR_REVENUECAT_ANDROID_API_KEY';
const String _iosApiKey = 'YOUR_REVENUECAT_IOS_API_KEY';

const String _mockPremiumKey = 'mock_is_premium';

bool get _isMockMode =>
    _androidApiKey == 'YOUR_REVENUECAT_ANDROID_API_KEY' ||
    _iosApiKey == 'YOUR_REVENUECAT_IOS_API_KEY';

class PremiumService {
  final SharedPreferences _prefs;

  PremiumService(this._prefs);

  /// RevenueCat'i başlatır. main.dart'tan çağrılır.
  static Future<void> initialize() async {
    if (_isMockMode) {
      debugPrint('PremiumService: Mock modda çalışıyor (API key girilmemiş)');
      return;
    }

    await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.error);

    final PurchasesConfiguration config = Platform.isAndroid
        ? PurchasesConfiguration(_androidApiKey)
        : PurchasesConfiguration(_iosApiKey);

    await Purchases.configure(config);
  }

  /// Kullanıcı Firebase UID'si ile RevenueCat kullanıcısını eşleştirir.
  Future<void> setUserId(String uid) async {
    if (_isMockMode) return;
    try {
      await Purchases.logIn(uid);
    } catch (e) {
      debugPrint('PremiumService.setUserId error: $e');
    }
  }

  /// Kullanıcı çıkış yaptığında çağrılır.
  Future<void> logOut() async {
    if (_isMockMode) return;
    try {
      await Purchases.logOut();
    } catch (e) {
      debugPrint('PremiumService.logOut error: $e');
    }
  }

  /// Kullanıcının premium olup olmadığını kontrol eder.
  Future<bool> isPremium() async {
    if (_isMockMode) {
      return _prefs.getBool(_mockPremiumKey) ?? false;
    }
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.active.containsKey(_entitlementId);
    } catch (e) {
      debugPrint('PremiumService.isPremium error: $e');
      return false;
    }
  }

  /// Belirtilen paketi satın alır.
  Future<PurchaseResult> purchasePackage(String packageIdentifier) async {
    if (_isMockMode) {
      await _prefs.setBool(_mockPremiumKey, true);
      return PurchaseResult.success;
    }
    try {
      final offerings = await Purchases.getOfferings();
      final package = offerings.current?.availablePackages.firstWhere(
        (p) => p.identifier == packageIdentifier,
        orElse: () => throw Exception('Package not found: $packageIdentifier'),
      );
      await Purchases.purchasePackage(package!);
      return PurchaseResult.success;
    } on PurchasesErrorCode catch (e) {
      if (e == PurchasesErrorCode.purchaseCancelledError) {
        return PurchaseResult.cancelled;
      }
      debugPrint('PremiumService.purchasePackage error: $e');
      return PurchaseResult.failed;
    } catch (e) {
      debugPrint('PremiumService.purchasePackage error: $e');
      return PurchaseResult.failed;
    }
  }

  /// Daha önce yapılmış satın almaları geri yükler.
  Future<PurchaseResult> restorePurchases() async {
    if (_isMockMode) {
      final isMockPremium = _prefs.getBool(_mockPremiumKey) ?? false;
      return isMockPremium ? PurchaseResult.success : PurchaseResult.notFound;
    }
    try {
      final customerInfo = await Purchases.restorePurchases();
      final hasPremium =
          customerInfo.entitlements.active.containsKey(_entitlementId);
      return hasPremium ? PurchaseResult.success : PurchaseResult.notFound;
    } catch (e) {
      debugPrint('PremiumService.restorePurchases error: $e');
      return PurchaseResult.failed;
    }
  }

  // --- Sadece geliştirme/test amaçlı ---
  Future<void> debugSetPremium({required bool value}) async {
    assert(_isMockMode, 'debugSetPremium sadece mock modda kullanılabilir');
    await _prefs.setBool(_mockPremiumKey, value);
  }
}

enum PurchaseResult { success, cancelled, failed, notFound }
