import 'package:timeago/timeago.dart' as timeago;

class Comment {
  final int id;
  final int userId;
  final String message;
  final String? imgUrls;
  final DateTime? createdAt;
  final String timeAgo;

  Comment({
    required this.id,
    required this.userId,
    required this.message,
    this.imgUrls,
    this.createdAt,
    this.timeAgo = '',
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      userId: json['userId'],
      message: json['message'],
      imgUrls: json['imgUrls'],
      createdAt: json['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'])
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
      'userId': userId,
      'message': message,
      'imgUrls': imgUrls,
    };
  }
}
