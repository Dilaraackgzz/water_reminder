// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsImpl _$$UserSettingsImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingsImpl(
      userId: json['userId'] as String,
      weight: (json['weight'] as num?)?.toDouble() ?? 70.0,
      height: (json['height'] as num?)?.toDouble() ?? 170.0,
      age: (json['age'] as num?)?.toInt() ?? 25,
      activityLevel:
          $enumDecodeNullable(_$ActivityLevelEnumMap, json['activityLevel']) ??
              ActivityLevel.lightlyActive,
      customDailyGoal: (json['customDailyGoal'] as num?)?.toInt() ?? 2000,
      useCalculatedGoal: json['useCalculatedGoal'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserSettingsImplToJson(_$UserSettingsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'weight': instance.weight,
      'height': instance.height,
      'age': instance.age,
      'activityLevel': _$ActivityLevelEnumMap[instance.activityLevel]!,
      'customDailyGoal': instance.customDailyGoal,
      'useCalculatedGoal': instance.useCalculatedGoal,
    };

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.lightlyActive: 'lightlyActive',
  ActivityLevel.moderatelyActive: 'moderatelyActive',
  ActivityLevel.veryActive: 'veryActive',
  ActivityLevel.extremelyActive: 'extremelyActive',
};
