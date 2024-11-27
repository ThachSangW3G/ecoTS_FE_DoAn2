
import 'package:flutter/material.dart';

import '../../constants/app_style.dart';

class AchivementItem extends StatefulWidget {
  final String title;
  final String value;
  final String image;
  const AchivementItem(
      {super.key,
      required this.title,
      required this.value,
      required this.image});

  @override
  State<AchivementItem> createState() => _AchivementItemState();
}

class _AchivementItemState extends State<AchivementItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
            ),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.image))),
            ),
          ),
          Text(widget.value, style: kLableBoldWhite),
          Text(widget.title, style: kLableW800White),
        ],
      ),
    );
  }
}
