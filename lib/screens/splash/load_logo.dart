import 'dart:async';


import 'package:ecots_fe/screens/splash/splash_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/achivement_controller.dart';
import '../../controllers/achivemetn_level_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/donation_controller.dart';
import '../../controllers/generate_barcode_controller.dart';
import '../../controllers/location_controller.dart';
import '../../controllers/point_controller.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/waste_controller.dart';
import '../bottom_nav/bottom_nav.dart';
import '../staff/home_screen_staff.dart';

class LoadLogo extends StatefulWidget {
  const LoadLogo({super.key});

  @override
  State<LoadLogo> createState() => _LoadLogoState();
}

class _LoadLogoState extends State<LoadLogo> {
  late SharedPreferences prefs;

  AuthController authController = Get.put(AuthController());
  UserController userController = Get.put(UserController());
  DonationController donationController = Get.put(DonationController());
  GenerateBarcodeController generateBarcodeController =
      Get.put(GenerateBarcodeController());

  WasteController wasteController = Get.put(WasteController());

  LocationController locationController = Get.put(LocationController());
  PointController pointController = Get.put(PointController());
  AchivementController achivementController = Get.put(AchivementController());
  AchivementLevelController achivementLevelController =
      Get.put(AchivementLevelController());

  void handleLocal() async {
    prefs = await SharedPreferences.getInstance();

    String? tokenAccess = prefs.getString('tokenAccess');

    if (tokenAccess != null) {
      final role = prefs.getString('role');

      if (role != null && role == 'CUSTOMER') {
        final accessToken = prefs.getString('tokenAccess');

        await userController.getUserByToken(accessToken!);
        await generateBarcodeController.genenerateBarcode();
        await donationController.getAllDonations();
        await locationController.getAllLocations();

        await pointController.getPointByToken();
        await wasteController.getAllMaterials();
        await achivementController.fetchAchievements();
        await achivementLevelController
            .fetchAchievementResults(userController.currentUser.value!.id);

        Get.to(() => const BottomNavigation());
      } else if (role != null && role == 'EMPLOYEE') {
        final accessToken = prefs.getString('tokenAccess');
        await userController.getUserByToken(accessToken!);

        Get.to(() => const HomeScreenStaff());
      }
    } else {
      Timer(const Duration(seconds: 3), () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => const SplashOne()));
        Get.to(() => const SplashOne());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const SplashOne()));
      Get.to(() => const SplashOne());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'))),
            ),
            Text('EcoTS', style: kLableTextStyleLogoScreen)
          ],
        ),
      ),
    );
  }
}
