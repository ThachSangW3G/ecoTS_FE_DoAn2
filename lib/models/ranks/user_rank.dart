import 'package:ecots_fe/models/ranks/rank.dart';

class UserRank {
  final int id;
  final Rank rank;
  final double userRankPoint;

  UserRank({required this.id, required this.rank, required this.userRankPoint});

  factory UserRank.fromJson(Map<String, dynamic> json) {
    return UserRank(
      id: json['id'],
      rank: Rank.fromJson(json['rank']),
      userRankPoint: json['userRankPoint'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'rank': rank.toJson(), 'userRankPoint': userRankPoint};
}
