import 'package:ecots_fe/components/new_feeds/skeleton.dart';
import 'package:ecots_fe/components/new_feeds/voting_options.dart';
import 'package:ecots_fe/controllers/poll_controller.dart';
import 'package:ecots_fe/controllers/user_controller.dart';
import 'package:ecots_fe/models/newsfeeds/newsfeed.dart';
import 'package:ecots_fe/screens/new_feeds/vote_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../models/polls/poll.dart';
import '../../models/user.dart';
import 'comment_section.dart';

class NewFeedCard extends StatefulWidget {
  final Newsfeed newsfeed;
  const NewFeedCard({super.key, required this.newsfeed});

  @override
  State<NewFeedCard> createState() => _NewFeedCardState();
}

class _NewFeedCardState extends State<NewFeedCard> {
  final UserController _userController = Get.find();
  final PollController _pollController = Get.put(PollController());

  User? user;
  Poll? poll;
  int voteCount = 0;

  @override
  initState() {
    super.initState();
    _getUser();
    _getPoll();
  }

  Future<void> _getUser() async {
    user = await _userController.getUserById(widget.newsfeed.userId);
    setState(() {});
  }

  void _getPoll() async {
    voteCount = 0;
    poll = await _pollController.getPoll(widget.newsfeed.id);
    for (var option in poll!.pollOptions) {
      voteCount += option.votes.length;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: user != null && user?.avatarUrl != null
                                  ? NetworkImage(user!.avatarUrl!)
                                  : const AssetImage(
                                          'assets/images/default_avatar.jpg')
                                      as ImageProvider,
                            )),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          user != null
                              ? Text(
                                  user?.fullName ?? '',
                                  style: kLableTextGreenWeightW600Size16,
                                )
                              : const Skeleton(
                                  width: 200,
                                  height: 20,
                                ),
                          Text(
                            '45 mins',
                            style: kLableTextItalic,
                          ),
                        ],
                      )
                    ],
                  )),
                  SvgPicture.asset('assets/icons/3dot.svg')
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.newsfeed.content,
                      textAlign: TextAlign.start,
                      style: kLableTextGreenWeightW400Size16),
                ],
              ),
              const Gap(10),
              widget.newsfeed.startedAt != null
                  ? Row(children: [
                      Text('Start date: ',
                          style: kLableTextGreenWeightW400Size16),
                      Text(
                          DateFormat('yyyy-MM-dd')
                              .format(widget.newsfeed.startedAt!),
                          style: kLableTextGreenWeightW400Size16),
                    ])
                  : const SizedBox(),
              widget.newsfeed.startedAt != null
                  ? const Gap(5)
                  : const SizedBox(),
              widget.newsfeed.endedAt != null
                  ? Row(children: [
                      Text('Start date: ',
                          style: kLableTextGreenWeightW400Size16),
                      Text(
                          DateFormat('yyyy-MM-dd')
                              .format(widget.newsfeed.startedAt!),
                          style: kLableTextGreenWeightW400Size16),
                    ])
                  : const SizedBox(),
              widget.newsfeed.endedAt != null
                  ? const Gap(10)
                  : const SizedBox(),
              AspectRatio(
                aspectRatio: 1,
                child: Builder(builder: (context) {
                  if (widget.newsfeed.mediaUrls.length == 1) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.newsfeed.mediaUrls[0]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  } else if (widget.newsfeed.mediaUrls.length == 2) {
                    return Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          widget.newsfeed.mediaUrls[0]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                              )),
                              const SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          widget.newsfeed.mediaUrls[1]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                              )),
                            ],
                          ),
                        )
                      ],
                    );
                  } else if (widget.newsfeed.mediaUrls.length >= 3) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            widget.newsfeed.mediaUrls[0])),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                              ),
                              // Icon(
                              //   Icons.play_circle_fill,
                              //   size: 50,
                              //   color: AppColors.white,
                              // )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: AppColors.green,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20))),
                                  ),
                                  const Icon(
                                    Icons.play_circle_fill,
                                    size: 50,
                                    color: AppColors.white,
                                  )
                                ],
                              )),
                              const SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                  child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: AppColors.green,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20))),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        )
                      ],
                    );
                  }
                  return Container();
                }),
              ),

              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      '${widget.newsfeed.reactIds.length} likes',
                      style: kLableTextItalic,
                    ),
                    const Spacer(),
                    Text(
                      '${widget.newsfeed.commentIds.length} comments',
                      style: kLableTextItalic,
                    ),
                    const Spacer(),
                    Text(
                      '1.8k shares',
                      style: kLableTextItalic,
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.gray,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton(Icons.thumb_up, 'Like', () {}),
                    _buildActionButton(Icons.comment, 'Comment', () {
                      Get.to(() => CommentsSection(newsfeed: widget.newsfeed));
                    }),
                    _buildActionButton(Icons.share, 'Share', () {}),
                  ],
                ),
              ),

              InkWell(
                onTap: () {
                  Get.to(() => VoteScreen(
                        poll: poll!,
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '$voteCount votes',
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              poll != null
                  ? VotingOptions(
                      poll: poll!,
                    )
                  : Container(),
              const SizedBox(height: 8),
              //const CommentsSection()
            ],
          ),
        ),
        Container(
          height: 10,
          width: double.infinity,
          color: AppColors.gray,
        )
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback? onTap) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.grey),
      label: Text(
        label,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
