

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../models/notifications/donate_point_model.dart';

class DonatePointCard extends StatelessWidget {
  final DonatePointModel donatePointModel;
  const DonatePointCard({super.key, required this.donatePointModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray, width: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xffEBFFD7)),
            child: Center(child: SvgPicture.asset('assets/icons/box.svg')),
          ),
          const Gap(10),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('Quyên góp điểm', style: kLableTextBlackW600Size16),
                Text('Chiến dịch: ${donatePointModel.donationLocation}',
                    style: kLableTextItalic),
                Text('Số điểm: ${donatePointModel.points}',
                    style: kLableTextItalic),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        DateFormat('yyyy-MM-dd')
                            .format(donatePointModel.createdAt),
                        style: kLableTextItalic),
                  ],
                ),
              ]))
        ],
      ),
    );
  }
}
