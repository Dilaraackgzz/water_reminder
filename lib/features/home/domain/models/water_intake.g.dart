// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_intake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterIntakeImpl _$$WaterIntakeImplFromJson(Map<String, dynamic> json) =>
    _$WaterIntakeImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$WaterIntakeImplToJson(_$WaterIntakeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'timestamp': instance.timestamp.toIso8601String(),
      'note': instance.note,
    };
