// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Donation _$DonationFromJson(Map<String, dynamic> json) {
  return _Donation.fromJson(json);
}

/// @nodoc
mixin _$Donation {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get sponsorImages => throw _privateConstructorUsedError;
  List<String> get coverImageUrl => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  double get totalDonations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonationCopyWith<Donation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationCopyWith<$Res> {
  factory $DonationCopyWith(Donation value, $Res Function(Donation) then) =
      _$DonationCopyWithImpl<$Res, Donation>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      List<String> sponsorImages,
      List<String> coverImageUrl,
      DateTime startDate,
      DateTime endDate,
      double totalDonations});
}

/// @nodoc
class _$DonationCopyWithImpl<$Res, $Val extends Donation>
    implements $DonationCopyWith<$Res> {
  _$DonationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? sponsorImages = null,
    Object? coverImageUrl = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? totalDonations = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorImages: null == sponsorImages
          ? _value.sponsorImages
          : sponsorImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalDonations: null == totalDonations
          ? _value.totalDonations
          : totalDonations // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DonationImplCopyWith<$Res>
    implements $DonationCopyWith<$Res> {
  factory _$$DonationImplCopyWith(
          _$DonationImpl value, $Res Function(_$DonationImpl) then) =
      __$$DonationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      List<String> sponsorImages,
      List<String> coverImageUrl,
      DateTime startDate,
      DateTime endDate,
      double totalDonations});
}

/// @nodoc
class __$$DonationImplCopyWithImpl<$Res>
    extends _$DonationCopyWithImpl<$Res, _$DonationImpl>
    implements _$$DonationImplCopyWith<$Res> {
  __$$DonationImplCopyWithImpl(
      _$DonationImpl _value, $Res Function(_$DonationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? sponsorImages = null,
    Object? coverImageUrl = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? totalDonations = null,
  }) {
    return _then(_$DonationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorImages: null == sponsorImages
          ? _value._sponsorImages
          : sponsorImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coverImageUrl: null == coverImageUrl
          ? _value._coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalDonations: null == totalDonations
          ? _value.totalDonations
          : totalDonations // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DonationImpl with DiagnosticableTreeMixin implements _Donation {
  const _$DonationImpl(
      {required this.id,
      required this.title,
      required this.description,
      required final List<String> sponsorImages,
      required final List<String> coverImageUrl,
      required this.startDate,
      required this.endDate,
      required this.totalDonations})
      : _sponsorImages = sponsorImages,
        _coverImageUrl = coverImageUrl;

  factory _$DonationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DonationImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  final List<String> _sponsorImages;
  @override
  List<String> get sponsorImages {
    if (_sponsorImages is EqualUnmodifiableListView) return _sponsorImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sponsorImages);
  }

  final List<String> _coverImageUrl;
  @override
  List<String> get coverImageUrl {
    if (_coverImageUrl is EqualUnmodifiableListView) return _coverImageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coverImageUrl);
  }

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final double totalDonations;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Donation(id: $id, title: $title, description: $description, sponsorImages: $sponsorImages, coverImageUrl: $coverImageUrl, startDate: $startDate, endDate: $endDate, totalDonations: $totalDonations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Donation'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('sponsorImages', sponsorImages))
      ..add(DiagnosticsProperty('coverImageUrl', coverImageUrl))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('totalDonations', totalDonations));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DonationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._sponsorImages, _sponsorImages) &&
            const DeepCollectionEquality()
                .equals(other._coverImageUrl, _coverImageUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalDonations, totalDonations) ||
                other.totalDonations == totalDonations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      const DeepCollectionEquality().hash(_sponsorImages),
      const DeepCollectionEquality().hash(_coverImageUrl),
      startDate,
      endDate,
      totalDonations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DonationImplCopyWith<_$DonationImpl> get copyWith =>
      __$$DonationImplCopyWithImpl<_$DonationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DonationImplToJson(
      this,
    );
  }
}

abstract class _Donation implements Donation {
  const factory _Donation(
      {required final int id,
      required final String title,
      required final String description,
      required final List<String> sponsorImages,
      required final List<String> coverImageUrl,
      required final DateTime startDate,
      required final DateTime endDate,
      required final double totalDonations}) = _$DonationImpl;

  factory _Donation.fromJson(Map<String, dynamic> json) =
      _$DonationImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get sponsorImages;
  @override
  List<String> get coverImageUrl;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  double get totalDonations;
  @override
  @JsonKey(ignore: true)
  _$$DonationImplCopyWith<_$DonationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
