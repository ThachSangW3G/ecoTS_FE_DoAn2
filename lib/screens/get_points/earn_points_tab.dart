import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/get_points/earn_point_card.dart';
import '../../controllers/notification_controller.dart';
import '../../controllers/user_controller.dart';

class EarnPointsTab extends StatefulWidget {
  const EarnPointsTab({super.key});

  @override
  State<EarnPointsTab> createState() => _EarnPointsState();
}

class _EarnPointsState extends State<EarnPointsTab> {
  NotificationController notificationController =
      Get.put(NotificationController());
  UserController userController = Get.put(UserController());

  late Timer _timer;

  void _startPolling() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      notificationController
          .getAllreceivedPoint(userController.currentUser.value!.id);
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
          Obx(() => notificationController.receivedPointList.value != null &&
                  notificationController.receivedPointList.value!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      notificationController.receivedPointList.value!.length,
                  itemBuilder: (context, index) {
                    final receivedPoint =
                        notificationController.receivedPointList.value![index];
                    return EarnPointCard(receivedPointModel: receivedPoint);
                  },
                )
              : const SizedBox())
        ],
      ),
    );
  }
}
