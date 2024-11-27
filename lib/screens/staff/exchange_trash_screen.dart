
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constants/app_border.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/point_controller.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/waste_controller.dart';
import '../login_signup/successful_screen.dart';

class ExchangeTrashScreen extends StatefulWidget {
  final String username;
  final String email;
  const ExchangeTrashScreen(
      {super.key, required this.username, required this.email});

  @override
  State<ExchangeTrashScreen> createState() => _ExchangeTrashScreenState();
}

class _ExchangeTrashScreenState extends State<ExchangeTrashScreen> {
  List<TextEditingController> controllers = [];

  WasteController wasteController = Get.put(WasteController());
  PointController pointController = Get.put(PointController());
  UserController userController = Get.put(UserController());

  double total = 0.0;
  bool isLoading = false;

  Future<void> handleMaterial() async {
    await wasteController.getAllMaterials();
    for (int i = 0; i < wasteController.materialList.value!.length; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleMaterial();
  }

  Future<void> handleExchangeTrash() async {
    setState(() {
      isLoading = true;
    });

    final success = await pointController.exchangeTrashForm(
        widget.username,
        widget.email,
        userController.currentUser.value!.id,
        controllers,
        wasteController.materialList.value!);

    if (success) {
      Get.to(() => const SuccessfulScreen());
    }

    setState(() {
      isLoading = false;
    });
  }

  void calculateTotalPoint() {
    double points = 0.0;
    for (int i = 0; i < wasteController.materialList.value!.length; i++) {
      if (controllers[i].text.isNotEmpty) {
        points += double.parse(controllers[i].text) *
            wasteController.materialList.value![i].pointsPerKg;
      }
    }
    setState(() {
      total = points;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange Trash', style: kLableTextStyleTilte22Green),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.username,
                      style: kLableTextBlackW600,
                    ),
                    Text(
                      widget.email,
                      style: kLableTextGreyItalic,
                    ),
                    Obx(() => wasteController.materialList.value != null &&
                            wasteController.materialList.value!.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                wasteController.materialList.value!.length,
                            itemBuilder: (context, index) {
                              final waste =
                                  wasteController.materialList.value![index];
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  controller: controllers[index],
                                  style: kLableTextBlackMinium,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      contentPadding: borderRadiusTextField,
                                      labelText: waste.name,
                                      labelStyle: kLableTextBlackMinium,
                                      focusedBorder: borderTextFieldFocus,
                                      border: borderTextField),
                                  onChanged: (value) => calculateTotalPoint(),
                                ),
                              );
                            },
                          )
                        : const SizedBox()),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total point:', style: kLableTextBlackW600),
                        Text(total.toString(), style: kLableTextBlackW600),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: InkWell(
                    onTap: handleExchangeTrash,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: const BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: isLoading == true
                            ? const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              )
                            : Text(
                                'Exchange',
                                style: kLableBoldWhite,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
