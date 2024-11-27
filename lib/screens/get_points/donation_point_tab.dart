import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/get_points/donate_point_card.dart';
import '../../controllers/notification_controller.dart';
import '../../controllers/user_controller.dart';

class DonationPointTab extends StatefulWidget {
  const DonationPointTab({super.key});

  @override
  State<DonationPointTab> createState() => _DonationPointTabState();
}

class _DonationPointTabState extends State<DonationPointTab> {
  NotificationController notificationController =
      Get.put(NotificationController());
  UserController userController = Get.put(UserController());

  late Timer _timer;

  void _startPolling() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      notificationController
          .getAllDonatePoint(userController.currentUser.value!.id);
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() => notificationController.donatePointList.value != null &&
                  notificationController.donatePointList.value!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      notificationController.donatePointList.value!.length,
                  itemBuilder: (context, index) {
                    final receivedPoint =
                        notificationController.donatePointList.value![index];
                    return DonatePointCard(donatePointModel: receivedPoint);
                  },
                )
              : const SizedBox())
        ],
      ),
    );
  }
}
