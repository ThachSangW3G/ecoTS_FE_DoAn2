import 'package:ecots_fe/components/new_feeds/voting_options.dart';
import 'package:ecots_fe/screens/new_feeds/vote_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import 'comment_section.dart';

class NewFeedCard extends StatefulWidget {
  const NewFeedCard({super.key});

  @override
  State<NewFeedCard> createState() => _NewFeedCardState();
}

class _NewFeedCardState extends State<NewFeedCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            Row(
              children: [
                Expanded(child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(

                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/default_avatar.jpg'),
                          )
                      ),
                    ),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Le Dang Thuong', style: kLableTextGreenWeightW600Size16,),
                        Text('45 mins', style: kLableTextItalic,),
                      ],)
                  ],
                )),

                Container(child: SvgPicture.asset('assets/icons/3dot.svg'))
              ],
            ),
            Gap(10),
            AspectRatio(aspectRatio: 1,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                          ),
                        ),
                        Icon(
                          Icons.play_circle_fill,
                          size: 50,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_fill,
                                  size: 50,
                                  color: AppColors.white,
                                )
                              ],
                            )
                        ),

                        const SizedBox(width: 2,),
                        Expanded(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.only( bottomRight: Radius.circular(20))
                                  ),
                                ),

                              ],
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text('1.8k likes', style: kLableTextItalic,),
                  const Spacer(),
                  Text('1.8k comments', style: kLableTextItalic,),
                  const Spacer(),
                  Text('1.8k shares', style: kLableTextItalic,)
                ],
              ),
            ),
            const Divider(color: AppColors.gray,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton(Icons.thumb_up, 'Like'),
                  _buildActionButton(Icons.comment, 'Comment'),
                  _buildActionButton(Icons.share, 'Share'),
                ],
              ),
            ),

            InkWell(
              onTap: (){
                Get.to(() => const VoteScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Poll ends: March 12, 2021',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const Text(
                    '10 votes',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const VotingOptions(),
            const SizedBox(height: 8),
            //const CommentsSection()
          ],),
        ),

        Container(
          height: 10,
          width: double.infinity,
          color: AppColors.gray,
        )
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {
        Get.to(() => const CommentsSection());
      },
      icon: Icon(icon, color: Colors.grey),
      label: Text(
        label,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
