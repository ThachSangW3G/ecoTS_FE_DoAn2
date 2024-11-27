import 'dart:math';


import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/home/achivement_item.dart';
import '../../components/home/tile.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/point_controller.dart';
import '../../controllers/user_controller.dart';
import '../get_points/history_point.dart';
import '../splash/welcome.dart';
import 'about_me.dart';
import 'change_password.dart';
import 'notification_setting.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UserController userController = Get.put(UserController());
  PointController pointController = Get.put(PointController());

  Future<void> _pickImageFromGalleary() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      final success = await userController.uploadNewAvatar(returnedImage.path);

      if (!success) {
        final snackdemo = SnackBar(
          content: Text(
            'Cập nhật avatar không thành công!',
            style: kLableW800White,
          ),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      } else {
        await userController
            .getUserByToken((await _prefs).getString('tokenAccess')!);
        final snackdemo = SnackBar(
          content: Text(
            'Cập nhật avatar thành công!',
            style: kLableW800White,
          ),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    }
  }

  double roundToDecimals(double value, int places) {
    final double mod = pow(10, places).toDouble();
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whisper,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.slamon,
                          ),
                          child: Obx(
                            () => ClipOval(
                              child:
                                  userController.currentUser.value!.avatarUrl !=
                                          null
                                      ? Image.network(
                                          userController
                                              .currentUser.value!.avatarUrl!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'assets/images/default_avatar.jpg',
                                          fit: BoxFit.cover),
                            ),
                          )),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: InkWell(
                          onTap: _pickImageFromGalleary,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.green),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/camera.svg',
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userController.currentUser.value!.fullName!,
                    style: kLableTextBlackW600,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    userController.currentUser.value!.email!,
                    style: kLableTextStyleMiniumGrey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 150,
                      decoration: const BoxDecoration(
                          color: AppColors.shamrock,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AchivementItem(
                                image: 'assets/images/giftbox.png',
                                title: 'POINTS',
                                value:
                                    '${roundToDecimals(pointController.currentPoint.value!.point, 2)}'),
                            Container(
                              height: 100,
                              width: 4,
                              decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            AchivementItem(
                                image: 'assets/images/O2.png',
                                title: 'SAVE O2',
                                value:
                                    '${roundToDecimals(pointController.currentPoint.value!.saveCo2, 2)}KG'),
                            Container(
                              height: 100,
                              width: 4,
                              decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            AchivementItem(
                                image: 'assets/images/recycle.png',
                                title: 'RECYCLED',
                                value: pointController
                                    .currentPoint.value!.totalTrashCollect
                                    .toString()),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const AboutMe());
                    },
                    child: const Tile(
                        icon: 'assets/icons/aboutme.svg',
                        haveArrowRight: true,
                        title: 'About me'),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const HistoryPoint());
                    },
                    child: const Tile(
                        icon: 'assets/icons/myhistory.svg',
                        haveArrowRight: true,
                        title: 'My history'),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const NotificationSetting());
                    },
                    child: const Tile(
                        icon: 'assets/icons/notification.svg',
                        haveArrowRight: true,
                        title: 'Notifications'),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const ChangePassword());
                    },
                    child: const Tile(
                        icon: 'assets/icons/change_password.svg',
                        haveArrowRight: true,
                        title: 'Change password'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Other',
                        style: kLableTextStyle18Grey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Tile(
                      icon: 'assets/icons/version.svg',
                      haveArrowRight: false,
                      title: 'Version',
                      rightContent: '1.1.0'),
                  InkWell(
                    onTap: () async {
                      final SharedPreferences prefs = await _prefs;
                      prefs.clear();
                      Get.offAll(() => const Welcome());
                    },
                    child: const Tile(
                      icon: 'assets/icons/signout.svg',
                      haveArrowRight: false,
                      title: 'Sign out',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
