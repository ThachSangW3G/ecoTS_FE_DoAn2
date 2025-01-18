import 'package:ecots_fe/components/new_feeds/skeleton.dart';
import 'package:ecots_fe/models/comments/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_style.dart';
import '../../controllers/user_controller.dart';
import '../../models/user.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;
  const CommentCard({super.key, required this.comment});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  final UserController _userController = Get.find();

  User? user;

  @override
  initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    user = await _userController.getUserById(widget.comment.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: user != null && user?.avatarUrl != null
                          ? NetworkImage(user!.avatarUrl!)
                          : const AssetImage('assets/images/default_avatar.jpg')
                              as ImageProvider,
                    )),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  user != null
                      ? Text(
                          user!.fullName!,
                          style: kLableTextGreenWeightW600Size16,
                        )
                      : const Skeleton(
                          height: 20,
                          width: 200,
                        ),
                  Text(
                    '30 mins',
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
              widget.comment.message,
              style: kLableTextBlackSize16,
            ),
          ),
          const SizedBox(height: 8),

          widget.comment.imgUrls != null && widget.comment.imgUrls!.isNotEmpty
              ? Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    widget.comment.imgUrls![0],
                    fit: BoxFit.cover,
                  ),
                )
              : const SizedBox(height: 8),

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
  }
}
