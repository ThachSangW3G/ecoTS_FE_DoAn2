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

  Newsfeed(
      {required this.id,
      required this.content,
      required this.mediaUrls,
      this.sponsorId,
      required this.pointForActivity,
      required this.userId,
      required this.pollId,
      required this.commentIds,
      required this.reactIds});

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
    };
  }
}
