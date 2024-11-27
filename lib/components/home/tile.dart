
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_style.dart';

class Tile extends StatefulWidget {
  final String icon;
  final bool haveArrowRight;
  final String? rightContent;
  final String title;
  const Tile(
      {super.key,
      required this.icon,
      required this.haveArrowRight,
      required this.title,
      this.rightContent});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(widget.icon),
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.title,
                style: kLableTextBlackW600Size16,
              )
            ],
          ),
          widget.haveArrowRight
              ? SvgPicture.asset('assets/icons/arrowright.svg')
              : widget.rightContent != null
                  ? Text(
                      widget.rightContent!,
                      style: kLableTextStyleMiniumGrey,
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
