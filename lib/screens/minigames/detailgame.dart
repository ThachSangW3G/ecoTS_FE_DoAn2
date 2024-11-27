
import 'package:ecots_fe/screens/minigames/quiz_question.dart';
import 'package:ecots_fe/screens/minigames/quiz_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/app_style.dart';
import 'api_service.dart';


class DetailGame extends StatefulWidget {
  final int quizTopicId;

  const DetailGame({super.key, required this.quizTopicId});

  @override
  State<DetailGame> createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  late Stream<List<QuizQuestion>> quizQuestionsStream;

  @override
  void initState() {
    super.initState();
    quizQuestionsStream = ApiService().fetchQuizQuestions(widget.quizTopicId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport game', style: kLableTextStyleTilte22Green),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: StreamBuilder<List<QuizQuestion>>(
          stream: quizQuestionsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No questions found for this topic'));
            } else {
              List<QuizQuestion> questions = snapshot.data!;
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(
                          questions: questions,
                          currentQuestionIndex: 0,
                          correctAnswers: 0,
                          topicId: widget.quizTopicId,
                        ),
                      ),
                    );
                  },
                  child: Text('Start Quiz'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
