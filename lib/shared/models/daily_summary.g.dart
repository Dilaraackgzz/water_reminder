// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailySummaryImpl _$$DailySummaryImplFromJson(Map<String, dynamic> json) =>
    _$DailySummaryImpl(
      date: DateTime.parse(json['date'] as String),
      totalMl: (json['totalMl'] as num).toInt(),
      goalMl: (json['goalMl'] as num).toInt(),
      recordIds:
          (json['recordIds'] as List<dynamic>).map((e) => e as String).toList(),
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
      goalAchieved: json['goalAchieved'] as bool? ?? false,
    );

Map<String, dynamic> _$$DailySummaryImplToJson(_$DailySummaryImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'totalMl': instance.totalMl,
      'goalMl': instance.goalMl,
      'recordIds': instance.recordIds,
      'streakDays': instance.streakDays,
      'goalAchieved': instance.goalAchieved,
    };
