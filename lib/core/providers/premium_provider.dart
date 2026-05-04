import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/premium_service.dart';
import 'app_providers.dart';

final premiumServiceProvider = Provider<PremiumService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return PremiumService(prefs);
});

/// Kullanıcının premium olup olmadığını tutar.
/// Her ihtiyaç duyulduğunda `ref.watch(isPremiumProvider)` ile erişilir.
final isPremiumProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(premiumServiceProvider);
  return service.isPremium();
});

/// Satın alma ve geri yükleme işlemleri için controller.
class PremiumNotifier extends StateNotifier<AsyncValue<bool>> {
  final PremiumService _service;
  final Ref _ref;

  PremiumNotifier(this._service, this._ref) : super(const AsyncValue.loading()) {
    _load();
  }

  Future<void> _load() async {
    state = const AsyncValue.loading();
    try {
      final premium = await _service.isPremium();
      state = AsyncValue.data(premium);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<PurchaseResult> purchase(String packageIdentifier) async {
    final result = await _service.purchasePackage(packageIdentifier);
    if (result == PurchaseResult.success) {
      _ref.invalidate(isPremiumProvider);
      state = const AsyncValue.data(true);
    }
    return result;
  }

  Future<PurchaseResult> restore() async {
    final result = await _service.restorePurchases();
    if (result == PurchaseResult.success) {
      _ref.invalidate(isPremiumProvider);
      state = const AsyncValue.data(true);
    }
    return result;
  }

  Future<void> refresh() => _load();
}

final premiumNotifierProvider =
    StateNotifierProvider<PremiumNotifier, AsyncValue<bool>>((ref) {
  final service = ref.watch(premiumServiceProvider);
  return PremiumNotifier(service, ref);
});
