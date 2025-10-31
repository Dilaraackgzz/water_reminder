import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/unit_service.dart';
import 'app_providers.dart';

/// Provider for UnitService
final unitServiceProvider = Provider<UnitService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return UnitService(prefs);
});

/// State notifier for managing water unit
class WaterUnitNotifier extends StateNotifier<WaterUnit> {
  final UnitService _unitService;

  WaterUnitNotifier(this._unitService) : super(_unitService.getWaterUnit());

  /// Set water unit and persist it
  Future<void> setWaterUnit(WaterUnit unit) async {
    await _unitService.setWaterUnit(unit);
    state = unit;
  }

  /// Get formatted amount string
  String formatAmount(int ml) {
    return _unitService.formatAmount(ml, state);
  }

  /// Convert from ml to current unit
  double convertFromMl(int ml) {
    return _unitService.convertFromMl(ml, state);
  }

  /// Convert from current unit to ml
  int convertToMl(double amount) {
    return _unitService.convertToMl(amount, state);
  }

  /// Get quick add amounts for current unit
  List<int> getQuickAddAmounts() {
    return _unitService.getQuickAddAmounts(state);
  }

  /// Get quick add labels for current unit
  List<String> getQuickAddLabels() {
    return _unitService.getQuickAddLabels(state);
  }
}

/// Provider for water unit state
final waterUnitProvider = StateNotifierProvider<WaterUnitNotifier, WaterUnit>((ref) {
  final unitService = ref.watch(unitServiceProvider);
  return WaterUnitNotifier(unitService);
});
