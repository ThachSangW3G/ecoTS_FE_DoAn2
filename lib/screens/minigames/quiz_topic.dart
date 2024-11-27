class QuizTopic {
  final int id;
  final String topicName;
  final String imgUrl;
  final String description;
  final int numberQuestion;

  QuizTopic({
    required this.id,
    required this.topicName,
    required this.imgUrl,
    required this.description,
    required this.numberQuestion,
  });

  factory QuizTopic.fromJson(Map<String, dynamic> json) {
    return QuizTopic(
      id: json['id'],
      topicName: json['topicName'],
      imgUrl: json['imgUrl'],
      description: json['description'],
      numberQuestion: json['numberQuestion'],
    );
  }
}
