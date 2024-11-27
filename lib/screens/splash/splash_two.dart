
import 'package:ecots_fe/screens/splash/splash_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../components/splash/circle.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class SplashTwo extends StatefulWidget {
  const SplashTwo({super.key});

  @override
  State<SplashTwo> createState() => _SplashTwoState();
}

class _SplashTwoState extends State<SplashTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 590,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/splash2.png'))),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/bgplash.png'))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 80, left: 50, right: 50, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Circle(
                          size: 10,
                          color: AppColors.gray,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Circle(
                          size: 10,
                          color: AppColors.green,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Circle(
                          size: 10,
                          color: AppColors.gray,
                        ),
                      ],
                    ),
                    Text('Good become greater',
                        textAlign: TextAlign.center,
                        style: kLableTextStyleBigGreen),
                    Text('Easily sort waste quickly.',
                        textAlign: TextAlign.center,
                        style: kLableTextStyleMediumGreen),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: AppColors.gray),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: AppColors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Back',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 194, 194, 194),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const SplashThree(),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            width: 140,
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: AppColors.green),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
