class Comment {
  final int id;
  final int userId;
  final String message;
  final String? imgUrls;

  Comment({
    required this.id,
    required this.userId,
    required this.message,
    this.imgUrls,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      userId: json['userId'],
      message: json['message'],
      imgUrls: json['imgUrls'],
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
