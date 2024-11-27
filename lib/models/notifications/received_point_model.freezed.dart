// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'received_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceivedPointModel _$ReceivedPointModelFromJson(Map<String, dynamic> json) {
  return _ReceivedPointModel.fromJson(json);
}

/// @nodoc
mixin _$ReceivedPointModel {
  int get id => throw _privateConstructorUsedError;
  double get points => throw _privateConstructorUsedError;
  String get exchangePointLocation => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceivedPointModelCopyWith<ReceivedPointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedPointModelCopyWith<$Res> {
  factory $ReceivedPointModelCopyWith(
          ReceivedPointModel value, $Res Function(ReceivedPointModel) then) =
      _$ReceivedPointModelCopyWithImpl<$Res, ReceivedPointModel>;
  @useResult
  $Res call(
      {int id,
      double points,
      String exchangePointLocation,
      int userId,
      DateTime createdAt});
}

/// @nodoc
class _$ReceivedPointModelCopyWithImpl<$Res, $Val extends ReceivedPointModel>
    implements $ReceivedPointModelCopyWith<$Res> {
  _$ReceivedPointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? exchangePointLocation = null,
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
      exchangePointLocation: null == exchangePointLocation
          ? _value.exchangePointLocation
          : exchangePointLocation // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ReceivedPointModelImplCopyWith<$Res>
    implements $ReceivedPointModelCopyWith<$Res> {
  factory _$$ReceivedPointModelImplCopyWith(_$ReceivedPointModelImpl value,
          $Res Function(_$ReceivedPointModelImpl) then) =
      __$$ReceivedPointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double points,
      String exchangePointLocation,
      int userId,
      DateTime createdAt});
}

/// @nodoc
class __$$ReceivedPointModelImplCopyWithImpl<$Res>
    extends _$ReceivedPointModelCopyWithImpl<$Res, _$ReceivedPointModelImpl>
    implements _$$ReceivedPointModelImplCopyWith<$Res> {
  __$$ReceivedPointModelImplCopyWithImpl(_$ReceivedPointModelImpl _value,
      $Res Function(_$ReceivedPointModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? exchangePointLocation = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_$ReceivedPointModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double,
      exchangePointLocation: null == exchangePointLocation
          ? _value.exchangePointLocation
          : exchangePointLocation // ignore: cast_nullable_to_non_nullable
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
class _$ReceivedPointModelImpl
    with DiagnosticableTreeMixin
    implements _ReceivedPointModel {
  const _$ReceivedPointModelImpl(
      {required this.id,
      required this.points,
      required this.exchangePointLocation,
      required this.userId,
      required this.createdAt});

  factory _$ReceivedPointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceivedPointModelImplFromJson(json);

  @override
  final int id;
  @override
  final double points;
  @override
  final String exchangePointLocation;
  @override
  final int userId;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReceivedPointModel(id: $id, points: $points, exchangePointLocation: $exchangePointLocation, userId: $userId, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReceivedPointModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('exchangePointLocation', exchangePointLocation))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivedPointModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.exchangePointLocation, exchangePointLocation) ||
                other.exchangePointLocation == exchangePointLocation) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, points, exchangePointLocation, userId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivedPointModelImplCopyWith<_$ReceivedPointModelImpl> get copyWith =>
      __$$ReceivedPointModelImplCopyWithImpl<_$ReceivedPointModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceivedPointModelImplToJson(
      this,
    );
  }
}

abstract class _ReceivedPointModel implements ReceivedPointModel {
  const factory _ReceivedPointModel(
      {required final int id,
      required final double points,
      required final String exchangePointLocation,
      required final int userId,
      required final DateTime createdAt}) = _$ReceivedPointModelImpl;

  factory _ReceivedPointModel.fromJson(Map<String, dynamic> json) =
      _$ReceivedPointModelImpl.fromJson;

  @override
  int get id;
  @override
  double get points;
  @override
  String get exchangePointLocation;
  @override
  int get userId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ReceivedPointModelImplCopyWith<_$ReceivedPointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
