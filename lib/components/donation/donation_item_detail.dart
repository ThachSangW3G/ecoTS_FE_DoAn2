

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../models/donations/donation.dart';

class DonationItemDetail extends StatefulWidget {
  final Donation donation;
  final Function()? onTap;
  const DonationItemDetail({super.key, this.onTap, required this.donation});

  @override
  State<DonationItemDetail> createState() => _DonationItemDetailState();
}

class _DonationItemDetailState extends State<DonationItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.donation.coverImageUrl[0]))),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.donation.title,
              style: kLableTextBlackW600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start date',
                      style: kLableTextStyleTilteGreen,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd')
                          .format(widget.donation.startDate),
                      style: kLableTextStyleMiniumGrey,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'End date',
                      style: kLableTextStyleTilteGreen,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(widget.donation.endDate),
                      style: kLableTextStyleMiniumGrey,
                    )
                  ],
                )
              ],
            ),
          ),
          const Gap(10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 5),
                            decoration: const BoxDecoration(
                                color: AppColors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(
                              'Donate',
                              style: kLableButtonDunation,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
