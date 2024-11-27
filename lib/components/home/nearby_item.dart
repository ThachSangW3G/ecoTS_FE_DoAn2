
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../models/locations/location.dart';


class NearbyItem extends StatefulWidget {
  final Location location;

  const NearbyItem({
    super.key,
    required this.location,
  });

  @override
  State<NearbyItem> createState() => _NearbyItemState();
}

class _NearbyItemState extends State<NearbyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColors.concrete,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  widget.location.backGroundImgUrl,
                  fit: BoxFit.cover,
                )),
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
                      widget.location.locationName,
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
                    child: Text(widget.location.typeOfLocation,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kLableTextBlackW300Size14),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Chỉ đường',
                    style: kLableChiDuong,
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
