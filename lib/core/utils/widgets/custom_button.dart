import 'package:flutter/material.dart';

import 'package:e_palika/config/themes/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backGroundColor;
  final Color? foreGroundColor;
  final double height;
  final double width;
  final Widget child;
  final double? radius;
  final BorderSide? side;
  final double? padding;

  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    this.backGroundColor = CustomColors.primaryColor,
    this.foreGroundColor = Colors.white,
    this.height = 48,
    this.width = double.infinity,
    required this.child,
    this.radius = 11,
    this.side,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(padding ?? 10),
        side: side,
        elevation: 4.0,
        backgroundColor: backGroundColor,
        foregroundColor: foreGroundColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
        ),
      ),
      child: child,
    );
  }
}
