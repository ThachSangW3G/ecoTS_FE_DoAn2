
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/generate_barcode_controller.dart';
import '../../controllers/user_controller.dart';

class ScanBarcodeScreen extends StatefulWidget {
  const ScanBarcodeScreen({super.key});

  @override
  State<ScanBarcodeScreen> createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends State<ScanBarcodeScreen> {
  GenerateBarcodeController generateBarcodeController =
      Get.put(GenerateBarcodeController());

  UserController userController = Get.put(UserController());

  Future<void> loadBarCode() async {
    await generateBarcodeController.genenerateBarcode();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBarCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tích điểm',
          style: kLableTextStyleSize26Green,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userController.currentUser.value!.fullName!,
                style: kLableTilteBlack,
              ),
              SizedBox(height: 10),
              Text(
                userController.currentUser.value!.email!,
                style: kLableTextStyleMiniumGrey,
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text(
                'Give this QR code to the staff to exchange for rewards points immediately!',
                style: kLableTextStyleMiniumGrey,
              ),
              SizedBox(height: 20),
              generateBarcodeController.barCode.value != null
                  ? Obx(() =>
                      Image.memory(generateBarcodeController.barCode.value!))
                  : InkWell(
                      onTap: () {
                        print(generateBarcodeController.barCode.value);
                      },
                      child: const Text('123'))
            ],
          ),
        ),
      ),
    );
  }
}
