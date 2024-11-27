// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achivement_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchivementLevelImpl _$$AchivementLevelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchivementLevelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      imgUrl: json['imgUrl'] as String,
      iconUrl: json['iconUrl'] as String,
      maxIndex: (json['maxIndex'] as num).toInt(),
      achivement:
          Achivement.fromJson(json['achivement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AchivementLevelImplToJson(
        _$AchivementLevelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
      'iconUrl': instance.iconUrl,
      'maxIndex': instance.maxIndex,
      'achivement': instance.achivement,
    };
