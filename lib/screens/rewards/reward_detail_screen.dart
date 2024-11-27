import 'package:ecots_fe/components/rewards/infor_reward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class RewardDetailScreen extends StatefulWidget {
  const RewardDetailScreen({super.key});

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
            Container(height: 300,
            width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/tree.png'), fit: BoxFit.fitHeight)
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Snake Plants', style: kLableTextGreenWeightW600Size20,),
                Row(
                  children: [
                    Text('1000', style: kLableTextGreenWeightW600Size24,),
                    Gap(2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('points', style: kLableTextGreenWeightW600Size13,),
                    ),

                  ],
                ),
              ],
            ),

            Gap(10),
            
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys ed it to make a type specimen book. ', style: kLableTextGreenWeightW400Size16,),

            Gap(10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InforReward(title: 'Height', icon: 'assets/icons/icon-height.svg', value: '100 cm', isReverse: false,),
                InforReward(title: 'Humadity', icon: 'assets/icons/drop.svg', value: '65%', isReverse: true,)
              ],),
            ),

            Gap(10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InforReward(title: 'Size', icon: 'assets/icons/maximize-4.svg', value: 'Large', isReverse: false,),
                  InforReward(title: 'Weight', icon: 'assets/icons/calculator.svg', value: '5kg', isReverse: true,)
                ],),
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
                  child: Center(child: Text('Cancel', style: kLableTextGreenWeightW600Size16,)),
                ),

                Container(
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.greenWeight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text('Reward', style: kLableTextWhiteW600Size16,)),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}
