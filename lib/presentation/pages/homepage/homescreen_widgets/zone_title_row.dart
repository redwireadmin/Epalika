// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_palika/config/themes/colors.dart';

class ZoneTitleRow extends StatelessWidget {
  final String zoneTitle;
  const ZoneTitleRow({
    Key? key,
    required this.zoneTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            '$zoneTitle ZONE',
            style: TextStyle(
                fontSize: Get.width * 0.036,
                fontWeight: FontWeight.w500,
                color: CustomColors.appWhite,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        Container(
          color: CustomColors.appWhite,
          height: Get.height * 0.002,
          width: Get.width * 0.5,
        ),
        SizedBox(width: Get.width * 0.02),
        CircleAvatar(
          radius: 10,
          child: Icon(
            Icons.arrow_back_ios,
            size: 12,
          ),
        ),
        SizedBox(width: Get.width * 0.01),
        CircleAvatar(
          radius: 10,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 12,
          ),
        ),
      ],
    );
  }
}
