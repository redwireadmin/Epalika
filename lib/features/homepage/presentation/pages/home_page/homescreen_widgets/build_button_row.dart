import 'package:e_palika/features/homepage/presentation/pages/home_page/homescreen_widgets/feature_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class buildButtonRow extends StatelessWidget {
  const buildButtonRow({
    super.key,
    required this.buttonContent,
    required this.onPressRoutes,
    required this.height,
    required this.width,
    required this.gap,
  });

  final List<Widget> buttonContent;
  final List<String> onPressRoutes;
  final double height;
  final double width;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttonContent
          .asMap()
          .entries
          .map(
            (child) => Row(
              children: [
                FeatureButton(
                  onPressed: () {
                    // Get.to(() => DepartmentPage());
                    Get.toNamed(onPressRoutes[child.key]);
                    print(onPressRoutes[child.key]);
                  },
                  child: child.value,
                  btnHeight: height,
                  btnWidth: width,
                ),
                SizedBox(width: gap),
              ],
            ),
          )
          .toList(),
    );
  }
}
