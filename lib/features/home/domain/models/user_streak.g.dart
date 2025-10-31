// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_streak.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStreakImpl _$$UserStreakImplFromJson(Map<String, dynamic> json) =>
    _$UserStreakImpl(
      userId: json['userId'] as String,
      currentStreak: (json['currentStreak'] as num).toInt(),
      longestStreak: (json['longestStreak'] as num).toInt(),
      lastCheckDate: DateTime.parse(json['lastCheckDate'] as String),
      streakStartDate: DateTime.parse(json['streakStartDate'] as String),
      completedDates: (json['completedDates'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserStreakImplToJson(_$UserStreakImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'lastCheckDate': instance.lastCheckDate.toIso8601String(),
      'streakStartDate': instance.streakStartDate.toIso8601String(),
      'completedDates':
          instance.completedDates.map((e) => e.toIso8601String()).toList(),
    };
