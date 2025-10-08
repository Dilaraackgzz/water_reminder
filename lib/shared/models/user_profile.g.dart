// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileAdapter extends TypeAdapter<UserProfile> {
  @override
  final int typeId = 1;

  @override
  UserProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfile(
      uid: fields[0] as String,
      email: fields[1] as String,
      displayName: fields[2] as String?,
      photoURL: fields[3] as String?,
      dailyGoalMl: fields[4] as int,
      reminderIntervalMinutes: fields[5] as int,
      reminderEnabled: fields[6] as bool,
      unit: fields[7] as String,
      age: fields[8] as int,
      weightKg: fields[9] as double,
      heightCm: fields[10] as double,
      activityLevel: fields[11] as ActivityLevel,
      gender: fields[12] as Gender,
      profileCompleted: fields[13] as bool,
      createdAt: fields[14] as DateTime?,
      updatedAt: fields[15] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.photoURL)
      ..writeByte(4)
      ..write(obj.dailyGoalMl)
      ..writeByte(5)
      ..write(obj.reminderIntervalMinutes)
      ..writeByte(6)
      ..write(obj.reminderEnabled)
      ..writeByte(7)
      ..write(obj.unit)
      ..writeByte(8)
      ..write(obj.age)
      ..writeByte(9)
      ..write(obj.weightKg)
      ..writeByte(10)
      ..write(obj.heightCm)
      ..writeByte(11)
      ..write(obj.activityLevel)
      ..writeByte(12)
      ..write(obj.gender)
      ..writeByte(13)
      ..write(obj.profileCompleted)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActivityLevelAdapter extends TypeAdapter<ActivityLevel> {
  @override
  final int typeId = 2;

  @override
  ActivityLevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActivityLevel.sedentary;
      case 1:
        return ActivityLevel.light;
      case 2:
        return ActivityLevel.moderate;
      case 3:
        return ActivityLevel.active;
      case 4:
        return ActivityLevel.veryActive;
      default:
        return ActivityLevel.sedentary;
    }
  }

  @override
  void write(BinaryWriter writer, ActivityLevel obj) {
    switch (obj) {
      case ActivityLevel.sedentary:
        writer.writeByte(0);
        break;
      case ActivityLevel.light:
        writer.writeByte(1);
        break;
      case ActivityLevel.moderate:
        writer.writeByte(2);
        break;
      case ActivityLevel.active:
        writer.writeByte(3);
        break;
      case ActivityLevel.veryActive:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 3;

  @override
  Gender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Gender.male;
      case 1:
        return Gender.female;
      case 2:
        return Gender.other;
      default:
        return Gender.male;
    }
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    switch (obj) {
      case Gender.male:
        writer.writeByte(0);
        break;
      case Gender.female:
        writer.writeByte(1);
        break;
      case Gender.other:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      dailyGoalMl: (json['dailyGoalMl'] as num?)?.toInt() ?? 2000,
      reminderIntervalMinutes:
          (json['reminderIntervalMinutes'] as num?)?.toInt() ?? 60,
      reminderEnabled: json['reminderEnabled'] as bool? ?? true,
      unit: json['unit'] as String? ?? 'ml',
      age: (json['age'] as num?)?.toInt() ?? 25,
      weightKg: (json['weightKg'] as num?)?.toDouble() ?? 70.0,
      heightCm: (json['heightCm'] as num?)?.toDouble() ?? 170.0,
      activityLevel:
          $enumDecodeNullable(_$ActivityLevelEnumMap, json['activityLevel']) ??
              ActivityLevel.moderate,
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.other,
      profileCompleted: json['profileCompleted'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'dailyGoalMl': instance.dailyGoalMl,
      'reminderIntervalMinutes': instance.reminderIntervalMinutes,
      'reminderEnabled': instance.reminderEnabled,
      'unit': instance.unit,
      'age': instance.age,
      'weightKg': instance.weightKg,
      'heightCm': instance.heightCm,
      'activityLevel': _$ActivityLevelEnumMap[instance.activityLevel]!,
      'gender': _$GenderEnumMap[instance.gender]!,
      'profileCompleted': instance.profileCompleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.light: 'light',
  ActivityLevel.moderate: 'moderate',
  ActivityLevel.active: 'active',
  ActivityLevel.veryActive: 'veryActive',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};
