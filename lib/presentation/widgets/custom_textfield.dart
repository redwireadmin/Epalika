import 'package:e_palika/config/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? title;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final TextEditingController? controller;
  final Color? fillColor;
  final bool readOnly;
  final bool? showCursor;
  final void Function()? onTap;

  const CustomTextField1(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.title,
      this.contentPadding = const EdgeInsets.fromLTRB(10, 13.5, 10, 13.5),
      this.obscureText = false,
      this.controller,
      this.fillColor,
      this.readOnly = false,
      this.showCursor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: TextStyle(color: CustomColors.primaryTextColor, fontSize: 12),
        ),
        TextFormField(
          onTap: onTap,
          showCursor: showCursor,
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            prefixIcon: prefixIcon,
            contentPadding: contentPadding,
            suffixIcon: suffixIcon,
            filled: true,
            hintText: hintText,
            fillColor: Colors.white,
            errorStyle: TextStyle(color: Colors.red),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.textFieldBorderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.textFieldBorderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade700),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade700, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
