class Newsfeed {
  final int id;
  final String content;
  final List<String> mediaUrls;
  final int? sponsorId;
  final double? pointForActivity;
  final int userId;
  final int pollId;
  final List<int> commentIds;
  final List<int> reactIds;
  final DateTime? createdAt;
  final DateTime? startedAt;
  final DateTime? endedAt;

  Newsfeed(
      {required this.id,
      required this.content,
      required this.mediaUrls,
      this.sponsorId,
      required this.pointForActivity,
      required this.userId,
      required this.pollId,
      required this.commentIds,
      required this.reactIds,
      required this.createdAt,
      required this.startedAt,
      required this.endedAt});

  factory Newsfeed.fromJson(Map<String, dynamic> json) {
    return Newsfeed(
      id: json['id'],
      content: json['content'],
      mediaUrls: (json['mediaUrls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      sponsorId: json['sponsorId'],
      pointForActivity: json['pointForActivity'],
      userId: json['userId'],
      pollId: json['pollId'],
      commentIds: (json['commentIds'] as List<dynamic>?)
              ?.map((e) => int.tryParse(e.toString()) ?? 0)
              .toList() ??
          [],
      reactIds: (json['reactIds'] as List<dynamic>?)
              ?.map((e) => int.tryParse(e.toString()) ?? 0)
              .toList() ??
          [],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      startedAt: json['startedAt'] != null
          ? DateTime.tryParse(json['startedAt'])
          : null,
      endedAt:
          json['endedAt'] != null ? DateTime.tryParse(json['endedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'mediaUrls': mediaUrls,
      'sponsorId': sponsorId,
      'pointForActivity': pointForActivity,
      'userId': userId,
      'pollId': pollId,
      'commentIds': commentIds,
      'reactIds': reactIds,
      'createdAt': createdAt?.toIso8601String(),
      'startedAt': startedAt?.toIso8601String(),
      'endedAt': endedAt?.toIso8601String(),
    };
  }
}
