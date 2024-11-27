
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class ButtonGreen extends StatefulWidget {
  final String title;
  final VoidCallback onClick;
  final bool? isLoading;
  const ButtonGreen(
      {super.key, required this.title, required this.onClick, this.isLoading});

  @override
  State<ButtonGreen> createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: widget.isLoading != null && widget.isLoading == true
              ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                )
              : Text(
                  widget.title,
                  style: kLableBoldWhite,
                ),
        ),
      ),
    );
  }
}
