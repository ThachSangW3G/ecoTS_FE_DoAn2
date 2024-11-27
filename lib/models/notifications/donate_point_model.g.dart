// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DonatePointModelImpl _$$DonatePointModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DonatePointModelImpl(
      id: (json['id'] as num).toInt(),
      points: (json['points'] as num).toDouble(),
      donationLocation: json['donationLocation'] as String,
      userId: (json['userId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DonatePointModelImplToJson(
        _$DonatePointModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'donationLocation': instance.donationLocation,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
