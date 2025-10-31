import 'package:shared_preferences/shared_preferences.dart';

/// Enum for water measurement units
enum WaterUnit {
  milliliters,
  fluidOunces;

  String get displayName {
    switch (this) {
      case WaterUnit.milliliters:
        return 'Milliliters (ml)';
      case WaterUnit.fluidOunces:
        return 'Fluid Ounces (fl oz)';
    }
  }

  String get shortName {
    switch (this) {
      case WaterUnit.milliliters:
        return 'ml';
      case WaterUnit.fluidOunces:
        return 'fl oz';
    }
  }
}

/// Service for managing water measurement unit preferences
class UnitService {
  static const String _unitKey = 'water_unit';
  final SharedPreferences _prefs;

  UnitService(this._prefs);

  /// Get the current water unit from storage
  WaterUnit getWaterUnit() {
    final unitString = _prefs.getString(_unitKey);

    if (unitString == null) {
      return WaterUnit.milliliters; // Default to ml
    }

    return WaterUnit.values.firstWhere(
      (unit) => unit.name == unitString,
      orElse: () => WaterUnit.milliliters,
    );
  }

  /// Save water unit to storage
  Future<void> setWaterUnit(WaterUnit unit) async {
    await _prefs.setString(_unitKey, unit.name);
  }

  /// Convert milliliters to the current unit
  double convertFromMl(int ml, WaterUnit unit) {
    switch (unit) {
      case WaterUnit.milliliters:
        return ml.toDouble();
      case WaterUnit.fluidOunces:
        return mlToFlOz(ml);
    }
  }

  /// Convert from current unit to milliliters
  int convertToMl(double amount, WaterUnit unit) {
    switch (unit) {
      case WaterUnit.milliliters:
        return amount.round();
      case WaterUnit.fluidOunces:
        return flOzToMl(amount);
    }
  }

  /// Format amount with unit
  String formatAmount(int ml, WaterUnit unit) {
    final converted = convertFromMl(ml, unit);

    switch (unit) {
      case WaterUnit.milliliters:
        return '${converted.toInt()} ${unit.shortName}';
      case WaterUnit.fluidOunces:
        // Show 1 decimal for fl oz
        return '${converted.toStringAsFixed(1)} ${unit.shortName}';
    }
  }

  /// Convert milliliters to fluid ounces
  /// 1 fl oz = 29.5735 ml
  static double mlToFlOz(int ml) {
    return ml / 29.5735;
  }

  /// Convert fluid ounces to milliliters
  /// 1 fl oz = 29.5735 ml
  static int flOzToMl(double flOz) {
    return (flOz * 29.5735).round();
  }

  /// Get common amounts in the current unit
  List<int> getQuickAddAmounts(WaterUnit unit) {
    switch (unit) {
      case WaterUnit.milliliters:
        return [250, 350, 500, 750]; // ml
      case WaterUnit.fluidOunces:
        // 8, 12, 16, 24 fl oz converted to ml
        return [237, 355, 473, 710]; // approximately 8, 12, 16, 24 fl oz in ml
    }
  }

  /// Get display labels for quick add amounts
  List<String> getQuickAddLabels(WaterUnit unit) {
    switch (unit) {
      case WaterUnit.milliliters:
        return ['250ml', '350ml', '500ml', '750ml'];
      case WaterUnit.fluidOunces:
        return ['8 fl oz', '12 fl oz', '16 fl oz', '24 fl oz'];
    }
  }
}
