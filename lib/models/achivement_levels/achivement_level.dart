
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../achivements/achivement.dart';

part 'achivement_level.freezed.dart';
part 'achivement_level.g.dart';

@freezed
class AchivementLevel with _$AchivementLevel {
  const factory AchivementLevel({
    required int id,
    required String name,
    required String description,
    required String imgUrl,
    required String iconUrl,
    required int maxIndex,
    required Achivement achivement,
  }) = _AchivementLevel;

  factory AchivementLevel.fromJson(Map<String, Object?> json) =>
      _$AchivementLevelFromJson(json);
}
