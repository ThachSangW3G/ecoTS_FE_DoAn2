import 'package:ecots_fe/constants/app_colors.dart';
import 'package:ecots_fe/controllers/newsfeed_controller.dart';
import 'package:ecots_fe/controllers/user_controller.dart';
import 'package:ecots_fe/models/comments/comment.dart';
import 'package:ecots_fe/models/newsfeeds/newsfeed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_style.dart';
import 'comment_card.dart';

class CommentsSection extends StatefulWidget {
  final Newsfeed newsfeed;
  const CommentsSection({super.key, required this.newsfeed});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final NewsfeedController _newsfeedController = Get.find();
  final UserController _userController = Get.find();

  List<Comment> comments = [];

  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getComments();
  }

  void _getComments() async {
    comments = await _newsfeedController.getComments(widget.newsfeed.id);
    setState(() {});
  }

  void _addComment() async {
    await _newsfeedController.addComment(widget.newsfeed.id,
        _commentController.text, _userController.currentUser.value!.id);
    _commentController.clear();
    _getComments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Sample comments data

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Comments",
        style: kLableTextBlackW600,
      )),
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
                  return CommentCard(comment: comment);
                },
              ),
            ),
            // View all comments
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.green),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    hintText: 'Write a comment...',
                    hintStyle: kLableTextStyleMiniumGrey,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        _addComment();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
