
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

class ButtonGreen extends StatefulWidget {
  final String title;

  final bool? isLoading;

  const ButtonGreen({super.key, required this.title, this.isLoading});

  @override
  State<ButtonGreen> createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
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
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
      ),
    );
  }
}
