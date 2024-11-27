import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'donation.freezed.dart';
part 'donation.g.dart';

@freezed
class Donation with _$Donation {
  const factory Donation({
    required int id,
    required String title,
    required String description,
    required List<String> sponsorImages,
    required List<String> coverImageUrl,
    required DateTime startDate,
    required DateTime endDate,
    required double totalDonations,
  }) = _Donation;

  factory Donation.fromJson(Map<String, Object?> json) =>
      _$DonationFromJson(json);
}
