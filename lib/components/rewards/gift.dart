import 'package:ecots_fe/screens/rewards/reward_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../models/rewards/reward.dart';
import '../../screens/rewards/reward_list_screen.dart';

class Gift extends StatefulWidget {
  final Reward reward;
  const Gift({super.key, required this.reward});

  @override
  State<Gift> createState() => _GiftState();
}

class _GiftState extends State<Gift> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => RewardDetailScreen(
              reward: widget.reward,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              width: 220,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ]),
            ),
            Positioned(
              top: 10,
              right: 0,
              left: 0,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.reward.rewardItemUrl[0]))),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: 220,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.whisper,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.reward.itemName,
                          style: kLableTextGreenWeightW600Size16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.reward.pointCharge.toString(),
                                  style: kLableTextGreenWeightW600Size20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'points',
                                    style: kLableTextGreenWeightW600Size13,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 70,
                              decoration: BoxDecoration(
                                color: AppColors.greenWeight,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                'Radeem',
                                style: kLableButtonDunation,
                              )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: 10,
                right: 10,
                child: SvgPicture.asset("assets/icons/heart_icon.svg"))
          ],
        ),
      ),
    );
  }
}
