import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location(
      {required int id,
      required String description,
      required String locationName,
      required String typeOfLocation,
      required double latitude,
      required double longitude,
      required String? review,
      required String backGroundImgUrl,
      required List<String> imgDetailsUrl}) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
