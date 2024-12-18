import 'package:ecots_fe/screens/new_feeds/tab_explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/new_feeds/account_card.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../notifications/notification_screen.dart';

class NewFeedScreen extends StatefulWidget {
  const NewFeedScreen({super.key});

  @override
  State<NewFeedScreen> createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Khởi tạo TabController
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
        child: CustomScrollView( // Xóa SingleChildScrollView, chỉ dùng CustomScrollView
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              stretch: true,
              expandedHeight: 350,
              flexibleSpace:
              FlexibleSpaceBar(
                background:  Padding(
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
                                      image: AssetImage('assets/images/default_avatar.jpg'),
                                      fit: BoxFit.cover
                                  ),
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(width: 1, color: AppColors.gray)
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Hi, Thach Sang', style: kLableTextStyleTilteGreen),
                                  Text('Welcome back !', style: kLableTextStyleMiniumGrey),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        Get.to(() => const NotificationScreen());
                                      },
                                      child: SvgPicture.asset('assets/icons/bell.svg')
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Gap(10.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            AccountCard(
                              title: 'Dream Team',
                              image: 'assets/images/default_avatar.jpg',
                            ),
                            AccountCard(
                              title: 'Dream Team',
                              image: 'assets/images/default_avatar.jpg',
                            ),
                            AccountCard(
                              title: 'Dream Team',
                              image: 'assets/images/default_avatar.jpg',
                            ),
                            AccountCard(
                              title: 'Dream Team',
                              image: 'assets/images/default_avatar.jpg',
                            ),
                            AccountCard(
                              title: 'Dream Team',
                              image: 'assets/images/default_avatar.jpg',
                            ),
                            AccountCard(
                              title: 'Dream Team',
                              image: 'assets/images/default_avatar.jpg',
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                              color: AppColors.shamrock,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      children: [
                                        Text('Support Ecotise developers and get involved in volunteering more easily', style: kLableTextWhiteW400Size13),
                                        Container(
                                          height: 20,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Center(child: Text('Contact with us now', style: kLableTextBlackW600Size14)),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )  ,


              bottom: TabBar(
                controller: _tabController, // Gắn TabController
                tabs: [
                  Tab(child: Text('EXPLORE', style: kLableTextBlackW600Size13),),
                  Tab(child: Text('NEW FOR YOU', style: kLableTextBlackW600Size13),),
                  Tab(child: Text('YOUR ACTIVITY', style: kLableTextBlackW600Size13 ),),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(

                    height: 800, // Chỉ cần thêm chiều cao để xem nội dung bên trong
                    child: TabBarView(
                      controller: _tabController, // Gắn TabController
                      children: [
                        TabExplore(),
                        Center(child: Text('Content of Tab 2')),
                        Center(child: Text('Content of Tab 3')),
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
