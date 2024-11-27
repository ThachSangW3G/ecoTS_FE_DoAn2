
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class ButtonIcon extends StatefulWidget {
  final String icon;
  const ButtonIcon({super.key, required this.icon});

  @override
  State<ButtonIcon> createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.green),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(widget.icon),
      ),
    );
  }
}
