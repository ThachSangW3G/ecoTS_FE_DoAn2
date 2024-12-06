import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class AccountCard extends StatelessWidget {
  final String title;
  final String image;
  const AccountCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: AppColors.gray,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
                )
            ),
          ),
          Text(title, style: kLableTextStyleMiniumBlack,)
        ],
      ),
    );
  }
}
