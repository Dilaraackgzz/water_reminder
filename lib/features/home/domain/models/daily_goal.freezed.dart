// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyGoal _$DailyGoalFromJson(Map<String, dynamic> json) {
  return _DailyGoal.fromJson(json);
}

/// @nodoc
mixin _$DailyGoal {
  String get userId => throw _privateConstructorUsedError;
  int get targetAmount =>
      throw _privateConstructorUsedError; // Target amount in ml
  DateTime get date => throw _privateConstructorUsedError;
  int get currentAmount => throw _privateConstructorUsedError;

  /// Serializes this DailyGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyGoalCopyWith<DailyGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyGoalCopyWith<$Res> {
  factory $DailyGoalCopyWith(DailyGoal value, $Res Function(DailyGoal) then) =
      _$DailyGoalCopyWithImpl<$Res, DailyGoal>;
  @useResult
  $Res call(
      {String userId, int targetAmount, DateTime date, int currentAmount});
}

/// @nodoc
class _$DailyGoalCopyWithImpl<$Res, $Val extends DailyGoal>
    implements $DailyGoalCopyWith<$Res> {
  _$DailyGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? targetAmount = null,
    Object? date = null,
    Object? currentAmount = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetAmount: null == targetAmount
          ? _value.targetAmount
          : targetAmount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentAmount: null == currentAmount
          ? _value.currentAmount
          : currentAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyGoalImplCopyWith<$Res>
    implements $DailyGoalCopyWith<$Res> {
  factory _$$DailyGoalImplCopyWith(
          _$DailyGoalImpl value, $Res Function(_$DailyGoalImpl) then) =
      __$$DailyGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId, int targetAmount, DateTime date, int currentAmount});
}

/// @nodoc
class __$$DailyGoalImplCopyWithImpl<$Res>
    extends _$DailyGoalCopyWithImpl<$Res, _$DailyGoalImpl>
    implements _$$DailyGoalImplCopyWith<$Res> {
  __$$DailyGoalImplCopyWithImpl(
      _$DailyGoalImpl _value, $Res Function(_$DailyGoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? targetAmount = null,
    Object? date = null,
    Object? currentAmount = null,
  }) {
    return _then(_$DailyGoalImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetAmount: null == targetAmount
          ? _value.targetAmount
          : targetAmount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentAmount: null == currentAmount
          ? _value.currentAmount
          : currentAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyGoalImpl implements _DailyGoal {
  const _$DailyGoalImpl(
      {required this.userId,
      required this.targetAmount,
      required this.date,
      this.currentAmount = 0});

  factory _$DailyGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyGoalImplFromJson(json);

  @override
  final String userId;
  @override
  final int targetAmount;
// Target amount in ml
  @override
  final DateTime date;
  @override
  @JsonKey()
  final int currentAmount;

  @override
  String toString() {
    return 'DailyGoal(userId: $userId, targetAmount: $targetAmount, date: $date, currentAmount: $currentAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyGoalImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetAmount, targetAmount) ||
                other.targetAmount == targetAmount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.currentAmount, currentAmount) ||
                other.currentAmount == currentAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, targetAmount, date, currentAmount);

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyGoalImplCopyWith<_$DailyGoalImpl> get copyWith =>
      __$$DailyGoalImplCopyWithImpl<_$DailyGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyGoalImplToJson(
      this,
    );
  }
}

abstract class _DailyGoal implements DailyGoal {
  const factory _DailyGoal(
      {required final String userId,
      required final int targetAmount,
      required final DateTime date,
      final int currentAmount}) = _$DailyGoalImpl;

  factory _DailyGoal.fromJson(Map<String, dynamic> json) =
      _$DailyGoalImpl.fromJson;

  @override
  String get userId;
  @override
  int get targetAmount; // Target amount in ml
  @override
  DateTime get date;
  @override
  int get currentAmount;

  /// Create a copy of DailyGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyGoalImplCopyWith<_$DailyGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
