import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/donation_controller.dart';
import '../../models/donations/donation.dart';
import '../../screens/donation/detail_donate.dart';
import 'donation_item_detail.dart';

class EndedDonateTab extends StatefulWidget {
  const EndedDonateTab({super.key});

  @override
  State<EndedDonateTab> createState() => _EndedDonateTabState();
}

class _EndedDonateTabState extends State<EndedDonateTab> {
  DonationController donationController = Get.put(DonationController());
  TextEditingController searchController = TextEditingController();

  late Timer _timer;

  void _startPolling() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      donationController.getEndedDonations(); // Call getOngoingDonations here
    });
  }

  @override
  void initState() {
    super.initState();
    _startPolling();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  List<Donation> get filterDonations {
    if (searchController.text.isEmpty) {
      return donationController.endedDonationList.value!;
    } else {
      return donationController.endedDonationList.value!
          .where((donation) => donation.title
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              padding: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
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
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => filterDonations.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      shrinkWrap: true,
                      itemCount: filterDonations.length,
                      itemBuilder: (context, index) {
                        final donation = filterDonations[index];
                        return DonationItemDetail(
                          donation: donation,
                          onTap: () {
                            Get.to(
                              () => DetailDonate(donationId: donation.id),
                            );
                          },
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
