import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../components/donation/button_donation.dart';
import '../../components/home/skelton.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/donation_controller.dart';
import '../../controllers/point_controller.dart';
import '../../models/donations/donation.dart';

class DetailDonate extends StatefulWidget {
  const DetailDonate({super.key, required this.donationId});

  final int donationId;

  @override
  State<DetailDonate> createState() => _DetailDonateState();
}

class _DetailDonateState extends State<DetailDonate> {
  int? selectPoint;

  DonationController donationController = Get.put(DonationController());

  PointController pointController = Get.put(PointController());

  bool _isLoading = false;

  Donation? donation;

  Future<void> getDonation() async {
    print(widget.donationId);
    donation = await donationController.getDonationById(widget.donationId);
    setState(() {
      print(donation);
    });
  }

  @override
  void initState() {
    super.initState();
    getDonation();
  }

  Future<void> donatePoint() async {
    if (selectPoint == null) {
      final snackdemo = SnackBar(
        content: Text(
          'Vui lòng cung cấp số điểm!',
          style: kLableW800White,
        ),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final success =
        await donationController.donatePoint(selectPoint!, widget.donationId);

    if (success) {
      _showSuccessDialog(context);
      await donationController.getAllDonations();
      getDonation();
      await pointController.getPointByToken();
    } else {
      final snackdemo = SnackBar(
        content: Text(
          'Quyên góp điểm không thành công!',
          style: kLableW800White,
        ),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _showSuccessDialog(BuildContext context) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'Donation success',
            titleTextStyle: kLableTextStyleSize26Green,
            desc: "Thank you for your donation",
            descTextStyle: kLableTextStyleTilteGreen)
        .show();
  }

  TextEditingController pointTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whisper,
      appBar: AppBar(
        title: Text(
          'Donation',
          style: kLableTextStyleLogoScreen,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              donation == null
                  ? const Skelton(height: 350, widget: 350)
                  : Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                donation!.coverImageUrl[0],
                              )),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          )),
                    ),
              const SizedBox(
                height: 10,
              ),
              donation == null
                  ? const Skelton()
                  : Text(donation!.title,
                      maxLines: 2, style: kLableTextStyleSize26Green),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2000+ Donated',
                        style: kLableTextStyleTilteGreen,
                      ),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: 100,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: AppColors.shamrock,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2.0, color: AppColors.white)),
                          ),
                          Positioned(
                            left: 20,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.shamrock,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2.0, color: AppColors.white)),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.shamrock,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2.0, color: AppColors.white)),
                            ),
                          ),
                          Positioned(
                            left: 60,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.shamrock,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2.0, color: AppColors.white)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  donation == null
                      ? const Skelton()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Total Donation',
                              style: kLableTextStyleTilteGreen,
                            ),
                            Text(
                              '${donation!.totalDonations} POINTS',
                              style: kLableTextBlackW600,
                            )
                          ],
                        )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start date',
                        style: kLableTextStyleTilteGreen,
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(donation!.startDate),
                        style: kLableTextStyleMiniumGrey,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'End date',
                        style: kLableTextStyleTilteGreen,
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(donation!.endDate),
                        style: kLableTextStyleMiniumGrey,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPoint = 50;
                      });
                    },
                    child: Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              width: 2,
                              color: selectPoint == 50
                                  ? AppColors.green
                                  : AppColors.gray)),
                      child: Center(
                        child: Text(
                          '50\nPOINT',
                          textAlign: TextAlign.center,
                          style: selectPoint == 50
                              ? kLableTextStyleTilteGreen
                              : kLableTilteBlack,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPoint = 100;
                      });
                    },
                    child: Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              width: 2,
                              color: selectPoint == 100
                                  ? AppColors.green
                                  : AppColors.gray)),
                      child: Center(
                        child: Text(
                          '100\nPOINT',
                          textAlign: TextAlign.center,
                          style: selectPoint == 100
                              ? kLableTextStyleTilteGreen
                              : kLableTilteBlack,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPoint = 500;
                      });
                    },
                    child: Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              width: 2,
                              color: selectPoint == 500
                                  ? AppColors.green
                                  : AppColors.gray)),
                      child: Center(
                        child: Text(
                          '500\nPOINT',
                          textAlign: TextAlign.center,
                          style: selectPoint == 500
                              ? kLableTextStyleTilteGreen
                              : kLableTilteBlack,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      height: 1.0,
                      indent: 2.0,
                      color: AppColors.stack,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: AppColors.stack, fontSize: 16)),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      height: 1.0,
                      color: AppColors.stack,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                height: 90,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 235, 233, 233)),
                child: Center(
                  child: TextFormField(
                    controller: pointTextController,
                    style: kLableTilteBlack,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        selectPoint = int.parse(pointTextController.text);
                        print(selectPoint);
                      });
                    },
                    cursorColor: AppColors.green,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter RuntahPoint Manually",
                        hintStyle: kLableTextStyle18Grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonDonation(
                isLoading: _isLoading,
                title: 'Donante now',
                onClick: donatePoint,
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              donation == null
                  ? const Skelton()
                  : Text(
                      donation!.description,
                      style: kLableTextStyleMiniumGrey,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
