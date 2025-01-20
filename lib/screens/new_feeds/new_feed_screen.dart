import 'package:ecots_fe/controllers/newsfeed_controller.dart';
import 'package:ecots_fe/controllers/user_controller.dart';
import 'package:ecots_fe/screens/new_feeds/tab_explore.dart';
import 'package:ecots_fe/screens/new_feeds/tab_your_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/new_feeds/account_card.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../models/newsfeeds/newsfeed.dart';
import '../notifications/notification_screen.dart';
import 'create_feed.dart';
import 'qr_code_sponsor.dart';

class NewFeedScreen extends StatefulWidget {
  const NewFeedScreen({super.key});

  @override
  State<NewFeedScreen> createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final NewsfeedController _newsfeedController = Get.put(NewsfeedController());
  final UserController _userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Khởi tạo TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Hủy TabController khi không còn sử dụng
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          // Xóa SingleChildScrollView, chỉ dùng CustomScrollView
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              stretch: true,
              expandedHeight: 135,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: _userController.currentUser.value!
                                                  .avatarUrl !=
                                              null
                                          ? NetworkImage(_userController
                                              .currentUser.value!.avatarUrl!)
                                          : const AssetImage(
                                                  'assets/images/default_avatar.jpg')
                                              as ImageProvider,
                                      fit: BoxFit.cover),
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      width: 1, color: AppColors.gray)),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 5),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Hi, ${_userController.currentUser.value!.fullName}',
                                      style: kLableTextStyleTilteGreen),
                                  Text('Welcome back !',
                                      style: kLableTextStyleMiniumGrey),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        Get.to(() => const CreateFeeedScreen());
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/plus-circle.svg')),
                                  const Gap(20.0),
                                  InkWell(
                                      onTap: () async {
                                        Get.to(
                                            () => const QRCodeSponsorScreen());
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/qr-code.svg',
                                        color: Colors.black,
                                        height: 25,
                                        width: 25,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Gap(10.0),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       AccountCard(
                      //         title: 'Dream Team',
                      //         image: 'assets/images/default_avatar.jpg',
                      //       ),
                      //       AccountCard(
                      //         title: 'Dream Team',
                      //         image: 'assets/images/default_avatar.jpg',
                      //       ),
                      //       AccountCard(
                      //         title: 'Dream Team',
                      //         image: 'assets/images/default_avatar.jpg',
                      //       ),
                      //       AccountCard(
                      //         title: 'Dream Team',
                      //         image: 'assets/images/default_avatar.jpg',
                      //       ),
                      //       AccountCard(
                      //         title: 'Dream Team',
                      //         image: 'assets/images/default_avatar.jpg',
                      //       ),
                      //       AccountCard(
                      //         title: 'Dream Team',
                      //         image: 'assets/images/default_avatar.jpg',
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Gap(10),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 10, vertical: 15),
                      //     decoration: BoxDecoration(
                      //         color: AppColors.shamrock,
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: Row(children: [
                      //       Container(
                      //         height: 80,
                      //         width: 80,
                      //         decoration: BoxDecoration(
                      //             color: AppColors.white,
                      //             borderRadius: BorderRadius.circular(20)),
                      //       ),
                      //       Expanded(
                      //         child: Padding(
                      //           padding:
                      //               const EdgeInsets.symmetric(horizontal: 10),
                      //           child: Column(
                      //             children: [
                      //               Text(
                      //                   'Support Ecotise developers and get involved in volunteering more easily',
                      //                   style: kLableTextWhiteW400Size13),
                      //               Container(
                      //                 height: 20,
                      //                 width: double.maxFinite,
                      //                 decoration: BoxDecoration(
                      //                     color: AppColors.white,
                      //                     borderRadius:
                      //                         BorderRadius.circular(20)),
                      //                 child: Center(
                      //                     child: Text('Contact with us now',
                      //                         style:
                      //                             kLableTextBlackW600Size14)),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     ]),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                controller: _tabController, // Gắn TabController
                tabs: [
                  Tab(
                    child: Text('EXPLORE', style: kLableTextBlackW600Size13),
                  ),
                  Tab(
                    child:
                        Text('YOUR ACTIVITY', style: kLableTextBlackW600Size13),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height:
                        800, // Chỉ cần thêm chiều cao để xem nội dung bên trong
                    child: TabBarView(
                      controller: _tabController, // Gắn TabController
                      children: const [
                        TabExplore(),
                        TabYourActivity(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
