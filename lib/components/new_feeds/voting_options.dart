
import 'package:flutter/material.dart';

class VotingOptions extends StatefulWidget {
  const VotingOptions({super.key});

  @override
  State<VotingOptions> createState() => _VotingOptionsState();
}

class _VotingOptionsState extends State<VotingOptions> {
  int? selectedOption;

  final List<String> options = ['Tham gia', 'Không tham gia'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(options.length, (index) {
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
          title: Text(options[index]),
        );
      }),
    );
  }
}