class Rank {
  final int id;
  final double rankPoint;
  final String rankName;

  Rank({required this.id, required this.rankPoint, required this.rankName});

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
        id: json['id'],
        rankPoint: json['rankPoint'],
        rankName: json['rankName']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'rankPoint': rankPoint, 'rankName': rankName};
}
