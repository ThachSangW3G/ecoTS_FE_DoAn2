
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class QuizCard extends StatefulWidget {
  const QuizCard({super.key});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray, width: 0.5),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            width: 300,
            height: 230,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/image1.png'),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sport Quiz', style: kLableTextStyleTilteGreen),
                Row(
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text(
                        '20 Questions',
                        style: kLableTextStyleMiniumGrey,
                      ),
                    ),
                    Expanded(
                        child: LayoutBuilder(builder: (context, constraints) {
                      final double maxWidth = constraints.maxWidth;
                      final double progressWidth = maxWidth * 0.5;
                      return Stack(
                        children: [
                          Container(
                            height: 15,
                            width: maxWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.backgroundProgress),
                          ),
                          Container(
                            height: 15,
                            width: progressWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.progress1,
                                    AppColors.progress2
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                color: AppColors.backgroundProgress),
                          ),
                        ],
                      );
                    }))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
