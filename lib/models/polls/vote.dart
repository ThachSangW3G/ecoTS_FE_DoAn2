class Vote {
  final int id;
  final int userId;
  final bool status;
  final String? avatarUrl;
  final String fullName;

  Vote(
      {required this.id,
      required this.userId,
      required this.status,
      this.avatarUrl,
      required this.fullName});

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
        id: json['id'],
        userId: json['userId'],
        status: json['status'],
        avatarUrl: json['avatarUrl'],
        fullName: json['fullName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status,
      'avatarUrl': avatarUrl,
      'fullName': fullName
    };
  }
}
