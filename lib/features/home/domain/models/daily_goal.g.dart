// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyGoalImpl _$$DailyGoalImplFromJson(Map<String, dynamic> json) =>
    _$DailyGoalImpl(
      userId: json['userId'] as String,
      targetAmount: (json['targetAmount'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      currentAmount: (json['currentAmount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DailyGoalImplToJson(_$DailyGoalImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'targetAmount': instance.targetAmount,
      'date': instance.date.toIso8601String(),
      'currentAmount': instance.currentAmount,
    };
