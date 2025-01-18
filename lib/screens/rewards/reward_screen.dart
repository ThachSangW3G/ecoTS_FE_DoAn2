import 'package:ecots_fe/components/rewards/gift.dart';
import 'package:ecots_fe/controllers/rank_controller.dart';
import 'package:ecots_fe/controllers/reward_controller.dart';
import 'package:ecots_fe/models/rewards/reward.dart';
import 'package:ecots_fe/screens/rewards/reward_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/point_controller.dart';
import '../../controllers/user_controller.dart';
import '../../models/ranks/rank.dart';
import '../../models/ranks/user_rank.dart';

class Rewardscreen extends StatefulWidget {
  const Rewardscreen({super.key});

  @override
  State<Rewardscreen> createState() => _RewardscreenState();
}

class _RewardscreenState extends State<Rewardscreen> {
  final RankController _rankController = Get.put(RankController());
  final PointController _pointController = Get.put(PointController());
  final RewardController _rewardController = Get.put(RewardController());

  UserRank? _userRank;
  Rank? _nextRank;
  bool _isLoading = false;
  List<Reward> _rewards = [];

  void _getUserRank() async {
    setState(() {
      _isLoading = true;
    });
    _userRank = await _rankController
        .getUserRank(Get.find<UserController>().currentUser.value!.id);

    _nextRank = await _rankController.getNextRank(_userRank!.rank.id);
    setState(() {
      _isLoading = false;
    });
  }

  void _getRewards() async {
    _rewards = await _rewardController.getAllRewards();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserRank();
    _getRewards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward', style: kLableTextStyleTilte22Green),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: AppColors.anwserGreen,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Text(
                                        '${_userRank?.rank.rankName ?? ''} Rank',
                                        style: kLableW800White)),
                              ),
                              Gap(10),
                              Stack(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: AppColors.greenLight,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: AppColors.anwserGreen,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(10),
                              Text(
                                  "You need more ${_nextRank!.rankPoint - _userRank!.userRankPoint} points to upgrade your rank",
                                  style: kLableTextItalic),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/bg_point.png'))),
                          child: Stack(children: [
                            Positioned(
                                right: 40,
                                bottom: 15,
                                child: Text(
                                    "${_pointController.currentPoint.value?.point ?? ''} points",
                                    style: kLableTextItalic)),
                          ]),
                        )
                      ],
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tree', style: kLableTextBlackW600),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                              onTap: () {
                                Get.to(() => RewardListScreen());
                              },
                              child: Text(
                                'See all',
                                style: kLableTextGreyItalic,
                              )),
                        )
                      ],
                    ),
                    Gap(10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 200, // Chiều cao bạn mong muốn
                            child: ListView.builder(
                              scrollDirection: Axis
                                  .horizontal, // Đặt scroll ngang cho ListView
                              itemBuilder: (context, index) =>
                                  Gift(reward: _rewards[index]),
                              itemCount: _rewards.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('HouseHold', style: kLableTextBlackW600),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                              onTap: () {
                                Get.to(() => RewardListScreen());
                              },
                              child: Text(
                                'See all',
                                style: kLableTextGreyItalic,
                              )),
                        )
                      ],
                    ),
                    Gap(10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 200, // Chiều cao bạn mong muốn
                            child: ListView.builder(
                              scrollDirection: Axis
                                  .horizontal, // Đặt scroll ngang cho ListView
                              itemBuilder: (context, index) =>
                                  Gift(reward: _rewards[index]),
                              itemCount: _rewards.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
