// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/core/utils/widgets/custom_button.dart';

//They are the buttons in Homepage inside different zones
// ignore: must_be_immutable
class FeatureButton extends StatelessWidget {
  Widget child;
  double btnHeight;
  double btnWidth;
  Widget? btnLogo;
  final VoidCallback? onPressed;
  FeatureButton({
    Key? key,
    required this.child,
    required this.btnHeight,
    required this.btnWidth,
    this.btnLogo,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: Offset(4, 4),
            ),
          ]),
      child: CustomElevatedButton(
        padding: 0,
        child: child,
        onPressed: onPressed,
        height: btnHeight,
        width: btnWidth,
        radius: 20,
        backGroundColor: CustomColors.appWhite,
        foreGroundColor: CustomColors.primaryColor1,
        side: BorderSide(
          color: Colors.transparent,
          width: 0.0,
        ),
      ),
    );
  }
}
