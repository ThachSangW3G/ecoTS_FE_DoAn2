import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'point.freezed.dart';
part 'point.g.dart';

@freezed
class Point with _$Point {
  const factory Point(
      {required int id,
      required double point,
      required double saveCo2,
      required int totalTrashCollect}) = _Point;

  factory Point.fromJson(Map<String, Object?> json) => _$PointFromJson(json);
}
