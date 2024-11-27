
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class DonationItem extends StatefulWidget {
  final String image;
  final String title;
  final String content;
  final Function() onTap;
  const DonationItem(
      {super.key,
      required this.image,
      required this.title,
      required this.content,
      required this.onTap});

  @override
  State<DonationItem> createState() => _DonationItemState();
}

class _DonationItemState extends State<DonationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColors.concrete,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: kLableTextBlackW600Size16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(widget.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kLableTextBlackW300Size14),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: const BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        'Donate',
                        style: kLableButtonDunation,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
