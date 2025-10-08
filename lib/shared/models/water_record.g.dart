// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterRecordAdapter extends TypeAdapter<WaterRecord> {
  @override
  final int typeId = 0;

  @override
  WaterRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterRecord(
      id: fields[0] as String,
      amountMl: fields[1] as int,
      timestamp: fields[2] as DateTime,
      note: fields[3] as String?,
      type: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WaterRecord obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.amountMl)
      ..writeByte(2)
      ..write(obj.timestamp)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterRecordImpl _$$WaterRecordImplFromJson(Map<String, dynamic> json) =>
    _$WaterRecordImpl(
      id: json['id'] as String,
      amountMl: (json['amountMl'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      note: json['note'] as String?,
      type: json['type'] as String? ?? 'glass',
    );

Map<String, dynamic> _$$WaterRecordImplToJson(_$WaterRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amountMl': instance.amountMl,
      'timestamp': instance.timestamp.toIso8601String(),
      'note': instance.note,
      'type': instance.type,
    };
