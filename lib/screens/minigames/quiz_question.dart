class QuizQuestion {
  final int id;
  final String questionText;
  final String correctAnswer;
  final String incorrectAnswer1;
  final String incorrectAnswer2;

  QuizQuestion({
    required this.id,
    required this.questionText,
    required this.correctAnswer,
    required this.incorrectAnswer1,
    required this.incorrectAnswer2,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      questionText: json['questionText'],
      correctAnswer: json['correctAnswer'],
      incorrectAnswer1: json['incorrectAnswer1'],
      incorrectAnswer2: json['incorrectAnswer2'],
    );
  }

  get isCorrect => null;
}
