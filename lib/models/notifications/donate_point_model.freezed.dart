// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donate_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DonatePointModel _$DonatePointModelFromJson(Map<String, dynamic> json) {
  return _DonatePointModel.fromJson(json);
}

/// @nodoc
mixin _$DonatePointModel {
  int get id => throw _privateConstructorUsedError;
  double get points => throw _privateConstructorUsedError;
  String get donationLocation => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonatePointModelCopyWith<DonatePointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonatePointModelCopyWith<$Res> {
  factory $DonatePointModelCopyWith(
          DonatePointModel value, $Res Function(DonatePointModel) then) =
      _$DonatePointModelCopyWithImpl<$Res, DonatePointModel>;
  @useResult
  $Res call(
      {int id,
      double points,
      String donationLocation,
      int userId,
      DateTime createdAt});
}

/// @nodoc
class _$DonatePointModelCopyWithImpl<$Res, $Val extends DonatePointModel>
    implements $DonatePointModelCopyWith<$Res> {
  _$DonatePointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? donationLocation = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double,
      donationLocation: null == donationLocation
          ? _value.donationLocation
          : donationLocation // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DonatePointModelImplCopyWith<$Res>
    implements $DonatePointModelCopyWith<$Res> {
  factory _$$DonatePointModelImplCopyWith(_$DonatePointModelImpl value,
          $Res Function(_$DonatePointModelImpl) then) =
      __$$DonatePointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double points,
      String donationLocation,
      int userId,
      DateTime createdAt});
}

/// @nodoc
class __$$DonatePointModelImplCopyWithImpl<$Res>
    extends _$DonatePointModelCopyWithImpl<$Res, _$DonatePointModelImpl>
    implements _$$DonatePointModelImplCopyWith<$Res> {
  __$$DonatePointModelImplCopyWithImpl(_$DonatePointModelImpl _value,
      $Res Function(_$DonatePointModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? donationLocation = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_$DonatePointModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double,
      donationLocation: null == donationLocation
          ? _value.donationLocation
          : donationLocation // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DonatePointModelImpl
    with DiagnosticableTreeMixin
    implements _DonatePointModel {
  const _$DonatePointModelImpl(
      {required this.id,
      required this.points,
      required this.donationLocation,
      required this.userId,
      required this.createdAt});

  factory _$DonatePointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DonatePointModelImplFromJson(json);

  @override
  final int id;
  @override
  final double points;
  @override
  final String donationLocation;
  @override
  final int userId;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DonatePointModel(id: $id, points: $points, donationLocation: $donationLocation, userId: $userId, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DonatePointModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('donationLocation', donationLocation))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DonatePointModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.donationLocation, donationLocation) ||
                other.donationLocation == donationLocation) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, points, donationLocation, userId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DonatePointModelImplCopyWith<_$DonatePointModelImpl> get copyWith =>
      __$$DonatePointModelImplCopyWithImpl<_$DonatePointModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DonatePointModelImplToJson(
      this,
    );
  }
}

abstract class _DonatePointModel implements DonatePointModel {
  const factory _DonatePointModel(
      {required final int id,
      required final double points,
      required final String donationLocation,
      required final int userId,
      required final DateTime createdAt}) = _$DonatePointModelImpl;

  factory _DonatePointModel.fromJson(Map<String, dynamic> json) =
      _$DonatePointModelImpl.fromJson;

  @override
  int get id;
  @override
  double get points;
  @override
  String get donationLocation;
  @override
  int get userId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DonatePointModelImplCopyWith<_$DonatePointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
