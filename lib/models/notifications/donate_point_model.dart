import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'donate_point_model.freezed.dart';
part 'donate_point_model.g.dart';

@freezed
class DonatePointModel with _$DonatePointModel {
  const factory DonatePointModel(
      {required int id,
      required double points,
      required String donationLocation,
      required int userId,
      required DateTime createdAt}) = _DonatePointModel;

  factory DonatePointModel.fromJson(Map<String, Object?> json) =>
      _$DonatePointModelFromJson(json);
}
