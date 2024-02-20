import 'package:e_palika/config/themes/colors.dart';
import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final String assetName;
  final bool isSelected;
  const GradientIcon({
    Key? key,
    required this.assetName,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/icons/${assetName}.png",
      color:
          isSelected ? CustomColors.primaryColor1 : CustomColors.primaryColor,
    );
  }
}
