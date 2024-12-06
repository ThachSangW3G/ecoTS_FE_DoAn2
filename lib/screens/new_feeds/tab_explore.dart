import 'package:ecots_fe/components/new_feeds/comment_section.dart';
import 'package:ecots_fe/components/new_feeds/new_feed_card.dart';
import 'package:ecots_fe/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/new_feeds/voting_options.dart';
import '../../constants/app_style.dart';

class TabExplore extends StatefulWidget {
  const TabExplore({super.key});

  @override
  State<TabExplore> createState() => _TabExploreState();
}

class _TabExploreState extends State<TabExplore> {
  @override
  Widget build(BuildContext context) {
    return ListView(

      children: [
        NewFeedCard(),
        NewFeedCard(),
        NewFeedCard(),
      ],
    );
  }


}
