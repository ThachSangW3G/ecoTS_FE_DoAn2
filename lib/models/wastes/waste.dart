import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'waste.freezed.dart';
part 'waste.g.dart';

@freezed
class Waste with _$Waste {
  const factory Waste(
      {required int id,
      required String name,
      required double pointsPerKg,
      required double co2SavedPerKg,
      required String type}) = _Waste;

  factory Waste.fromJson(Map<String, Object?> json) => _$WasteFromJson(json);
}
