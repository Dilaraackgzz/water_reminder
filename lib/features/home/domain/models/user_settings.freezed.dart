// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  String get userId => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError; // Weight in kg
  double get height => throw _privateConstructorUsedError; // Height in cm
  int get age => throw _privateConstructorUsedError;
  ActivityLevel get activityLevel => throw _privateConstructorUsedError;
  int get customDailyGoal =>
      throw _privateConstructorUsedError; // Custom daily goal in ml
  bool get useCalculatedGoal => throw _privateConstructorUsedError;

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call(
      {String userId,
      double weight,
      double height,
      int age,
      ActivityLevel activityLevel,
      int customDailyGoal,
      bool useCalculatedGoal});
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? weight = null,
    Object? height = null,
    Object? age = null,
    Object? activityLevel = null,
    Object? customDailyGoal = null,
    Object? useCalculatedGoal = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      activityLevel: null == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as ActivityLevel,
      customDailyGoal: null == customDailyGoal
          ? _value.customDailyGoal
          : customDailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      useCalculatedGoal: null == useCalculatedGoal
          ? _value.useCalculatedGoal
          : useCalculatedGoal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
          _$UserSettingsImpl value, $Res Function(_$UserSettingsImpl) then) =
      __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      double weight,
      double height,
      int age,
      ActivityLevel activityLevel,
      int customDailyGoal,
      bool useCalculatedGoal});
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
      _$UserSettingsImpl _value, $Res Function(_$UserSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? weight = null,
    Object? height = null,
    Object? age = null,
    Object? activityLevel = null,
    Object? customDailyGoal = null,
    Object? useCalculatedGoal = null,
  }) {
    return _then(_$UserSettingsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      activityLevel: null == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as ActivityLevel,
      customDailyGoal: null == customDailyGoal
          ? _value.customDailyGoal
          : customDailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      useCalculatedGoal: null == useCalculatedGoal
          ? _value.useCalculatedGoal
          : useCalculatedGoal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsImpl implements _UserSettings {
  const _$UserSettingsImpl(
      {required this.userId,
      this.weight = 70.0,
      this.height = 170.0,
      this.age = 25,
      this.activityLevel = ActivityLevel.lightlyActive,
      this.customDailyGoal = 2000,
      this.useCalculatedGoal = true});

  factory _$UserSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final double weight;
// Weight in kg
  @override
  @JsonKey()
  final double height;
// Height in cm
  @override
  @JsonKey()
  final int age;
  @override
  @JsonKey()
  final ActivityLevel activityLevel;
  @override
  @JsonKey()
  final int customDailyGoal;
// Custom daily goal in ml
  @override
  @JsonKey()
  final bool useCalculatedGoal;

  @override
  String toString() {
    return 'UserSettings(userId: $userId, weight: $weight, height: $height, age: $age, activityLevel: $activityLevel, customDailyGoal: $customDailyGoal, useCalculatedGoal: $useCalculatedGoal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            (identical(other.customDailyGoal, customDailyGoal) ||
                other.customDailyGoal == customDailyGoal) &&
            (identical(other.useCalculatedGoal, useCalculatedGoal) ||
                other.useCalculatedGoal == useCalculatedGoal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, weight, height, age,
      activityLevel, customDailyGoal, useCalculatedGoal);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsImplToJson(
      this,
    );
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings(
      {required final String userId,
      final double weight,
      final double height,
      final int age,
      final ActivityLevel activityLevel,
      final int customDailyGoal,
      final bool useCalculatedGoal}) = _$UserSettingsImpl;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$UserSettingsImpl.fromJson;

  @override
  String get userId;
  @override
  double get weight; // Weight in kg
  @override
  double get height; // Height in cm
  @override
  int get age;
  @override
  ActivityLevel get activityLevel;
  @override
  int get customDailyGoal; // Custom daily goal in ml
  @override
  bool get useCalculatedGoal;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
