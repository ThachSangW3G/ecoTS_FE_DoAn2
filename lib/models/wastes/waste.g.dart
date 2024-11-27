// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waste.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasteImpl _$$WasteImplFromJson(Map<String, dynamic> json) => _$WasteImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      pointsPerKg: (json['pointsPerKg'] as num).toDouble(),
      co2SavedPerKg: (json['co2SavedPerKg'] as num).toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$WasteImplToJson(_$WasteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pointsPerKg': instance.pointsPerKg,
      'co2SavedPerKg': instance.co2SavedPerKg,
      'type': instance.type,
    };
