// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DonationImpl _$$DonationImplFromJson(Map<String, dynamic> json) =>
    _$DonationImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      sponsorImages: (json['sponsorImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      coverImageUrl: (json['coverImageUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      totalDonations: (json['totalDonations'] as num).toDouble(),
    );

Map<String, dynamic> _$$DonationImplToJson(_$DonationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'sponsorImages': instance.sponsorImages,
      'coverImageUrl': instance.coverImageUrl,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'totalDonations': instance.totalDonations,
    };
