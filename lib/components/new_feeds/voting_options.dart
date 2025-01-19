import 'package:ecots_fe/models/polls/poll.dart';
import 'package:flutter/material.dart';

class VotingOptions extends StatefulWidget {
  final Poll poll;
  const VotingOptions({super.key, required this.poll});

  @override
  State<VotingOptions> createState() => _VotingOptionsState();
}

class _VotingOptionsState extends State<VotingOptions> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.poll.pollOptions.length, (index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Radio<int>(
            value: index,
            groupValue: selectedOption,
            onChanged: (int? value) {
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
