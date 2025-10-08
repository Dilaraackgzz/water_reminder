// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WaterRecord _$WaterRecordFromJson(Map<String, dynamic> json) {
  return _WaterRecord.fromJson(json);
}

/// @nodoc
mixin _$WaterRecord {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get amountMl => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get timestamp => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(4)
  String get type => throw _privateConstructorUsedError;

  /// Serializes this WaterRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WaterRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaterRecordCopyWith<WaterRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaterRecordCopyWith<$Res> {
  factory $WaterRecordCopyWith(
          WaterRecord value, $Res Function(WaterRecord) then) =
      _$WaterRecordCopyWithImpl<$Res, WaterRecord>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) int amountMl,
      @HiveField(2) DateTime timestamp,
      @HiveField(3) String? note,
      @HiveField(4) String type});
}

/// @nodoc
class _$WaterRecordCopyWithImpl<$Res, $Val extends WaterRecord>
    implements $WaterRecordCopyWith<$Res> {
  _$WaterRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaterRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amountMl = null,
    Object? timestamp = null,
    Object? note = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amountMl: null == amountMl
          ? _value.amountMl
          : amountMl // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaterRecordImplCopyWith<$Res>
    implements $WaterRecordCopyWith<$Res> {
  factory _$$WaterRecordImplCopyWith(
          _$WaterRecordImpl value, $Res Function(_$WaterRecordImpl) then) =
      __$$WaterRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) int amountMl,
      @HiveField(2) DateTime timestamp,
      @HiveField(3) String? note,
      @HiveField(4) String type});
}

/// @nodoc
class __$$WaterRecordImplCopyWithImpl<$Res>
    extends _$WaterRecordCopyWithImpl<$Res, _$WaterRecordImpl>
    implements _$$WaterRecordImplCopyWith<$Res> {
  __$$WaterRecordImplCopyWithImpl(
      _$WaterRecordImpl _value, $Res Function(_$WaterRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaterRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amountMl = null,
    Object? timestamp = null,
    Object? note = freezed,
    Object? type = null,
  }) {
    return _then(_$WaterRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amountMl: null == amountMl
          ? _value.amountMl
          : amountMl // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaterRecordImpl implements _WaterRecord {
  const _$WaterRecordImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.amountMl,
      @HiveField(2) required this.timestamp,
      @HiveField(3) this.note,
      @HiveField(4) this.type = 'glass'});

  factory _$WaterRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaterRecordImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final int amountMl;
  @override
  @HiveField(2)
  final DateTime timestamp;
  @override
  @HiveField(3)
  final String? note;
  @override
  @JsonKey()
  @HiveField(4)
  final String type;

  @override
  String toString() {
    return 'WaterRecord(id: $id, amountMl: $amountMl, timestamp: $timestamp, note: $note, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaterRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amountMl, amountMl) ||
                other.amountMl == amountMl) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, amountMl, timestamp, note, type);

  /// Create a copy of WaterRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaterRecordImplCopyWith<_$WaterRecordImpl> get copyWith =>
      __$$WaterRecordImplCopyWithImpl<_$WaterRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaterRecordImplToJson(
      this,
    );
  }
}

abstract class _WaterRecord implements WaterRecord {
  const factory _WaterRecord(
      {@HiveField(0) required final String id,
      @HiveField(1) required final int amountMl,
      @HiveField(2) required final DateTime timestamp,
      @HiveField(3) final String? note,
      @HiveField(4) final String type}) = _$WaterRecordImpl;

  factory _WaterRecord.fromJson(Map<String, dynamic> json) =
      _$WaterRecordImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  int get amountMl;
  @override
  @HiveField(2)
  DateTime get timestamp;
  @override
  @HiveField(3)
  String? get note;
  @override
  @HiveField(4)
  String get type;

  /// Create a copy of WaterRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaterRecordImplCopyWith<_$WaterRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
