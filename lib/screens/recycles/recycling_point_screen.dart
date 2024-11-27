
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../components/home/nearby_item.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/location_controller.dart';
import '../../models/locations/location.dart';
import '../maps/map.dart';

class RecyclingPointScreen extends StatefulWidget {
  const RecyclingPointScreen({super.key});

  @override
  State<RecyclingPointScreen> createState() => _RecyclingPointScreenState();
}

class _RecyclingPointScreenState extends State<RecyclingPointScreen> {
  LocationController locationController = Get.put(LocationController());
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add listener to search controller
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // Call setState to rebuild the widget with the filtered list
    setState(() {});
  }

  List<Location> get filteredLocations {
    if (searchController.text.isEmpty) {
      return locationController.locationList.value!;
    } else {
      return locationController.locationList.value!
          .where((location) => location.locationName
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recycling Point',
          style: kLableTextStyleTilte22Green,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  controller: searchController,
                  cursorColor: AppColors.green,
                  decoration: InputDecoration(
                      hintText: 'Search donation',
                      hintStyle: kLableTextStyleMiniumGrey,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset('assets/icons/search.svg'),
                      )),
                ),
              ),
              const Gap(10),
              Obx(() => filteredLocations.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredLocations.length,
                      itemBuilder: (context, index) {
                        final location = filteredLocations[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => MapScreen(
                                  choosePoint: LatLng(
                                      location.latitude, location.longitude),
                                ));
                          },
                          child: NearbyItem(
                            location: location,
                          ),
                        );
                      },
                    )
                  : const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
