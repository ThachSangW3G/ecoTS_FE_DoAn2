import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


import '../../components/donation/button_green.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/camera_controller.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/waste_controller.dart';
import '../../models/wastes/waste.dart';

class ValidatingScreen extends StatefulWidget {
  final File file;
  final String waste;
  const ValidatingScreen({super.key, required this.file, required this.waste});

  @override
  State<ValidatingScreen> createState() => _ValidatingScreenState();
}

class _ValidatingScreenState extends State<ValidatingScreen> {
  WasteController wasteController = Get.put(WasteController());
  CameraControl cameraController = Get.put(CameraControl());
  UserController userController = Get.put(UserController());

  TextEditingController description = TextEditingController();

  Waste? waste;
  bool isLoadingResponse = false;

  Future<void> handleResponse() async {
    setState(() {
      isLoadingResponse = true;
    });
    try {
      final response = await cameraController.sendRespond(
          userController.currentUser.value!.id, description.text, widget.file);
      if (response) {
        Navigator.pop(context);
        Get.snackbar('Success', 'Successful response');
      }

      print(response);
    } catch (e) {}

    setState(() {
      isLoadingResponse = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waste = wasteController.materialList.value!
        .firstWhere((element) => element.name == widget.waste);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Validating',
          style: kLableTextStyleTilteGreen,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                        fit: BoxFit.cover,
                        height: 500,
                        width: 350,
                        opacity: const AlwaysStoppedAnimation(07),
                        image: FileImage(File(widget.file.path))),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.concrete,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Material', style: kLableTilteBlack),
                      const Gap(10),
                      Text(waste != null ? waste!.name : widget.waste,
                          style: kLableTextStyleMiniumGrey),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Points', style: kLableTilteBlack),
                      const Gap(10),
                      Text(
                          waste != null
                              ? waste!.pointsPerKg.toString()
                              : 'none',
                          style: kLableTextStyleMiniumGrey),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Save CO2', style: kLableTilteBlack),
                      const Gap(10),
                      Text(
                          waste != null
                              ? waste!.co2SavedPerKg.toString()
                              : 'none',
                          style: kLableTextStyleMiniumGrey),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonGreen(
                      title: 'Continue',
                      onClick: () {
                        Get.back();
                      }),
                  ButtonGreen(
                      title: 'Response',
                      onClick: () {
                        openDialog();
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'Response detect',
              style: kLableTextBlackW600,
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: description,
                maxLines: 10,
                minLines: 1,
                style: kLableTextBlackSize16,
                decoration:
                    const InputDecoration(hintText: 'Enter your response here'),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('CANCEL')),
              TextButton(
                  onPressed: handleResponse,
                  child: isLoadingResponse
                      ? const CircularProgressIndicator()
                      : const Text('SUBMIT'))
            ],
          ));
}
