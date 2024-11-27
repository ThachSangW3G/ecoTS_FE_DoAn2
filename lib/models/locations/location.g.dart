// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      locationName: json['locationName'] as String,
      typeOfLocation: json['typeOfLocation'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      review: json['review'] as String?,
      backGroundImgUrl: json['backGroundImgUrl'] as String,
      imgDetailsUrl: (json['imgDetailsUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'locationName': instance.locationName,
      'typeOfLocation': instance.typeOfLocation,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'review': instance.review,
      'backGroundImgUrl': instance.backGroundImgUrl,
      'imgDetailsUrl': instance.imgDetailsUrl,
    };
