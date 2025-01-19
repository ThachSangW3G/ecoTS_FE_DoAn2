import 'package:ecots_fe/models/polls/vote.dart';

class PollOption {
  final int id;
  final String type;
  final List<Vote> votes;

  PollOption({required this.id, required this.type, required this.votes});

  factory PollOption.fromJson(Map<String, dynamic> json) {
    return PollOption(
      id: json['id'],
      type: json['type'],
      votes: (json['votes'] as List<dynamic>?)
              ?.map((e) => Vote.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'votes': votes.map((vote) => vote.toJson()).toList()
    };
  }
}
