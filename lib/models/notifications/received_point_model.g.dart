// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceivedPointModelImpl _$$ReceivedPointModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceivedPointModelImpl(
      id: (json['id'] as num).toInt(),
      points: (json['points'] as num).toDouble(),
      exchangePointLocation: json['exchangePointLocation'] as String,
      userId: (json['userId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ReceivedPointModelImplToJson(
        _$ReceivedPointModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'exchangePointLocation': instance.exchangePointLocation,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
