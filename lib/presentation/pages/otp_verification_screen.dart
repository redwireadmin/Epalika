import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/otp_verify_controller.dart';

import 'package:e_palika/presentation/pages/forgot_password/widgets/forgot_pw_general_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  final OtpVerifyController otpVerifyController =
      Get.put(OtpVerifyController());
  OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordGeneralView(
      title: "Verify OTP",
      icon: Icon(
        Icons.lock,
        size: Get.height * 0.07,
      ),
      richText1: 'Enter Your OTP Code \n',
      richText2: '\nWe\'ve sent you an OTP code ',
      inputField: pinCodeTextField(context),
      btnText: 'Verify OTP',
      onPressed: () {
        otpVerifyController.otpApi();
      },
    );
  }

  Widget pinCodeTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: PinCodeTextField(
        controller: otpVerifyController.pinCodeTextFieldController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ],
        appContext: context,
        length: 6,
        enableActiveFill: true,
        animationType: AnimationType.fade,
        animationDuration: Duration(milliseconds: 300),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: Get.width * 0.13,
          inactiveColor: CustomColors.textFieldBorderColor,
          activeColor: CustomColors.primaryColor,
          activeFillColor: Colors.white,
          inactiveFillColor: CustomColors.appWhite,
          selectedFillColor: CustomColors.textFieldBorderColor,
        ),
      ),
    );
  }
}
