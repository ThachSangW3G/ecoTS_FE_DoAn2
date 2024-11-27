import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'achivement.freezed.dart';
part 'achivement.g.dart';

@freezed
class Achivement with _$Achivement {
  const factory Achivement({
    required int id,
    required String type,
  }) = _Achivement;

  factory Achivement.fromJson(Map<String, Object?> json) =>
      _$AchivementFromJson(json);
}
