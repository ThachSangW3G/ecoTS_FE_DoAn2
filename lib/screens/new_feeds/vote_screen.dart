import 'package:ecots_fe/models/polls/vote.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_style.dart';
import '../../models/polls/poll.dart';

class VoteScreen extends StatefulWidget {
  final Poll poll;
  const VoteScreen({super.key, required this.poll});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Votes",
          style: kLableTextBlackW600,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
            itemCount: widget.poll.pollOptions.length,
            itemBuilder: (context, index) {
              final pollOption = widget.poll.pollOptions[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        pollOption.type,
                        style: kLableTextStyleTilteGreen,
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: pollOption.votes.length,
                    itemBuilder: (context, index) =>
                        _buildUserCard(pollOption.votes[index]),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget _buildUserCard(Vote vote) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: vote.avatarUrl != null
                        ? NetworkImage(vote.avatarUrl!)
                        : const AssetImage('assets/images/default_avatar.jpg')
                            as ImageProvider)),
          ),
          Gap(10),
          Text(
            vote.fullName,
            style: kLableTilte16Black,
          )
        ],
      ),
    );
  }
}
