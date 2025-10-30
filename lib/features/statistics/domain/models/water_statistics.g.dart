// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterStatisticsImpl _$$WaterStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$WaterStatisticsImpl(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      totalIntake: (json['totalIntake'] as num).toInt(),
      targetAmount: (json['targetAmount'] as num).toInt(),
      averageIntake: (json['averageIntake'] as num).toDouble(),
      daysTracked: (json['daysTracked'] as num).toInt(),
      daysGoalAchieved: (json['daysGoalAchieved'] as num).toInt(),
      dailySummaries: (json['dailySummaries'] as List<dynamic>)
          .map((e) => DailyIntakeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WaterStatisticsImplToJson(
        _$WaterStatisticsImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'totalIntake': instance.totalIntake,
      'targetAmount': instance.targetAmount,
      'averageIntake': instance.averageIntake,
      'daysTracked': instance.daysTracked,
      'daysGoalAchieved': instance.daysGoalAchieved,
      'dailySummaries': instance.dailySummaries,
    };

_$DailyIntakeSummaryImpl _$$DailyIntakeSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyIntakeSummaryImpl(
      date: DateTime.parse(json['date'] as String),
      totalIntake: (json['totalIntake'] as num).toInt(),
      targetAmount: (json['targetAmount'] as num).toInt(),
      intakeCount: (json['intakeCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DailyIntakeSummaryImplToJson(
        _$DailyIntakeSummaryImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'totalIntake': instance.totalIntake,
      'targetAmount': instance.targetAmount,
      'intakeCount': instance.intakeCount,
    };
