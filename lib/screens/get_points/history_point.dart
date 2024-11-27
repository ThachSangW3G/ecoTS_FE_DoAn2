
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import 'donation_point_tab.dart';
import 'earn_points_tab.dart';


class HistoryPoint extends StatefulWidget {
  const HistoryPoint({super.key});

  @override
  State<HistoryPoint> createState() => _HistoryPointState();
}

class _HistoryPointState extends State<HistoryPoint>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.concrete,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: Text('History Point', style: kLableTextStyleTilte22White),
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
                    'Nhận điểm',
                    style: kLableTextStyle18White,
                  ),
                ),
                Tab(
                  child: Text(
                    'Quyên góp',
                    style: kLableTextStyle18White,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [EarnPointsTab(), DonationPointTab()],
            ),
          ),
        ],
      ),
    );
  }
}
