// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waste.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Waste _$WasteFromJson(Map<String, dynamic> json) {
  return _Waste.fromJson(json);
}

/// @nodoc
mixin _$Waste {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get pointsPerKg => throw _privateConstructorUsedError;
  double get co2SavedPerKg => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WasteCopyWith<Waste> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasteCopyWith<$Res> {
  factory $WasteCopyWith(Waste value, $Res Function(Waste) then) =
      _$WasteCopyWithImpl<$Res, Waste>;
  @useResult
  $Res call(
      {int id,
      String name,
      double pointsPerKg,
      double co2SavedPerKg,
      String type});
}

/// @nodoc
class _$WasteCopyWithImpl<$Res, $Val extends Waste>
    implements $WasteCopyWith<$Res> {
  _$WasteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pointsPerKg = null,
    Object? co2SavedPerKg = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pointsPerKg: null == pointsPerKg
          ? _value.pointsPerKg
          : pointsPerKg // ignore: cast_nullable_to_non_nullable
              as double,
      co2SavedPerKg: null == co2SavedPerKg
          ? _value.co2SavedPerKg
          : co2SavedPerKg // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WasteImplCopyWith<$Res> implements $WasteCopyWith<$Res> {
  factory _$$WasteImplCopyWith(
          _$WasteImpl value, $Res Function(_$WasteImpl) then) =
      __$$WasteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double pointsPerKg,
      double co2SavedPerKg,
      String type});
}

/// @nodoc
class __$$WasteImplCopyWithImpl<$Res>
    extends _$WasteCopyWithImpl<$Res, _$WasteImpl>
    implements _$$WasteImplCopyWith<$Res> {
  __$$WasteImplCopyWithImpl(
      _$WasteImpl _value, $Res Function(_$WasteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pointsPerKg = null,
    Object? co2SavedPerKg = null,
    Object? type = null,
  }) {
    return _then(_$WasteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pointsPerKg: null == pointsPerKg
          ? _value.pointsPerKg
          : pointsPerKg // ignore: cast_nullable_to_non_nullable
              as double,
      co2SavedPerKg: null == co2SavedPerKg
          ? _value.co2SavedPerKg
          : co2SavedPerKg // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasteImpl with DiagnosticableTreeMixin implements _Waste {
  const _$WasteImpl(
      {required this.id,
      required this.name,
      required this.pointsPerKg,
      required this.co2SavedPerKg,
      required this.type});

  factory _$WasteImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasteImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double pointsPerKg;
  @override
  final double co2SavedPerKg;
  @override
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Waste(id: $id, name: $name, pointsPerKg: $pointsPerKg, co2SavedPerKg: $co2SavedPerKg, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Waste'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('pointsPerKg', pointsPerKg))
      ..add(DiagnosticsProperty('co2SavedPerKg', co2SavedPerKg))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WasteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pointsPerKg, pointsPerKg) ||
                other.pointsPerKg == pointsPerKg) &&
            (identical(other.co2SavedPerKg, co2SavedPerKg) ||
                other.co2SavedPerKg == co2SavedPerKg) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, pointsPerKg, co2SavedPerKg, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WasteImplCopyWith<_$WasteImpl> get copyWith =>
      __$$WasteImplCopyWithImpl<_$WasteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WasteImplToJson(
      this,
    );
  }
}

abstract class _Waste implements Waste {
  const factory _Waste(
      {required final int id,
      required final String name,
      required final double pointsPerKg,
      required final double co2SavedPerKg,
      required final String type}) = _$WasteImpl;

  factory _Waste.fromJson(Map<String, dynamic> json) = _$WasteImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get pointsPerKg;
  @override
  double get co2SavedPerKg;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$WasteImplCopyWith<_$WasteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
