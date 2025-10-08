// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  @HiveField(0)
  String get uid => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get displayName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get photoURL => throw _privateConstructorUsedError;
  @HiveField(4)
  int get dailyGoalMl => throw _privateConstructorUsedError;
  @HiveField(5)
  int get reminderIntervalMinutes => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get reminderEnabled => throw _privateConstructorUsedError;
  @HiveField(7)
  String get unit => throw _privateConstructorUsedError;
  @HiveField(8)
  int get age => throw _privateConstructorUsedError;
  @HiveField(9)
  double get weightKg => throw _privateConstructorUsedError;
  @HiveField(10)
  double get heightCm => throw _privateConstructorUsedError;
  @HiveField(11)
  ActivityLevel get activityLevel => throw _privateConstructorUsedError;
  @HiveField(12)
  Gender get gender => throw _privateConstructorUsedError;
  @HiveField(13)
  bool get profileCompleted => throw _privateConstructorUsedError;
  @HiveField(14)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(15)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {@HiveField(0) String uid,
      @HiveField(1) String email,
      @HiveField(2) String? displayName,
      @HiveField(3) String? photoURL,
      @HiveField(4) int dailyGoalMl,
      @HiveField(5) int reminderIntervalMinutes,
      @HiveField(6) bool reminderEnabled,
      @HiveField(7) String unit,
      @HiveField(8) int age,
      @HiveField(9) double weightKg,
      @HiveField(10) double heightCm,
      @HiveField(11) ActivityLevel activityLevel,
      @HiveField(12) Gender gender,
      @HiveField(13) bool profileCompleted,
      @HiveField(14) DateTime? createdAt,
      @HiveField(15) DateTime? updatedAt});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? dailyGoalMl = null,
    Object? reminderIntervalMinutes = null,
    Object? reminderEnabled = null,
    Object? unit = null,
    Object? age = null,
    Object? weightKg = null,
    Object? heightCm = null,
    Object? activityLevel = null,
    Object? gender = null,
    Object? profileCompleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyGoalMl: null == dailyGoalMl
          ? _value.dailyGoalMl
          : dailyGoalMl // ignore: cast_nullable_to_non_nullable
              as int,
      reminderIntervalMinutes: null == reminderIntervalMinutes
          ? _value.reminderIntervalMinutes
          : reminderIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      reminderEnabled: null == reminderEnabled
          ? _value.reminderEnabled
          : reminderEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      weightKg: null == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double,
      heightCm: null == heightCm
          ? _value.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double,
      activityLevel: null == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as ActivityLevel,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      profileCompleted: null == profileCompleted
          ? _value.profileCompleted
          : profileCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String uid,
      @HiveField(1) String email,
      @HiveField(2) String? displayName,
      @HiveField(3) String? photoURL,
      @HiveField(4) int dailyGoalMl,
      @HiveField(5) int reminderIntervalMinutes,
      @HiveField(6) bool reminderEnabled,
      @HiveField(7) String unit,
      @HiveField(8) int age,
      @HiveField(9) double weightKg,
      @HiveField(10) double heightCm,
      @HiveField(11) ActivityLevel activityLevel,
      @HiveField(12) Gender gender,
      @HiveField(13) bool profileCompleted,
      @HiveField(14) DateTime? createdAt,
      @HiveField(15) DateTime? updatedAt});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? dailyGoalMl = null,
    Object? reminderIntervalMinutes = null,
    Object? reminderEnabled = null,
    Object? unit = null,
    Object? age = null,
    Object? weightKg = null,
    Object? heightCm = null,
    Object? activityLevel = null,
    Object? gender = null,
    Object? profileCompleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserProfileImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyGoalMl: null == dailyGoalMl
          ? _value.dailyGoalMl
          : dailyGoalMl // ignore: cast_nullable_to_non_nullable
              as int,
      reminderIntervalMinutes: null == reminderIntervalMinutes
          ? _value.reminderIntervalMinutes
          : reminderIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      reminderEnabled: null == reminderEnabled
          ? _value.reminderEnabled
          : reminderEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      weightKg: null == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double,
      heightCm: null == heightCm
          ? _value.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double,
      activityLevel: null == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as ActivityLevel,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      profileCompleted: null == profileCompleted
          ? _value.profileCompleted
          : profileCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {@HiveField(0) required this.uid,
      @HiveField(1) required this.email,
      @HiveField(2) this.displayName,
      @HiveField(3) this.photoURL,
      @HiveField(4) this.dailyGoalMl = 2000,
      @HiveField(5) this.reminderIntervalMinutes = 60,
      @HiveField(6) this.reminderEnabled = true,
      @HiveField(7) this.unit = 'ml',
      @HiveField(8) this.age = 25,
      @HiveField(9) this.weightKg = 70.0,
      @HiveField(10) this.heightCm = 170.0,
      @HiveField(11) this.activityLevel = ActivityLevel.moderate,
      @HiveField(12) this.gender = Gender.other,
      @HiveField(13) this.profileCompleted = false,
      @HiveField(14) this.createdAt,
      @HiveField(15) this.updatedAt});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  @HiveField(0)
  final String uid;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String? displayName;
  @override
  @HiveField(3)
  final String? photoURL;
  @override
  @JsonKey()
  @HiveField(4)
  final int dailyGoalMl;
  @override
  @JsonKey()
  @HiveField(5)
  final int reminderIntervalMinutes;
  @override
  @JsonKey()
  @HiveField(6)
  final bool reminderEnabled;
  @override
  @JsonKey()
  @HiveField(7)
  final String unit;
  @override
  @JsonKey()
  @HiveField(8)
  final int age;
  @override
  @JsonKey()
  @HiveField(9)
  final double weightKg;
  @override
  @JsonKey()
  @HiveField(10)
  final double heightCm;
  @override
  @JsonKey()
  @HiveField(11)
  final ActivityLevel activityLevel;
  @override
  @JsonKey()
  @HiveField(12)
  final Gender gender;
  @override
  @JsonKey()
  @HiveField(13)
  final bool profileCompleted;
  @override
  @HiveField(14)
  final DateTime? createdAt;
  @override
  @HiveField(15)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserProfile(uid: $uid, email: $email, displayName: $displayName, photoURL: $photoURL, dailyGoalMl: $dailyGoalMl, reminderIntervalMinutes: $reminderIntervalMinutes, reminderEnabled: $reminderEnabled, unit: $unit, age: $age, weightKg: $weightKg, heightCm: $heightCm, activityLevel: $activityLevel, gender: $gender, profileCompleted: $profileCompleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.dailyGoalMl, dailyGoalMl) ||
                other.dailyGoalMl == dailyGoalMl) &&
            (identical(
                    other.reminderIntervalMinutes, reminderIntervalMinutes) ||
                other.reminderIntervalMinutes == reminderIntervalMinutes) &&
            (identical(other.reminderEnabled, reminderEnabled) ||
                other.reminderEnabled == reminderEnabled) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileCompleted, profileCompleted) ||
                other.profileCompleted == profileCompleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      displayName,
      photoURL,
      dailyGoalMl,
      reminderIntervalMinutes,
      reminderEnabled,
      unit,
      age,
      weightKg,
      heightCm,
      activityLevel,
      gender,
      profileCompleted,
      createdAt,
      updatedAt);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {@HiveField(0) required final String uid,
      @HiveField(1) required final String email,
      @HiveField(2) final String? displayName,
      @HiveField(3) final String? photoURL,
      @HiveField(4) final int dailyGoalMl,
      @HiveField(5) final int reminderIntervalMinutes,
      @HiveField(6) final bool reminderEnabled,
      @HiveField(7) final String unit,
      @HiveField(8) final int age,
      @HiveField(9) final double weightKg,
      @HiveField(10) final double heightCm,
      @HiveField(11) final ActivityLevel activityLevel,
      @HiveField(12) final Gender gender,
      @HiveField(13) final bool profileCompleted,
      @HiveField(14) final DateTime? createdAt,
      @HiveField(15) final DateTime? updatedAt}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  @HiveField(0)
  String get uid;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String? get displayName;
  @override
  @HiveField(3)
  String? get photoURL;
  @override
  @HiveField(4)
  int get dailyGoalMl;
  @override
  @HiveField(5)
  int get reminderIntervalMinutes;
  @override
  @HiveField(6)
  bool get reminderEnabled;
  @override
  @HiveField(7)
  String get unit;
  @override
  @HiveField(8)
  int get age;
  @override
  @HiveField(9)
  double get weightKg;
  @override
  @HiveField(10)
  double get heightCm;
  @override
  @HiveField(11)
  ActivityLevel get activityLevel;
  @override
  @HiveField(12)
  Gender get gender;
  @override
  @HiveField(13)
  bool get profileCompleted;
  @override
  @HiveField(14)
  DateTime? get createdAt;
  @override
  @HiveField(15)
  DateTime? get updatedAt;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
