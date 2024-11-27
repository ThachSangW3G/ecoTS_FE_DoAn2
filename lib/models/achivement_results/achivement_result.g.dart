// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achivement_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchivementResultImpl _$$AchivementResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AchivementResultImpl(
      achievementLevelName: json['achievementLevelName'] as String,
      achievementLevelId: (json['achievementLevelId'] as num).toInt(),
      achievementId: (json['achievementId'] as num).toInt(),
      currentIndex: (json['currentIndex'] as num).toDouble(),
      maxIndex: (json['maxIndex'] as num).toDouble(),
      progress: (json['progress'] as num).toDouble(),
      imgUrl: json['imgUrl'] as String,
      iconUrl: json['iconUrl'] as String,
    );

Map<String, dynamic> _$$AchivementResultImplToJson(
        _$AchivementResultImpl instance) =>
    <String, dynamic>{
      'achievementLevelName': instance.achievementLevelName,
      'achievementLevelId': instance.achievementLevelId,
      'achievementId': instance.achievementId,
      'currentIndex': instance.currentIndex,
      'maxIndex': instance.maxIndex,
      'progress': instance.progress,
      'imgUrl': instance.imgUrl,
      'iconUrl': instance.iconUrl,
    };
