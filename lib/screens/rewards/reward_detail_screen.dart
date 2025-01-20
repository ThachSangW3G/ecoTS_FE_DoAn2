import 'package:ecots_fe/components/rewards/infor_reward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../models/rewards/reward.dart';
import '../deliveries/delivery_screen.dart';

class RewardDetailScreen extends StatefulWidget {
  final Reward reward;
  const RewardDetailScreen({super.key, required this.reward});

  @override
  State<RewardDetailScreen> createState() => _RewardDetailScreenState();
}

class _RewardDetailScreenState extends State<RewardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward', style: kLableTextStyleTilte22Green),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.reward.rewardItemUrl[0]),
                      fit: BoxFit.fitHeight)),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.reward.itemName,
                  style: kLableTextGreenWeightW600Size20,
                ),
                Row(
                  children: [
                    Text(
                      widget.reward.pointCharge.toString(),
                      style: kLableTextGreenWeightW600Size24,
                    ),
                    Gap(2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'points',
                        style: kLableTextGreenWeightW600Size13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(10),
            Text(
              widget.reward.itemDescription,
              style: kLableTextGreenWeightW400Size16,
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InforReward(
                    title: 'Height',
                    icon: 'assets/icons/icon-height.svg',
                    value: '${widget.reward.height} cm',
                    isReverse: false,
                  ),
                  InforReward(
                    title: 'Humadity',
                    icon: 'assets/icons/drop.svg',
                    value: '${widget.reward.humidity}%',
                    isReverse: true,
                  )
                ],
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InforReward(
                    title: 'Size',
                    icon: 'assets/icons/maximize-4.svg',
                    value: widget.reward.size,
                    isReverse: false,
                  ),
                  InforReward(
                    title: 'Weight',
                    icon: 'assets/icons/calculator.svg',
                    value: widget.reward.weight,
                    isReverse: true,
                  )
                ],
              ),
            ),
            Gap(40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      'Cancel',
                      style: kLableTextGreenWeightW600Size16,
                    )),
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.reward.stock > 0) {
                        Get.to(() => DeliveryScreen(
                              reward: widget.reward,
                            ));
                      } else {
                        showToast('This reward is out of stock');
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.greenWeight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Reward',
                        style: kLableTextWhiteW600Size16,
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showToast(String s) {
    Get.snackbar(
      'Error',
      s,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.greenWeight,
      colorText: Colors.white,
    );
  }
}
