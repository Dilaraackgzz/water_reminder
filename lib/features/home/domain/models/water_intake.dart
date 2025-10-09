import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_intake.freezed.dart';
part 'water_intake.g.dart';

@freezed
class WaterIntake with _$WaterIntake {
  const factory WaterIntake({
    required String id,
    required String userId,
    required int amount, // Amount in ml
    required DateTime timestamp,
    String? note,
  }) = _WaterIntake;

  factory WaterIntake.fromJson(Map<String, dynamic> json) =>
      _$WaterIntakeFromJson(json);
}