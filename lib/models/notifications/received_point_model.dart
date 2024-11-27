import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'received_point_model.freezed.dart';
part 'received_point_model.g.dart';

@freezed
class ReceivedPointModel with _$ReceivedPointModel {
  const factory ReceivedPointModel(
      {required int id,
      required double points,
      required String exchangePointLocation,
      required int userId,
      required DateTime createdAt}) = _ReceivedPointModel;

  factory ReceivedPointModel.fromJson(Map<String, Object?> json) =>
      _$ReceivedPointModelFromJson(json);
}
