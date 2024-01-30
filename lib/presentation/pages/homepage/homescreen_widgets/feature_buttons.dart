// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/widgets/custom_button.dart';

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
    return CustomElevatedButton(
      padding: 0,
      child: child,
      onPressed: onPressed,
      height: btnHeight,
      width: btnWidth,
      radius: 20,
      backGroundColor: CustomColors.appWhite,
      foreGroundColor: CustomColors.primaryColor1,
      side: BorderSide(
        color: CustomColors.primaryColor1,
        width: 3.0,
      ),
    );
  }
}
