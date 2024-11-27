
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/donation/ended_donate_tab.dart';
import '../../components/donation/ongoing_donate_tab.dart';
import '../../components/donation/upcoming_donate_tab.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/donation_controller.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen>
    with SingleTickerProviderStateMixin {
  DonationController donationController = Get.put(DonationController());

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whisper,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: Text(
          'Donation',
          style: kLableTextStyleLogoScreenWhite,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.green,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Upcoming',
                    style: kLableTextStyle18White,
                  ),
                ),
                Tab(
                  child: Text(
                    'Ongoing',
                    style: kLableTextStyle18White,
                  ),
                ),
                Tab(
                  child: Text(
                    'Ended',
                    style: kLableTextStyle18White,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                UpcomingDonateTab(),
                OngoingDonateTab(),
                EndedDonateTab()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
