// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/homescreen_widgets/feature_buttons.dart';

class DepartmentPage extends StatelessWidget {
  DepartmentPage({
    super.key,
  });

  final List<String> onPressRoutes = [
    'administration',
    'teset',
  ];

  final List<Widget> buttonContent = [
    buttonContentListItem(
      mainIcon: Icons.admin_panel_settings,
      btnText: 'Administration\nand\nPlanning',
    ),
    buttonContentListItem(
      mainIcon: Icons.science,
      btnText: 'Infrastructure\nDevelopment',
    ),
    buttonContentListItem(
      mainIcon: Icons.transfer_within_a_station,
      btnText: 'Youth and Sports\nDepartment',
    ),
    buttonContentListItem(
      mainIcon: Icons.book,
      btnText: 'Education\nDepartment',
    ),
    buttonContentListItem(
      mainIcon: Icons.nature,
      btnText: 'Environmental\nManagement',
    ),
    buttonContentListItem(
      mainIcon: Icons.medical_information_sharp,
      btnText: 'Health and Social\nDevelopment',
    ),
    buttonContentListItem(
      mainIcon: Icons.balance,
      btnText: 'Economic\nAdministration',
    ),
    buttonContentListItem(
      mainIcon: Icons.developer_mode,
      btnText: 'Information\nTechnology',
    ),
    buttonContentListItem(
      mainIcon: Icons.computer,
      btnText: 'Information\nTechnology',
    ),
    buttonContentListItem(
      mainIcon: Icons.computer,
      btnText: 'Information\nTechnology',
    ),
    buttonContentListItem(
      mainIcon: Icons.computer,
      btnText: 'Information\nTechnology',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Departments")),
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors.primaryColor1,
              CustomColors.primaryColor,
            ],
            // Add more colors if needed
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.03,
              vertical: Get.height * 0.02,
            ),
            child: Wrap(
              children: buttonContent
                  .asMap()
                  .entries
                  .map((e) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Get.height * 0.018,
                            horizontal: Get.width * 0.03),
                        child: FeatureButton(
                          child: e.value,
                          btnHeight: Get.height * 0.18,
                          btnWidth: Get.width * 0.4,
                          onPressed: () {
                            print(onPressRoutes[e.key]);
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class buttonContentListItem extends StatelessWidget {
  const buttonContentListItem({
    Key? key,
    this.mainIcon,
    this.btnText,
  }) : super(key: key);
  final IconData? mainIcon;
  final String? btnText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          mainIcon,
          size: Get.height * 0.07,
        ),
        Text(
          btnText ?? '',
          style: TextStyle(fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
