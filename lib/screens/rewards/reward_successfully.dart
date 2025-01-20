import 'package:ecots_fe/screens/rewards/reward_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../components/login_signup/button_green.dart';
import '../../constants/app_colors.dart';
import '../bottom_nav/bottom_nav.dart';

class RewardSuccessfully extends StatefulWidget {
  const RewardSuccessfully({super.key});

  @override
  State<RewardSuccessfully> createState() => _RewardSuccessfullyState();
}

class _RewardSuccessfullyState extends State<RewardSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/successful.png'))),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your reward has been successfully added !',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.off(() => const BottomNavigation());
              },
              child: const ButtonGreen(
                title: 'Back to Rewards',
              ),
            )
          ],
        ),
      ),
    );
  }
}
