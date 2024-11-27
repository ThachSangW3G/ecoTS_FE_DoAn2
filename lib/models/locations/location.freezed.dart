// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  String get typeOfLocation => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  String get backGroundImgUrl => throw _privateConstructorUsedError;
  List<String> get imgDetailsUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {int id,
      String description,
      String locationName,
      String typeOfLocation,
      double latitude,
      double longitude,
      String? review,
      String backGroundImgUrl,
      List<String> imgDetailsUrl});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? locationName = null,
    Object? typeOfLocation = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? review = freezed,
    Object? backGroundImgUrl = null,
    Object? imgDetailsUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfLocation: null == typeOfLocation
          ? _value.typeOfLocation
          : typeOfLocation // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      backGroundImgUrl: null == backGroundImgUrl
          ? _value.backGroundImgUrl
          : backGroundImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imgDetailsUrl: null == imgDetailsUrl
          ? _value.imgDetailsUrl
          : imgDetailsUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String description,
      String locationName,
      String typeOfLocation,
      double latitude,
      double longitude,
      String? review,
      String backGroundImgUrl,
      List<String> imgDetailsUrl});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? locationName = null,
    Object? typeOfLocation = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? review = freezed,
    Object? backGroundImgUrl = null,
    Object? imgDetailsUrl = null,
  }) {
    return _then(_$LocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfLocation: null == typeOfLocation
          ? _value.typeOfLocation
          : typeOfLocation // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      backGroundImgUrl: null == backGroundImgUrl
          ? _value.backGroundImgUrl
          : backGroundImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imgDetailsUrl: null == imgDetailsUrl
          ? _value._imgDetailsUrl
          : imgDetailsUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl with DiagnosticableTreeMixin implements _Location {
  const _$LocationImpl(
      {required this.id,
      required this.description,
      required this.locationName,
      required this.typeOfLocation,
      required this.latitude,
      required this.longitude,
      required this.review,
      required this.backGroundImgUrl,
      required final List<String> imgDetailsUrl})
      : _imgDetailsUrl = imgDetailsUrl;

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final int id;
  @override
  final String description;
  @override
  final String locationName;
  @override
  final String typeOfLocation;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? review;
  @override
  final String backGroundImgUrl;
  final List<String> _imgDetailsUrl;
  @override
  List<String> get imgDetailsUrl {
    if (_imgDetailsUrl is EqualUnmodifiableListView) return _imgDetailsUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgDetailsUrl);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Location(id: $id, description: $description, locationName: $locationName, typeOfLocation: $typeOfLocation, latitude: $latitude, longitude: $longitude, review: $review, backGroundImgUrl: $backGroundImgUrl, imgDetailsUrl: $imgDetailsUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Location'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('locationName', locationName))
      ..add(DiagnosticsProperty('typeOfLocation', typeOfLocation))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('review', review))
      ..add(DiagnosticsProperty('backGroundImgUrl', backGroundImgUrl))
      ..add(DiagnosticsProperty('imgDetailsUrl', imgDetailsUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.typeOfLocation, typeOfLocation) ||
                other.typeOfLocation == typeOfLocation) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.backGroundImgUrl, backGroundImgUrl) ||
                other.backGroundImgUrl == backGroundImgUrl) &&
            const DeepCollectionEquality()
                .equals(other._imgDetailsUrl, _imgDetailsUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      locationName,
      typeOfLocation,
      latitude,
      longitude,
      review,
      backGroundImgUrl,
      const DeepCollectionEquality().hash(_imgDetailsUrl));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required final int id,
      required final String description,
      required final String locationName,
      required final String typeOfLocation,
      required final double latitude,
      required final double longitude,
      required final String? review,
      required final String backGroundImgUrl,
      required final List<String> imgDetailsUrl}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  String get locationName;
  @override
  String get typeOfLocation;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get review;
  @override
  String get backGroundImgUrl;
  @override
  List<String> get imgDetailsUrl;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
