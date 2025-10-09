// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_intake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WaterIntake _$WaterIntakeFromJson(Map<String, dynamic> json) {
  return _WaterIntake.fromJson(json);
}

/// @nodoc
mixin _$WaterIntake {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError; // Amount in ml
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this WaterIntake to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WaterIntake
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaterIntakeCopyWith<WaterIntake> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaterIntakeCopyWith<$Res> {
  factory $WaterIntakeCopyWith(
          WaterIntake value, $Res Function(WaterIntake) then) =
      _$WaterIntakeCopyWithImpl<$Res, WaterIntake>;
  @useResult
  $Res call(
      {String id, String userId, int amount, DateTime timestamp, String? note});
}

/// @nodoc
class _$WaterIntakeCopyWithImpl<$Res, $Val extends WaterIntake>
    implements $WaterIntakeCopyWith<$Res> {
  _$WaterIntakeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaterIntake
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? timestamp = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaterIntakeImplCopyWith<$Res>
    implements $WaterIntakeCopyWith<$Res> {
  factory _$$WaterIntakeImplCopyWith(
          _$WaterIntakeImpl value, $Res Function(_$WaterIntakeImpl) then) =
      __$$WaterIntakeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String userId, int amount, DateTime timestamp, String? note});
}

/// @nodoc
class __$$WaterIntakeImplCopyWithImpl<$Res>
    extends _$WaterIntakeCopyWithImpl<$Res, _$WaterIntakeImpl>
    implements _$$WaterIntakeImplCopyWith<$Res> {
  __$$WaterIntakeImplCopyWithImpl(
      _$WaterIntakeImpl _value, $Res Function(_$WaterIntakeImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaterIntake
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? timestamp = null,
    Object? note = freezed,
  }) {
    return _then(_$WaterIntakeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaterIntakeImpl implements _WaterIntake {
  const _$WaterIntakeImpl(
      {required this.id,
      required this.userId,
      required this.amount,
      required this.timestamp,
      this.note});

  factory _$WaterIntakeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaterIntakeImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final int amount;
// Amount in ml
  @override
  final DateTime timestamp;
  @override
  final String? note;

  @override
  String toString() {
    return 'WaterIntake(id: $id, userId: $userId, amount: $amount, timestamp: $timestamp, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaterIntakeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, amount, timestamp, note);

  /// Create a copy of WaterIntake
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaterIntakeImplCopyWith<_$WaterIntakeImpl> get copyWith =>
      __$$WaterIntakeImplCopyWithImpl<_$WaterIntakeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaterIntakeImplToJson(
      this,
    );
  }
}

abstract class _WaterIntake implements WaterIntake {
  const factory _WaterIntake(
      {required final String id,
      required final String userId,
      required final int amount,
      required final DateTime timestamp,
      final String? note}) = _$WaterIntakeImpl;

  factory _WaterIntake.fromJson(Map<String, dynamic> json) =
      _$WaterIntakeImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  int get amount; // Amount in ml
  @override
  DateTime get timestamp;
  @override
  String? get note;

  /// Create a copy of WaterIntake
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaterIntakeImplCopyWith<_$WaterIntakeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
