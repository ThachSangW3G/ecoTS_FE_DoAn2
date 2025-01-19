import 'package:ecots_fe/models/newsfeeds/newsfeed.dart';
import 'package:ecots_fe/models/polls/poll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/poll_controller.dart';
import '../../controllers/user_controller.dart';

class VotingOptions extends StatefulWidget {
  final Poll poll;
  final Newsfeed newsfeed;
  const VotingOptions({super.key, required this.poll, required this.newsfeed});

  @override
  State<VotingOptions> createState() => _VotingOptionsState();
}

class _VotingOptionsState extends State<VotingOptions> {
  final UserController _userController = Get.find();
  final PollController _pollController = Get.put(PollController());

  int? selectedOption;

  @override
  initState() {
    super.initState();
    getMyVoteId();
  }

  void getMyVoteId() async {
    final myVoteId = await _pollController.getVoteId(
        _userController.currentUser.value!.id, widget.newsfeed.id);
    _findPollOptionId(myVoteId);
    setState(() {});
  }

  Future<void> changeOption(int value) async {
    final myVoteId = await _pollController.getVoteId(
        _userController.currentUser.value!.id, widget.newsfeed.id);

    if (myVoteId != null) {
      final success = await _pollController.deleteVote(
          widget.newsfeed.id, selectedOption!, myVoteId);

      if (success) {
        final votePoll = await _pollController.votePoll(
            widget.newsfeed.id, value, _userController.currentUser.value!.id);

        if (votePoll) {
          getMyVoteId();
        }
      }
    }
  }

  void _findPollOptionId(int? voteId) {
    if (voteId == null) {
      return;
    }
    for (var option in widget.poll.pollOptions) {
      if (option.votes.where((vote) => vote.id == voteId).isNotEmpty) {
        setState(() {
          selectedOption = option.id;
        });
        break;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.poll.pollOptions.length, (index) {
        final pollOption = widget.poll.pollOptions[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Radio<int>(
            value: pollOption.id,
            groupValue: selectedOption,
            onChanged: (int? value) {
              if (value != selectedOption) {
                changeOption(value!);
              }
              setState(() {
                selectedOption = value;
              });
            },
          ),
          title: Text(widget.poll.pollOptions[index].type),
        );
      }),
    );
  }
}
