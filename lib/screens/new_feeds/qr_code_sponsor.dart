import 'dart:typed_data';

import 'package:ecots_fe/controllers/newsfeed_controller.dart';
import 'package:ecots_fe/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../constants/app_style.dart';
import '../bottom_nav/bottom_nav.dart';

class QRCodeSponsorScreen extends StatefulWidget {
  const QRCodeSponsorScreen({super.key});

  @override
  State<QRCodeSponsorScreen> createState() => _QRCodeSponsorScreenState();
}

class _QRCodeSponsorScreenState extends State<QRCodeSponsorScreen> {
  final UserController _userController = Get.find();
  final NewsfeedController _newsfeedController = Get.find();

  bool _isLoading = false;

  void qrCodeUser(int qrCodeId) async {
    setState(() {
      _isLoading = true;
    });
    final success = await _newsfeedController.qrCodeUse(
        qrCodeId, _userController.currentUser.value!.email!);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Get point by acctivity successfully'),
        ),
      );

      Get.off(() => const BottomNavigation());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Get point by acctivity failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'QR Scanner',
        style: kLableTextStyleTilte22Green,
      )),
      body: Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;

              final Uint8List? image = capture.image;
              print(barcodes.first.rawValue);

              if (barcodes.first.rawValue != null) {
                final qrCodeId = barcodes.first.rawValue!;
                qrCodeUser(int.parse(qrCodeId));
              }
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
