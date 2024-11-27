

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../login_signup/login_screen.dart';
import '../login_signup/signup_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
              decoration: const BoxDecoration(color: AppColors.green),
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
                  Text('EcoTS', style: kLableTextStyleLogoWhite),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
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
                    Text(
                      'Welcome!',
                      style: kLableTextStyleBigGreen,
                    ),
                    Text(
                      'Together, we can build the better world',
                      textAlign: TextAlign.center,
                      style: kLableTextStyleMediumGreen,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const LoginScreen());
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: AppColors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SignupScreen());
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.green, width: 2),
                                color: AppColors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: AppColors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
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
