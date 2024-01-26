// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/widgets/custom_button.dart';

class ForgotPasswordGeneralView extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final String? richText1;
  final String? richText2;
  final Widget? inputField;
  final String? btnText;
  final VoidCallback? onPressed;

  const ForgotPasswordGeneralView({
    super.key,
    this.title,
    this.icon,
    this.richText1,
    this.richText2,
    this.inputField,
    this.btnText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBarGradient(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.primaryColor, CustomColors.primaryColor1],
            stops: [0.1, 0.5],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  centerIcon(),
                  SizedBox(height: 30),
                  centerText(),
                  SizedBox(height: 30),
                  Container(
                    child: inputField,
                  )
                ],
              ),
              CustomElevatedButton(
                onPressed: onPressed,
                child: Text(btnText!),
                backGroundColor: CustomColors.appWhite,
                foreGroundColor: CustomColors.appBlack,
              )
            ],
          ),
        ),
      ),
    );
  }

  RichText centerText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 13.5),
        children: [
          TextSpan(
            text: richText1,
            style: TextStyle(
              color: CustomColors.appWhite,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          TextSpan(
            text: richText2,
            style: const TextStyle(
              color: CustomColors.appWhite,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget centerIcon() {
    return Center(
      child: CircleAvatar(
        radius: Get.height * 0.06,
        child: icon,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  AppBar CustomAppBarGradient() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 4,
      title: Text(
        title!,
        style: TextStyle(
          color: CustomColors.appWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.primaryColor1, CustomColors.primaryColor1],
            stops: [0.1, 0.9],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
      ),
    );
  }
}
