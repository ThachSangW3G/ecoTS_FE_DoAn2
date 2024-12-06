import 'package:flutter/material.dart';

import '../../constants/app_style.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample comments data
    final List<Map<String, String>> comments = [
      {
        "name": "Jackie Jones",
        "time": "30 mins",
        "comment":
        "Pellentesque turpis ornare pharetra pharetra, amet amet adipiscing. Quis feugiat eget commodo aenean. Maecenas id lectus ultrices egestas odio vitae pharetra, aliquam hendrerit. Enim turpis sed aliquam orci lacus, dictumst. In porta faucibus sed turpis massa. Donec pulvinar pulvinar en...",
      },
      {
        "name": "Omar Botosh",
        "time": "30 mins",
        "comment":
        "Lorem tempus lorem quis mattis cras consectetur quam. Nunc tellus faucibus.",
      },
    ];

    return Scaffold(
      appBar: AppBar(title:  Text("Comments", style: kLableTextBlackW600,)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Info
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[300],
                              child: const Icon(Icons.person, size: 20, color: Colors.grey),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment["name"]!,
                                  style: kLableTextGreenWeightW600Size16,
                                ),
                                Text(
                                  comment["time"]!,
                                  style: kLableTextItalic,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Comment Content
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            comment["comment"]!,
                            style: kLableTextBlackSize16,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Actions (Like, Reply, View Replies)
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.thumb_up_alt_outlined, size: 16),
                              label: const Text("Like", style: TextStyle(fontSize: 14)),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.reply, size: 16),
                              label: const Text("Reply", style: TextStyle(fontSize: 14)),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "View replies",
                                style: TextStyle(fontSize: 14, color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // View all comments
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "View all comments...",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}