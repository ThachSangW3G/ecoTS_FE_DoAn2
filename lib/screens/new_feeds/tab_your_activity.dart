import 'package:ecots_fe/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/new_feeds/new_feed_card.dart';
import '../../controllers/newsfeed_controller.dart';
import '../../models/newsfeeds/newsfeed.dart';

class TabYourActivity extends StatefulWidget {
  const TabYourActivity({super.key});

  @override
  State<TabYourActivity> createState() => _TabYourActivityState();
}

class _TabYourActivityState extends State<TabYourActivity> {
  final NewsfeedController _newsfeedController = Get.put(NewsfeedController());
  final UserController _userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    _getExploreNewsfeed();
  }

  List<Newsfeed> exploreNewsfeed = [];
  void _getExploreNewsfeed() async {
    exploreNewsfeed = await _newsfeedController
        .getYourNewsfeed(_userController.currentUser.value!.id);
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
