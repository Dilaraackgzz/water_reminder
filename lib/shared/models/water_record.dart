import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'water_record.freezed.dart';
part 'water_record.g.dart';

@freezed
@HiveType(typeId: 0)
class WaterRecord with _$WaterRecord {
  const factory WaterRecord({
    @HiveField(0) required String id,
    @HiveField(1) required int amountMl,
    @HiveField(2) required DateTime timestamp,
    @HiveField(3) String? note,
    @HiveField(4) @Default('glass') String type,
  }) = _WaterRecord;

  factory WaterRecord.fromJson(Map<String, dynamic> json) =>
      _$WaterRecordFromJson(json);
}

extension WaterRecordExtension on WaterRecord {
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'amountMl': amountMl,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'note': note,
      'type': type,
    };
  }

  static WaterRecord fromFirestore(Map<String, dynamic> data) {
    return WaterRecord(
      id: data['id'] ?? '',
      amountMl: data['amountMl'] ?? 0,
      timestamp: DateTime.fromMillisecondsSinceEpoch(data['timestamp'] ?? 0),
      note: data['note'],
      type: data['type'] ?? 'glass',
    );
  }
}