// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achivement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Achivement _$AchivementFromJson(Map<String, dynamic> json) {
  return _Achivement.fromJson(json);
}

/// @nodoc
mixin _$Achivement {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchivementCopyWith<Achivement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchivementCopyWith<$Res> {
  factory $AchivementCopyWith(
          Achivement value, $Res Function(Achivement) then) =
      _$AchivementCopyWithImpl<$Res, Achivement>;
  @useResult
  $Res call({int id, String type});
}

/// @nodoc
class _$AchivementCopyWithImpl<$Res, $Val extends Achivement>
    implements $AchivementCopyWith<$Res> {
  _$AchivementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchivementImplCopyWith<$Res>
    implements $AchivementCopyWith<$Res> {
  factory _$$AchivementImplCopyWith(
          _$AchivementImpl value, $Res Function(_$AchivementImpl) then) =
      __$$AchivementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String type});
}

/// @nodoc
class __$$AchivementImplCopyWithImpl<$Res>
    extends _$AchivementCopyWithImpl<$Res, _$AchivementImpl>
    implements _$$AchivementImplCopyWith<$Res> {
  __$$AchivementImplCopyWithImpl(
      _$AchivementImpl _value, $Res Function(_$AchivementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_$AchivementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchivementImpl with DiagnosticableTreeMixin implements _Achivement {
  const _$AchivementImpl({required this.id, required this.type});

  factory _$AchivementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchivementImplFromJson(json);

  @override
  final int id;
  @override
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Achivement(id: $id, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Achivement'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchivementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AchivementImplCopyWith<_$AchivementImpl> get copyWith =>
      __$$AchivementImplCopyWithImpl<_$AchivementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchivementImplToJson(
      this,
    );
  }
}

abstract class _Achivement implements Achivement {
  const factory _Achivement(
      {required final int id, required final String type}) = _$AchivementImpl;

  factory _Achivement.fromJson(Map<String, dynamic> json) =
      _$AchivementImpl.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$AchivementImplCopyWith<_$AchivementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
