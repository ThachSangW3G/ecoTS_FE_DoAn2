
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../models/notifications/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationCard({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray, width: 0.5)),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/sms.svg'),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificationModel.title,
                  style: kLableTextBlackW600Size16,
                ),
                Text(
                  notificationModel.description,
                  style: kLableTextGreyItalic,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        DateFormat('yyyy-MM-dd')
                            .format(notificationModel.createdAt),
                        style: kLableTextItalic),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
