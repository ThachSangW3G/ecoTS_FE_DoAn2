
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../screens/minigames/api_service.dart';
import '../../screens/minigames/quiz_topic.dart';
import '../../screens/minigames/user_progress.dart';

class QuizHorizonCard extends StatefulWidget {
  final QuizTopic quizTopic;
  final VoidCallback onTap;

  const QuizHorizonCard(
      {super.key, required this.quizTopic, required this.onTap});

  @override
  State<QuizHorizonCard> createState() => _QuizHorizonCardState();
}

class _QuizHorizonCardState extends State<QuizHorizonCard> {
  late Stream<UserProgress> userProgressStream;
  late ApiService apiService;
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('tokenAccess');
  }

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    _initializeUserProgressStream();
  }

  void _initializeUserProgressStream() async {
    try {
      String? token = await _getToken(); // Thay thế bằng token của bạn
      int userId = await apiService.getUserIdFromToken(token!);
      setState(() {
        userProgressStream =
            apiService.fetchUserProgressStream(userId, widget.quizTopic.id);
      });
    } catch (error) {
      print('Failed to fetch user ID: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.gray, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.quizTopic.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.quizTopic.topicName,
                    style: kLableTextBlackW600,
                  ),
                  Text(
                    '${widget.quizTopic.numberQuestion} questions',
                    style: kLableTextStyleMiniumGrey,
                  ),
                ],
              ),
            ),
            const Gap(10),
            StreamBuilder<UserProgress>(
              stream: userProgressStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error');
                } else if (!snapshot.hasData) {
                  return Text('No progress');
                } else {
                  final progress = snapshot.data?.progress ?? 0.0;
                  return CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 5.0,
                    percent: progress / 100, // Giá trị phần trăm
                    center: Text(
                      "${progress.toInt()}%",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green,
                      ),
                    ),
                    progressColor: AppColors.green,
                    circularStrokeCap: CircularStrokeCap.round,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
