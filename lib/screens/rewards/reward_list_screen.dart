import 'package:ecots_fe/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/rewards/gift.dart';
import '../../constants/app_style.dart';
import '../../controllers/reward_controller.dart';
import '../../models/rewards/reward.dart';

class RewardListScreen extends StatefulWidget {
  const RewardListScreen({super.key});

  @override
  State<RewardListScreen> createState() => _RewardListScreenState();
}

class _RewardListScreenState extends State<RewardListScreen> {
  final RewardController _rewardController = Get.put(RewardController());

  List<Reward> _rewards = [];
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRewards();
  }

  void _getRewards() async {
    setState(() {
      _isLoading = true;
    });
    _rewards = await _rewardController.getAllRewards();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward', style: kLableTextStyleTilte22Green),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tree', style: kLableTextBlackW600),
                  Expanded(
                    // child: GridView.count(crossAxisCount: 2,
                    //   crossAxisSpacing: 0,
                    //   mainAxisSpacing: 0,
                    //   children: List.generate(8, (index){
                    //     return Gift();},  ),
                    // ),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) => Gift(
                              reward: _rewards[index],
                            ),
                        itemCount: _rewards.length),
                  )
                ],
              )),
    );
  }
}
