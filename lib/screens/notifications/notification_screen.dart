import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/notifications/notification_card.dart';
import '../../constants/app_style.dart';
import '../../controllers/notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController notificationController =
      Get.put(NotificationController());

  late Timer _timer;

  void _startPolling() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      notificationController.getAllNotifications();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startPolling();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification', style: kLableTextStyleTilte22Green),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Obx(() => notificationController.notificationList.value !=
                          null &&
                      notificationController.notificationList.value!.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          notificationController.notificationList.value!.length,
                      itemBuilder: (context, index) {
                        final notification = notificationController
                            .notificationList.value![index];
                        return NotificationCard(
                            notificationModel: notification);
                      },
                    )
                  : const SizedBox())),
        ));
  }
}
