// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      activityLevel: $enumDecode(_$ActivityLevelEnumMap, json['activityLevel']),
      dailyGoal: (json['dailyGoal'] as num).toInt(),
      isCustomGoal: json['isCustomGoal'] as bool? ?? false,
      photoUrl: json['photoUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'gender': _$GenderEnumMap[instance.gender]!,
      'activityLevel': _$ActivityLevelEnumMap[instance.activityLevel]!,
      'dailyGoal': instance.dailyGoal,
      'isCustomGoal': instance.isCustomGoal,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.light: 'light',
  ActivityLevel.moderate: 'moderate',
  ActivityLevel.active: 'active',
  ActivityLevel.veryActive: 'veryActive',
};
