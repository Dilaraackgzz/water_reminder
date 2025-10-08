// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailySummary _$DailySummaryFromJson(Map<String, dynamic> json) {
  return _DailySummary.fromJson(json);
}

/// @nodoc
mixin _$DailySummary {
  DateTime get date => throw _privateConstructorUsedError;
  int get totalMl => throw _privateConstructorUsedError;
  int get goalMl => throw _privateConstructorUsedError;
  List<String> get recordIds => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  bool get goalAchieved => throw _privateConstructorUsedError;

  /// Serializes this DailySummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySummaryCopyWith<DailySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySummaryCopyWith<$Res> {
  factory $DailySummaryCopyWith(
          DailySummary value, $Res Function(DailySummary) then) =
      _$DailySummaryCopyWithImpl<$Res, DailySummary>;
  @useResult
  $Res call(
      {DateTime date,
      int totalMl,
      int goalMl,
      List<String> recordIds,
      int streakDays,
      bool goalAchieved});
}

/// @nodoc
class _$DailySummaryCopyWithImpl<$Res, $Val extends DailySummary>
    implements $DailySummaryCopyWith<$Res> {
  _$DailySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalMl = null,
    Object? goalMl = null,
    Object? recordIds = null,
    Object? streakDays = null,
    Object? goalAchieved = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalMl: null == totalMl
          ? _value.totalMl
          : totalMl // ignore: cast_nullable_to_non_nullable
              as int,
      goalMl: null == goalMl
          ? _value.goalMl
          : goalMl // ignore: cast_nullable_to_non_nullable
              as int,
      recordIds: null == recordIds
          ? _value.recordIds
          : recordIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      goalAchieved: null == goalAchieved
          ? _value.goalAchieved
          : goalAchieved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailySummaryImplCopyWith<$Res>
    implements $DailySummaryCopyWith<$Res> {
  factory _$$DailySummaryImplCopyWith(
          _$DailySummaryImpl value, $Res Function(_$DailySummaryImpl) then) =
      __$$DailySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int totalMl,
      int goalMl,
      List<String> recordIds,
      int streakDays,
      bool goalAchieved});
}

/// @nodoc
class __$$DailySummaryImplCopyWithImpl<$Res>
    extends _$DailySummaryCopyWithImpl<$Res, _$DailySummaryImpl>
    implements _$$DailySummaryImplCopyWith<$Res> {
  __$$DailySummaryImplCopyWithImpl(
      _$DailySummaryImpl _value, $Res Function(_$DailySummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalMl = null,
    Object? goalMl = null,
    Object? recordIds = null,
    Object? streakDays = null,
    Object? goalAchieved = null,
  }) {
    return _then(_$DailySummaryImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalMl: null == totalMl
          ? _value.totalMl
          : totalMl // ignore: cast_nullable_to_non_nullable
              as int,
      goalMl: null == goalMl
          ? _value.goalMl
          : goalMl // ignore: cast_nullable_to_non_nullable
              as int,
      recordIds: null == recordIds
          ? _value._recordIds
          : recordIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      goalAchieved: null == goalAchieved
          ? _value.goalAchieved
          : goalAchieved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailySummaryImpl implements _DailySummary {
  const _$DailySummaryImpl(
      {required this.date,
      required this.totalMl,
      required this.goalMl,
      required final List<String> recordIds,
      this.streakDays = 0,
      this.goalAchieved = false})
      : _recordIds = recordIds;

  factory _$DailySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailySummaryImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int totalMl;
  @override
  final int goalMl;
  final List<String> _recordIds;
  @override
  List<String> get recordIds {
    if (_recordIds is EqualUnmodifiableListView) return _recordIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordIds);
  }

  @override
  @JsonKey()
  final int streakDays;
  @override
  @JsonKey()
  final bool goalAchieved;

  @override
  String toString() {
    return 'DailySummary(date: $date, totalMl: $totalMl, goalMl: $goalMl, recordIds: $recordIds, streakDays: $streakDays, goalAchieved: $goalAchieved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySummaryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalMl, totalMl) || other.totalMl == totalMl) &&
            (identical(other.goalMl, goalMl) || other.goalMl == goalMl) &&
            const DeepCollectionEquality()
                .equals(other._recordIds, _recordIds) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.goalAchieved, goalAchieved) ||
                other.goalAchieved == goalAchieved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      totalMl,
      goalMl,
      const DeepCollectionEquality().hash(_recordIds),
      streakDays,
      goalAchieved);

  /// Create a copy of DailySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySummaryImplCopyWith<_$DailySummaryImpl> get copyWith =>
      __$$DailySummaryImplCopyWithImpl<_$DailySummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailySummaryImplToJson(
      this,
    );
  }
}

abstract class _DailySummary implements DailySummary {
  const factory _DailySummary(
      {required final DateTime date,
      required final int totalMl,
      required final int goalMl,
      required final List<String> recordIds,
      final int streakDays,
      final bool goalAchieved}) = _$DailySummaryImpl;

  factory _DailySummary.fromJson(Map<String, dynamic> json) =
      _$DailySummaryImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get totalMl;
  @override
  int get goalMl;
  @override
  List<String> get recordIds;
  @override
  int get streakDays;
  @override
  bool get goalAchieved;

  /// Create a copy of DailySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySummaryImplCopyWith<_$DailySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
