import 'dart:io';

import 'package:camera/camera.dart';
import 'package:ecots_fe/screens/cameras/validating.dart';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/camera_controller.dart';
import '../../controllers/user_controller.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue;
  final cameraControll = Get.put(CameraControl());
  final userControler = Get.put(UserController());
  bool isFlashOn = false;
  bool isRearCamera = true;

  bool isLoading = false;

  void startCamera(int camera) {
    cameraController = CameraController(
      cameraControll.cameras.value![camera],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraValue = cameraController.initialize();
  }

  @override
  void initState() {
    startCamera(0);
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  Future<File> saveImage(XFile image) async {
    final downlaodPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpeg';
    final file = File('$downlaodPath/$fileName');

    try {
      await file.writeAsBytes(await image.readAsBytes());
    } catch (_) {}

    return file;
  }

  void takePicture() async {
    XFile? image;

    setState(() {
      isLoading = true;
    });

    if (cameraController.value.isTakingPicture ||
        !cameraController.value.isInitialized) {
      return;
    }

    if (isFlashOn == false) {
      await cameraController.setFlashMode(FlashMode.off);
    } else {
      await cameraController.setFlashMode(FlashMode.torch);
    }
    image = await cameraController.takePicture();

    if (cameraController.value.flashMode == FlashMode.torch) {
      setState(() {
        cameraController.setFlashMode(FlashMode.off);
      });
    }

    final file = await saveImage(image);

    final result = await cameraControll.getWasteClassification(
        userControler.currentUser.value!.id, file);

    setState(() {
      isLoading = false;
    });

    if (result != null) {
      print(result);
      Get.to(() => ValidatingScreen(
            file: file,
            waste: result,
          ));
    } else {
      final snackdemo = SnackBar(
        content: Text(
          'Không tải được dữ liệu!',
          style: kLableW800White,
        ),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(255, 255, 255, .7),
        shape: const CircleBorder(),
        onPressed: takePicture,
        child: const Icon(
          Icons.camera_alt,
          size: 40,
          color: Colors.black87,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Waste Classification',
          style: kLableTextStyleTilteGreen,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: 100,
                      child: CameraPreview(cameraController),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SafeArea(
              child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 5, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFlashOn = !isFlashOn;
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(50, 0, 0, 0),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: isFlashOn
                            ? const Icon(
                                Icons.flash_on,
                                color: Colors.white,
                                size: 30,
                              )
                            : const Icon(
                                Icons.flash_off,
                                color: Colors.white,
                                size: 30,
                              ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRearCamera = !isRearCamera;
                      });
                      isRearCamera ? startCamera(0) : startCamera(1);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(50, 0, 0, 0),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: isRearCamera
                            ? const Icon(
                                Icons.camera_rear,
                                color: Colors.white,
                                size: 30,
                              )
                            : const Icon(
                                Icons.camera_front,
                                color: Colors.white,
                                size: 30,
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          SizedBox(
            width: size.width,
            child: Center(
              child: isLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: AppColors.green,
                        ),
                        Text(
                          'Please await',
                          style: kLableTextStyleSize26Green,
                        ),
                        Text(
                          'Let us take a moment to verify...',
                          style: kLableTextStyleMiniumGrey,
                        )
                      ],
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
