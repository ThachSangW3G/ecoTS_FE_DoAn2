import 'package:ecots_fe/models/polls/poll_option.dart';

class Poll {
  final int id;
  final String title;
  final List<PollOption> pollOptions;

  Poll({required this.id, required this.title, required this.pollOptions});

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      id: json['id'],
      title: json['title'],
      pollOptions: (json['pollOptions'] as List<dynamic>?)
              ?.map((e) => PollOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'pollOptions': pollOptions.map((option) => option.toJson()).toList(),
    };
  }
}
