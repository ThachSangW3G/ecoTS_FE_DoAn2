
import 'package:ecots_fe/screens/staff/qr_scanner_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../splash/welcome.dart';

class HomeScreenStaff extends StatefulWidget {
  const HomeScreenStaff({super.key});

  @override
  State<HomeScreenStaff> createState() => _HomeScreenStaffState();
}

class _HomeScreenStaffState extends State<HomeScreenStaff> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(

                        // image: DecorationImage(
                        //     image: userController
                        //                 .currentUser.value!.avatarUrl !=
                        //             null
                        //         ? NetworkImage(userController
                        //             .currentUser.value!.avatarUrl!)
                        //         : const AssetImage(
                        //                 'assets/images/default_avatar.jpg')
                        //             as ImageProvider,
                        //     fit: BoxFit.cover),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(width: 1, color: AppColors.gray)),

                    // child: ClipOval(
                    //   child: Image.network(
                    //     userController.currentUser.value!.avatarUrl!,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, ', style: kLableTextStyleTilteGreen),
                        Text('Welcome back !',
                            style: kLableTextStyleMiniumGrey),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () async {
                            final SharedPreferences prefs = await _prefs;
                            prefs.clear();
                            Get.offAll(() => const Welcome());
                          },
                          child: SvgPicture.asset('assets/icons/signout.svg')),
                    ],
                  ))
                ],
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const QrScannerScreen());
                },
                child: Container(
                  height: 130,
                  width: 120,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.whisper,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffE6F2EA)),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/recycle.svg',
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      Text(
                        'Recycle',
                        style: kLableTextStyleTilteGreen,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
