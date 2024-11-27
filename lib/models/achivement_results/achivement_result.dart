import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'achivement_result.freezed.dart';
part 'achivement_result.g.dart';

@freezed
class AchivementResult with _$AchivementResult {
  const factory AchivementResult(
      {required String achievementLevelName,
      required int achievementLevelId,
      required int achievementId,
      required double currentIndex,
      required double maxIndex,
      required double progress,
      required String imgUrl,
      required String iconUrl}) = _AchivementResult;

  factory AchivementResult.fromJson(Map<String, Object?> json) =>
      _$AchivementResultFromJson(json);
}
