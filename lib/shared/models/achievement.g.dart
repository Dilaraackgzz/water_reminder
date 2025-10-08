// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AchievementAdapter extends TypeAdapter<Achievement> {
  @override
  final int typeId = 4;

  @override
  Achievement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Achievement(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      iconName: fields[3] as String,
      type: fields[4] as AchievementType,
      targetValue: fields[5] as int,
      currentValue: fields[6] as int,
      isUnlocked: fields[7] as bool,
      unlockedAt: fields[8] as DateTime?,
      rewardPoints: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Achievement obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.iconName)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.targetValue)
      ..writeByte(6)
      ..write(obj.currentValue)
      ..writeByte(7)
      ..write(obj.isUnlocked)
      ..writeByte(8)
      ..write(obj.unlockedAt)
      ..writeByte(9)
      ..write(obj.rewardPoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AchievementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AchievementTypeAdapter extends TypeAdapter<AchievementType> {
  @override
  final int typeId = 5;

  @override
  AchievementType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AchievementType.dailyGoal;
      case 1:
        return AchievementType.streak;
      case 2:
        return AchievementType.totalConsumption;
      case 3:
        return AchievementType.consistency;
      case 4:
        return AchievementType.milestone;
      default:
        return AchievementType.dailyGoal;
    }
  }

  @override
  void write(BinaryWriter writer, AchievementType obj) {
    switch (obj) {
      case AchievementType.dailyGoal:
        writer.writeByte(0);
        break;
      case AchievementType.streak:
        writer.writeByte(1);
        break;
      case AchievementType.totalConsumption:
        writer.writeByte(2);
        break;
      case AchievementType.consistency:
        writer.writeByte(3);
        break;
      case AchievementType.milestone:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AchievementTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconName: json['iconName'] as String,
      type: $enumDecode(_$AchievementTypeEnumMap, json['type']),
      targetValue: (json['targetValue'] as num).toInt(),
      currentValue: (json['currentValue'] as num?)?.toInt() ?? 0,
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
      rewardPoints: (json['rewardPoints'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'iconName': instance.iconName,
      'type': _$AchievementTypeEnumMap[instance.type]!,
      'targetValue': instance.targetValue,
      'currentValue': instance.currentValue,
      'isUnlocked': instance.isUnlocked,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
      'rewardPoints': instance.rewardPoints,
    };

const _$AchievementTypeEnumMap = {
  AchievementType.dailyGoal: 'dailyGoal',
  AchievementType.streak: 'streak',
  AchievementType.totalConsumption: 'totalConsumption',
  AchievementType.consistency: 'consistency',
  AchievementType.milestone: 'milestone',
};
