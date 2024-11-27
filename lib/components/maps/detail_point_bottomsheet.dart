
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_style.dart';
import '../../models/locations/location.dart';

class DetailPointBottomSheet extends StatelessWidget {
  final Location location;
  const DetailPointBottomSheet({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 430,
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location.locationName,
                style: kLableTextBlackW600,
              ),
              Gap(3),
              // Text(
              //     'KTX Khu B, ĐHQC Tp. HCM, Tp. HCMdddddddddddddd sfdgtttttttttsds sfdre',
              //     style: kLableTextBlackSize16),
              Gap(3),
              Text(location.description, style: kLableTextBlackSize16),
              Gap(8),
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: location.imgDetailsUrl.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 200,
                          width: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              location.imgDetailsUrl[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
