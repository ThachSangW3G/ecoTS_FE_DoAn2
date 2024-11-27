
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/achivements/achivement_card.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/achivement_controller.dart';
import '../../controllers/achivemetn_level_controller.dart';
import '../../controllers/user_controller.dart';
import '../../models/achivement_results/achivement_result.dart';
import '../../models/achivements/achivement.dart';

class AchivementScreen extends StatefulWidget {
  const AchivementScreen({super.key});

  @override
  State<AchivementScreen> createState() => _AchivementScreenState();
}

class _AchivementScreenState extends State<AchivementScreen> {
  AchivementController achivementController = Get.put(AchivementController());
  AchivementLevelController achivementLevelController =
      Get.put(AchivementLevelController());
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    if (userController.currentUser.value != null) {
      achivementLevelController.setUserId(userController.currentUser.value!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Achievement',
          style: kLableTextStyleTilteGreen,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: StreamBuilder<List<Achivement>>(
            stream: achivementController.achivementStream,
            builder: (context, achievementSnapshot) {
              if (achievementSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (achievementSnapshot.hasError) {
                return Center(
                    child: Text('Error: ${achievementSnapshot.error}'));
              } else if (!achievementSnapshot.hasData ||
                  achievementSnapshot.data!.isEmpty) {
                return Center(child: Text('No achievements found'));
              }

              final achievements = achievementSnapshot.data!;

              return Column(
                children: [
                  Gap(20),
                  ListView.builder(
                    itemCount: achievements.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final achievement = achievements[index];
                      final achievementTitle =
                          _getAchievementTitle(achievement.type);

                      return Container(
                        width: MediaQuery.of(context).size.width - 20,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.gray, width: 0.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              achievementTitle,
                              style: kLableTextBlackW600,
                            ),
                            StreamBuilder<List<AchivementResult>>(
                              stream: achivementLevelController
                                  .achivementResultStream,
                              builder: (context, resultSnapshot) {
                                if (resultSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (resultSnapshot.hasError) {
                                  return Center(
                                      child: Text(
                                          'Error: ${resultSnapshot.error}'));
                                } else if (!resultSnapshot.hasData ||
                                    resultSnapshot.data!.isEmpty) {
                                  return Center(child: Text('No levels found'));
                                }

                                final achievementResults = resultSnapshot.data!;
                                final achievementLevels = achievementResults
                                    .where((result) =>
                                        result.achievementId == achievement.id)
                                    .toList();

                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: achievementLevels.length,
                                  itemBuilder: (context, index) {
                                    final achievementResult =
                                        achievementLevels[index];

                                    return AchivementCard(
                                      title: achievementResult
                                          .achievementLevelName,
                                      image: achievementResult.iconUrl,
                                      maxValue:
                                          achievementResult.maxIndex.toDouble(),
                                      currentValue:
                                          achievementResult.currentIndex,
                                      isCompleted:
                                          achievementResult.progress >= 100.0,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String _getAchievementTitle(String type) {
    switch (type) {
      case "COUNT_DONATE":
        return "Achievement count number of donation times";
      case "TOTAL_POINTS_DONATE":
        return "You're great for your community";
      case "USER_MAX_POINT":
        return "Stronger will make you better";
      case "SAVE_CO2":
        return "You're a super hero! Let's save the world";
      case "USE_CAMERA_DETECT":
        return "Make it right, try to detect";
      default:
        return type;
    }
  }
}
