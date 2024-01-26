import 'package:e_palika/config/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backGroundColor;
  final Color? foreGroundColor;
  final double height;
  final double width;
  final Widget child;
  final double? radius;
  final BorderSide? side;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.backGroundColor = CustomColors.primaryColor,
    this.foreGroundColor = Colors.white,
    this.height = 48,
    this.width = double.infinity,
    required this.child,
    this.radius = 11,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: side,
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
