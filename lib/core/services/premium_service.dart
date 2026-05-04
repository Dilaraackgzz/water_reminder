import 'package:shared_preferences/shared_preferences.dart';

// TODO: Adım 1 tamamlandığında aşağıdaki satırı aktif et:
// import 'package:purchases_flutter/purchases_flutter.dart';

// ignore: unused_element — RevenueCat aktif edildiğinde kullanılacak
const String _entitlementId = 'premium';

/// RevenueCat API Key'leri — Adım 1'den sonra gerçek key'lerle değiştir
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
    if (_isMockMode) return;

    // TODO: Adım 1 tamamlandığında aşağıdaki bloğu aktif et:
    // import 'dart:io';
    // await Purchases.setLogLevel(LogLevel.debug);
    // final PurchasesConfiguration config = Platform.isAndroid
    //     ? PurchasesConfiguration(_androidApiKey)
    //     : PurchasesConfiguration(_iosApiKey);
    // await Purchases.configure(config);
  }

  /// Kullanıcı Firebase UID'si ile RevenueCat kullanıcısını eşleştirir.
  /// Kullanıcı cihaz değiştirdiğinde premium'unu korur.
  Future<void> setUserId(String uid) async {
    if (_isMockMode) return;
    // TODO: await Purchases.logIn(uid);
  }

  /// Kullanıcı çıkış yaptığında çağrılır.
  Future<void> logOut() async {
    if (_isMockMode) return;
    // TODO: await Purchases.logOut();
  }

  /// Kullanıcının premium olup olmadığını kontrol eder.
  Future<bool> isPremium() async {
    if (_isMockMode) {
      return _prefs.getBool(_mockPremiumKey) ?? false;
    }
    // TODO: Adım 1 tamamlandığında aşağıdaki bloğu aktif et:
    // try {
    //   final customerInfo = await Purchases.getCustomerInfo();
    //   return customerInfo.entitlements.active.containsKey(_entitlementId);
    // } catch (_) {
    //   return false;
    // }
    return false;
  }

  /// Lifetime / aylık / yıllık paket satın alır.
  /// [packageIdentifier]: RevenueCat'te tanımlanan paket ID'si
  Future<PurchaseResult> purchasePackage(String packageIdentifier) async {
    if (_isMockMode) {
      await _prefs.setBool(_mockPremiumKey, true);
      return PurchaseResult.success;
    }
    // TODO: Adım 1 tamamlandığında aşağıdaki bloğu aktif et:
    // try {
    //   final offerings = await Purchases.getOfferings();
    //   final package = offerings.current?.availablePackages.firstWhere(
    //     (p) => p.identifier == packageIdentifier,
    //   );
    //   if (package == null) return PurchaseResult.failed;
    //   await Purchases.purchasePackage(package);
    //   return PurchaseResult.success;
    // } on PurchasesErrorCode catch (e) {
    //   if (e == PurchasesErrorCode.purchaseCancelledError) {
    //     return PurchaseResult.cancelled;
    //   }
    //   return PurchaseResult.failed;
    // }
    return PurchaseResult.failed;
  }

  /// Daha önce yapılmış satın almaları geri yükler.
  Future<PurchaseResult> restorePurchases() async {
    if (_isMockMode) {
      final isMockPremium = _prefs.getBool(_mockPremiumKey) ?? false;
      return isMockPremium ? PurchaseResult.success : PurchaseResult.notFound;
    }
    // TODO: Adım 1 tamamlandığında aşağıdaki bloğu aktif et:
    // try {
    //   final customerInfo = await Purchases.restorePurchases();
    //   final hasPremium = customerInfo.entitlements.active.containsKey(_entitlementId);
    //   return hasPremium ? PurchaseResult.success : PurchaseResult.notFound;
    // } catch (_) {
    //   return PurchaseResult.failed;
    // }
    return PurchaseResult.notFound;
  }

  // --- Sadece geliştirme/test amaçlı ---
  Future<void> debugSetPremium({required bool value}) async {
    assert(_isMockMode, 'debugSetPremium sadece mock modda kullanılabilir');
    await _prefs.setBool(_mockPremiumKey, value);
  }
}

enum PurchaseResult { success, cancelled, failed, notFound }
