// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointImpl _$$PointImplFromJson(Map<String, dynamic> json) => _$PointImpl(
      id: (json['id'] as num).toInt(),
      point: (json['point'] as num).toDouble(),
      saveCo2: (json['saveCo2'] as num).toDouble(),
      totalTrashCollect: (json['totalTrashCollect'] as num).toInt(),
    );

Map<String, dynamic> _$$PointImplToJson(_$PointImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'saveCo2': instance.saveCo2,
      'totalTrashCollect': instance.totalTrashCollect,
    };
