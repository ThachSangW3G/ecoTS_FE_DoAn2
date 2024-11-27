
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class AchivementCard extends StatelessWidget {
  final String title;
  final String image;
  final double maxValue;
  final double currentValue;
  final bool isCompleted;

  const AchivementCard({
    super.key,
    required this.title,
    required this.image,
    required this.maxValue,
    required this.currentValue,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 60,
          child: Image.network(
            image,
            fit: BoxFit.contain,
          ),
        ),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: kLableTilte16Black.copyWith(
                  color: AppColors.green,
                  fontSize: 14, // giảm kích thước chữ
                ),
              ),
              Gap(5),
              LayoutBuilder(builder: (context, constraints) {
                final double maxWidth = constraints.maxWidth;
                final double progressWidth =
                    maxWidth * (currentValue / maxValue);
                return Container(
                  child: Stack(
                    children: [
                      Container(
                        height: 20,
                        width: maxWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.backgroundProgress,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: progressWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.progress1,
                              Color.fromRGBO(31, 201, 130, 1),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          color: AppColors.backgroundProgress,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${currentValue.toInt()}/${maxValue.toInt()}',
                            style: kLableButtonDunation,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        Gap(10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isCompleted
                ? AppColors.green
                : const Color.fromARGB(255, 127, 195, 142),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Center(
              child: Text('GET', style: kLableButtonDunation),
            ),
          ),
        ),
      ],
    );
  }
}
