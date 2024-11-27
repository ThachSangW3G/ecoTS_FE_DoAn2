
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class AnswerCard extends StatelessWidget {
  final bool isCorrect;
  final bool isSelected;
  final bool isAnswered;
  final String order;
  final String answer;
  final VoidCallback onTap;

  const AnswerCard({
    super.key,
    required this.isCorrect,
    required this.isSelected,
    required this.isAnswered,
    required this.order,
    required this.answer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: isAnswered
              ? isCorrect
                  ? AppColors.anwserGreen
                  : AppColors.anwserRed
              : isSelected
                  ? AppColors.chooseAnswer
                  : AppColors.gray,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isAnswered
                    ? isCorrect
                        ? const Icon(
                            Icons.check,
                            color: AppColors.anwserGreen,
                          )
                        : const Icon(
                            Icons.close,
                            color: AppColors.anwserRed,
                          )
                    : Text(order, style: kLableTextBlackW600),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Text(
                answer,
                style: kLableTextBlackW600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
