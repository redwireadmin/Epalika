// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/widgets/custom_button.dart';

class DialogBoxContent extends StatelessWidget {
  final String middleText;
  final Icon centerIcon;
  final VoidCallback? onPressed;
  final String btnText;
  const DialogBoxContent({
    Key? key,
    required this.middleText,
    required this.centerIcon,
    this.onPressed,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: Get.height * 0.05,
          child: centerIcon,
          backgroundColor: CustomColors.primaryColor,
          foregroundColor: CustomColors.appWhite,
        ),
        SizedBox(height: 20),
        Text(
          middleText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        CustomElevatedButton(
          width: Get.height * 0.2,
          onPressed: onPressed,
          child: Text(btnText),
        )
      ],
    );
  }
}
