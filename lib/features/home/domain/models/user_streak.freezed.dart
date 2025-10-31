// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_streak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStreak _$UserStreakFromJson(Map<String, dynamic> json) {
  return _UserStreak.fromJson(json);
}

/// @nodoc
mixin _$UserStreak {
  String get userId => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  DateTime get lastCheckDate => throw _privateConstructorUsedError;
  DateTime get streakStartDate => throw _privateConstructorUsedError;
  List<DateTime> get completedDates => throw _privateConstructorUsedError;

  /// Serializes this UserStreak to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStreak
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStreakCopyWith<UserStreak> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStreakCopyWith<$Res> {
  factory $UserStreakCopyWith(
          UserStreak value, $Res Function(UserStreak) then) =
      _$UserStreakCopyWithImpl<$Res, UserStreak>;
  @useResult
  $Res call(
      {String userId,
      int currentStreak,
      int longestStreak,
      DateTime lastCheckDate,
      DateTime streakStartDate,
      List<DateTime> completedDates});
}

/// @nodoc
class _$UserStreakCopyWithImpl<$Res, $Val extends UserStreak>
    implements $UserStreakCopyWith<$Res> {
  _$UserStreakCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStreak
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastCheckDate = null,
    Object? streakStartDate = null,
    Object? completedDates = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheckDate: null == lastCheckDate
          ? _value.lastCheckDate
          : lastCheckDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakStartDate: null == streakStartDate
          ? _value.streakStartDate
          : streakStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedDates: null == completedDates
          ? _value.completedDates
          : completedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStreakImplCopyWith<$Res>
    implements $UserStreakCopyWith<$Res> {
  factory _$$UserStreakImplCopyWith(
          _$UserStreakImpl value, $Res Function(_$UserStreakImpl) then) =
      __$$UserStreakImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int currentStreak,
      int longestStreak,
      DateTime lastCheckDate,
      DateTime streakStartDate,
      List<DateTime> completedDates});
}

/// @nodoc
class __$$UserStreakImplCopyWithImpl<$Res>
    extends _$UserStreakCopyWithImpl<$Res, _$UserStreakImpl>
    implements _$$UserStreakImplCopyWith<$Res> {
  __$$UserStreakImplCopyWithImpl(
      _$UserStreakImpl _value, $Res Function(_$UserStreakImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStreak
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastCheckDate = null,
    Object? streakStartDate = null,
    Object? completedDates = null,
  }) {
    return _then(_$UserStreakImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheckDate: null == lastCheckDate
          ? _value.lastCheckDate
          : lastCheckDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakStartDate: null == streakStartDate
          ? _value.streakStartDate
          : streakStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedDates: null == completedDates
          ? _value._completedDates
          : completedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStreakImpl implements _UserStreak {
  const _$UserStreakImpl(
      {required this.userId,
      required this.currentStreak,
      required this.longestStreak,
      required this.lastCheckDate,
      required this.streakStartDate,
      final List<DateTime> completedDates = const []})
      : _completedDates = completedDates;

  factory _$UserStreakImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStreakImplFromJson(json);

  @override
  final String userId;
  @override
  final int currentStreak;
  @override
  final int longestStreak;
  @override
  final DateTime lastCheckDate;
  @override
  final DateTime streakStartDate;
  final List<DateTime> _completedDates;
  @override
  @JsonKey()
  List<DateTime> get completedDates {
    if (_completedDates is EqualUnmodifiableListView) return _completedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedDates);
  }

  @override
  String toString() {
    return 'UserStreak(userId: $userId, currentStreak: $currentStreak, longestStreak: $longestStreak, lastCheckDate: $lastCheckDate, streakStartDate: $streakStartDate, completedDates: $completedDates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStreakImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.lastCheckDate, lastCheckDate) ||
                other.lastCheckDate == lastCheckDate) &&
            (identical(other.streakStartDate, streakStartDate) ||
                other.streakStartDate == streakStartDate) &&
            const DeepCollectionEquality()
                .equals(other._completedDates, _completedDates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      currentStreak,
      longestStreak,
      lastCheckDate,
      streakStartDate,
      const DeepCollectionEquality().hash(_completedDates));

  /// Create a copy of UserStreak
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStreakImplCopyWith<_$UserStreakImpl> get copyWith =>
      __$$UserStreakImplCopyWithImpl<_$UserStreakImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStreakImplToJson(
      this,
    );
  }
}

abstract class _UserStreak implements UserStreak {
  const factory _UserStreak(
      {required final String userId,
      required final int currentStreak,
      required final int longestStreak,
      required final DateTime lastCheckDate,
      required final DateTime streakStartDate,
      final List<DateTime> completedDates}) = _$UserStreakImpl;

  factory _UserStreak.fromJson(Map<String, dynamic> json) =
      _$UserStreakImpl.fromJson;

  @override
  String get userId;
  @override
  int get currentStreak;
  @override
  int get longestStreak;
  @override
  DateTime get lastCheckDate;
  @override
  DateTime get streakStartDate;
  @override
  List<DateTime> get completedDates;

  /// Create a copy of UserStreak
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStreakImplCopyWith<_$UserStreakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
