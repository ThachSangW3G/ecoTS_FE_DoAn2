import 'package:ecots_fe/screens/minigames/user_progress.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import 'api_service.dart';

class ResultGame extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int topicId;

  const ResultGame({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.topicId,
  });

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('tokenAccess');
  }

  Future<void> _handleQuizCompletion() async {
    String? token = await _getToken();
    if (token != null) {
      int userId = await ApiService().getUserIdFromToken(token);
      double progress = (correctAnswers / totalQuestions) * 100;
      await ApiService().updateUserProgress(userId, topicId, progress);
      if (progress >= 100) {
        UserProgress userProgress =
            await ApiService().getUserProgress(userId, topicId);
        if (userProgress.reachMax && userProgress.collection) {
          await ApiService().completeQuizAddPoints(userId);
        }
      }
    } else {
      // Handle missing token
      print('Token not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport game', style: kLableTextStyleTilte22Green),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/result.png'),
                    ),
                  ),
                ),
                Text('Result of the game', style: kQuestionTextStyle),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.money, color: AppColors.green),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Text(
                          'Score gained',
                          style: kLableTextBlackW600,
                        ),
                      ),
                      Text(
                        '25', // Mặc định 25 điểm
                        style: kLableTextBlackW600,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.check, color: AppColors.green),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Text(
                          'Correct predictions',
                          style: kLableTextBlackW600,
                        ),
                      ),
                      Text(
                        '$correctAnswers/$totalQuestions',
                        style: kLableTextBlackW600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
            Positioned(
              bottom: 10,
              child: InkWell(
                onTap: () async {
                  await _handleQuizCompletion();
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      'Okay',
                      style: kLableBoldWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
