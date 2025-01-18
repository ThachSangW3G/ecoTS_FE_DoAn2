import 'package:ecots_fe/components/new_feeds/comment_section.dart';
import 'package:ecots_fe/components/new_feeds/new_feed_card.dart';
import 'package:ecots_fe/constants/app_colors.dart';
import 'package:ecots_fe/controllers/newsfeed_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/new_feeds/voting_options.dart';
import '../../constants/app_style.dart';
import '../../models/newsfeeds/newsfeed.dart';

class TabExplore extends StatefulWidget {
  const TabExplore({super.key});

  @override
  State<TabExplore> createState() => _TabExploreState();
}

class _TabExploreState extends State<TabExplore> {
  final NewsfeedController _newsfeedController = Get.put(NewsfeedController());

  @override
  void initState() {
    super.initState();
    _getExploreNewsfeed();
  }

  List<Newsfeed> exploreNewsfeed = [];
  void _getExploreNewsfeed() async {
    exploreNewsfeed = await _newsfeedController.getAllNewsfeed();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exploreNewsfeed.length,
      itemBuilder: (BuildContext context, int index) {
        return NewFeedCard(newsfeed: exploreNewsfeed[index]);
      },
    );
  }
}
