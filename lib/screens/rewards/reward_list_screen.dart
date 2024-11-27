import 'package:ecots_fe/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../components/rewards/gift.dart';
import '../../constants/app_style.dart';

class RewardListScreen extends StatefulWidget {
  const RewardListScreen({super.key});

  @override
  State<RewardListScreen> createState() => _RewardListScreenState();
}

class _RewardListScreenState extends State<RewardListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward', style: kLableTextStyleTilte22Green),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(8.0), child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Tree', style: kLableTextBlackW600),
          Expanded(
            child: GridView.count(crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: List.generate(8, (index){
                return Gift();},  ),
            ),
          )
        ],)
      ),
    );
  }
}
