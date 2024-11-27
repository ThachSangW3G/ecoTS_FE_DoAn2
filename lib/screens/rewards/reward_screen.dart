import 'package:ecots_fe/components/rewards/gift.dart';
import 'package:ecots_fe/screens/rewards/reward_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class Rewardscreen extends StatefulWidget {
  const Rewardscreen({super.key});

  @override
  State<Rewardscreen> createState() => _RewardscreenState();
}

class _RewardscreenState extends State<Rewardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward', style: kLableTextStyleTilte22Green),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
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
                        child: Center(child: Text('Silver Rank', style: kLableW800White)),
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

                      Text("You need more 3000 points to upgrade your rank", style: kLableTextItalic),
                    ],


                  ),
                ),

                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/bg_point.png'))
                  ),

                  child: Stack(
                    children: [Positioned(
                        right: 40,
                        bottom: 15,
                        child: Text("1000 points", style: kLableTextItalic)),

                  ]
                  ),

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
                      onTap: (){
                        Get.to(() => RewardListScreen());
                      },
                      child: Text('See all', style: kLableTextGreyItalic,)),
                )
              ],
            ),
            Gap(10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(


                children: [
                Gift(),
                Gap(10),
                Gift(),
                Gap(10),
                Gift()
              ],),
            ),

            Gap(10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('HouseHold', style: kLableTextBlackW600),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                      onTap: (){
                        Get.to(() => RewardListScreen());
                      },
                      child: Text('See all', style: kLableTextGreyItalic,)),
                )
              ],
            ),
            Gap(10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(


                children: [
                  Gift(),
                  Gap(10),
                  Gift(),
                  Gap(10),
                  Gift()
                ],),
            )

          ],),
        ),
      ),
    );
  }
}
