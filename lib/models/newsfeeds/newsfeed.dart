import 'package:timeago/timeago.dart' as timeago;

class Newsfeed {
  final int id;
  final String content;
  final List<String> mediaUrls;
  final int? sponsorId;
  final double? pointForActivity;
  final int? userId;
  final int pollId;
  final List<int> commentIds;
  final List<int> reactIds;
  final DateTime? createdAt;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final String timeAgo;

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
      required this.endedAt,
      required this.timeAgo});

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
          ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'])
          : null,
      startedAt: json['startedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['startedAt'])
          : null,
      endedAt: json['endedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['endedAt'])
          : null,
      timeAgo: json['createdAt'] != null
          ? timeago
              .format(DateTime.fromMillisecondsSinceEpoch(json['createdAt']))
          : '',
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
