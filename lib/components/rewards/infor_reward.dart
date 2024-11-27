import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class InforReward extends StatefulWidget {
  final String title;
  final String icon;
  final String value;
  final bool isReverse;
  const InforReward({super.key, required this.title, required this.icon, required this.value, required this.isReverse});

  @override
  State<InforReward> createState() => _InforRewardState();
}

class _InforRewardState extends State<InforReward> {
  @override
  Widget build(BuildContext context) {
    return widget.isReverse ?  Row(
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.title, style: kLableTextGreenWeightW600Size16,),
            Text(widget.value, style: kLableTextGreenWeightW400Size16,)
          ],
        )
       ,
        Gap(10),

        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: AppColors.greenWeight,
              shape: BoxShape.circle
          ),
          child: Center(child: SvgPicture.asset(widget.icon),),
        ),


      ],
    ) : Row(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: AppColors.greenWeight,
              shape: BoxShape.circle
          ),
          child: Center(child: SvgPicture.asset(widget.icon),),
        ),

        Gap(10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: kLableTextGreenWeightW600Size16,),
            Text(widget.value, style: kLableTextGreenWeightW400Size16,)
          ],
        )
      ],
    );
  }
}
