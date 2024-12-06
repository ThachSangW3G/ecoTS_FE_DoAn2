import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_style.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Votes", style: kLableTextBlackW600,),
      centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tham gia', style: kLableTextStyleTilteGreen,),
              _buildUserCard(),
              _buildUserCard(),
              _buildUserCard(),
              _buildUserCard(),
              _buildUserCard(),
          
              Text('Không tham gia', style: kLableTextStyleTilteGreen,),
              _buildUserCard(),
              _buildUserCard(),
              _buildUserCard(),
              _buildUserCard(),
              _buildUserCard(),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard() {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/images/default_avatar.jpg'))
            ),
          ),
          Gap(10),
          Text('Thạch Sang', style: kLableTilte16Black,)
        ],
      ),
    );
  }

}
