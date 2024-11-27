// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achivement_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AchivementLevel _$AchivementLevelFromJson(Map<String, dynamic> json) {
  return _AchivementLevel.fromJson(json);
}

/// @nodoc
mixin _$AchivementLevel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  int get maxIndex => throw _privateConstructorUsedError;
  Achivement get achivement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchivementLevelCopyWith<AchivementLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchivementLevelCopyWith<$Res> {
  factory $AchivementLevelCopyWith(
          AchivementLevel value, $Res Function(AchivementLevel) then) =
      _$AchivementLevelCopyWithImpl<$Res, AchivementLevel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String imgUrl,
      String iconUrl,
      int maxIndex,
      Achivement achivement});

  $AchivementCopyWith<$Res> get achivement;
}

/// @nodoc
class _$AchivementLevelCopyWithImpl<$Res, $Val extends AchivementLevel>
    implements $AchivementLevelCopyWith<$Res> {
  _$AchivementLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imgUrl = null,
    Object? iconUrl = null,
    Object? maxIndex = null,
    Object? achivement = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      maxIndex: null == maxIndex
          ? _value.maxIndex
          : maxIndex // ignore: cast_nullable_to_non_nullable
              as int,
      achivement: null == achivement
          ? _value.achivement
          : achivement // ignore: cast_nullable_to_non_nullable
              as Achivement,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AchivementCopyWith<$Res> get achivement {
    return $AchivementCopyWith<$Res>(_value.achivement, (value) {
      return _then(_value.copyWith(achivement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AchivementLevelImplCopyWith<$Res>
    implements $AchivementLevelCopyWith<$Res> {
  factory _$$AchivementLevelImplCopyWith(_$AchivementLevelImpl value,
          $Res Function(_$AchivementLevelImpl) then) =
      __$$AchivementLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String imgUrl,
      String iconUrl,
      int maxIndex,
      Achivement achivement});

  @override
  $AchivementCopyWith<$Res> get achivement;
}

/// @nodoc
class __$$AchivementLevelImplCopyWithImpl<$Res>
    extends _$AchivementLevelCopyWithImpl<$Res, _$AchivementLevelImpl>
    implements _$$AchivementLevelImplCopyWith<$Res> {
  __$$AchivementLevelImplCopyWithImpl(
      _$AchivementLevelImpl _value, $Res Function(_$AchivementLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imgUrl = null,
    Object? iconUrl = null,
    Object? maxIndex = null,
    Object? achivement = null,
  }) {
    return _then(_$AchivementLevelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      maxIndex: null == maxIndex
          ? _value.maxIndex
          : maxIndex // ignore: cast_nullable_to_non_nullable
              as int,
      achivement: null == achivement
          ? _value.achivement
          : achivement // ignore: cast_nullable_to_non_nullable
              as Achivement,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchivementLevelImpl
    with DiagnosticableTreeMixin
    implements _AchivementLevel {
  const _$AchivementLevelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.imgUrl,
      required this.iconUrl,
      required this.maxIndex,
      required this.achivement});

  factory _$AchivementLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchivementLevelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imgUrl;
  @override
  final String iconUrl;
  @override
  final int maxIndex;
  @override
  final Achivement achivement;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AchivementLevel(id: $id, name: $name, description: $description, imgUrl: $imgUrl, iconUrl: $iconUrl, maxIndex: $maxIndex, achivement: $achivement)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AchivementLevel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('imgUrl', imgUrl))
      ..add(DiagnosticsProperty('iconUrl', iconUrl))
      ..add(DiagnosticsProperty('maxIndex', maxIndex))
      ..add(DiagnosticsProperty('achivement', achivement));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchivementLevelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.maxIndex, maxIndex) ||
                other.maxIndex == maxIndex) &&
            (identical(other.achivement, achivement) ||
                other.achivement == achivement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, imgUrl,
      iconUrl, maxIndex, achivement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AchivementLevelImplCopyWith<_$AchivementLevelImpl> get copyWith =>
      __$$AchivementLevelImplCopyWithImpl<_$AchivementLevelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchivementLevelImplToJson(
      this,
    );
  }
}

abstract class _AchivementLevel implements AchivementLevel {
  const factory _AchivementLevel(
      {required final int id,
      required final String name,
      required final String description,
      required final String imgUrl,
      required final String iconUrl,
      required final int maxIndex,
      required final Achivement achivement}) = _$AchivementLevelImpl;

  factory _AchivementLevel.fromJson(Map<String, dynamic> json) =
      _$AchivementLevelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imgUrl;
  @override
  String get iconUrl;
  @override
  int get maxIndex;
  @override
  Achivement get achivement;
  @override
  @JsonKey(ignore: true)
  _$$AchivementLevelImplCopyWith<_$AchivementLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
