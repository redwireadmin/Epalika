import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/core/utils/widgets/custom_button.dart';
import 'package:e_palika/features/homepage/presentation/pages/service_page/controller/service_page_controller.dart';
import 'package:e_palika/features/homepage/presentation/pages/service_page/sub_pages/recommendation.dart';
import 'package:e_palika/features/homepage/presentation/pages/service_page/sub_pages/reconciliation.dart';
import 'package:e_palika/features/homepage/presentation/pages/service_page/sub_pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ServicePage extends StatelessWidget {
  ServicePage({super.key});

  final ServicePageController servicePageController =
      Get.put(ServicePageController());

  List<Widget> pages = [
    RegistrationService(),
    ReconciliationService(),
    RecommendationService(),
  ];

  void changePage(index) {
    servicePageController.currentIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      appBar: AppBar(title: Text("Services")),
      body: Container(
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
        child: Obx(
          () => ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    UpperServiceSelectButton(0, "Registration"),
                    UpperServiceSelectButton(1, "Reconciliation"),
                    UpperServiceSelectButton(2, "Recommendation"),
                  ],
                ),
              ),
              pages[servicePageController.currentIndex.value],
            ],
          ),
        ),
      ),
    );
  }

  CustomElevatedButton UpperServiceSelectButton(int index, String btnText) {
    return CustomElevatedButton(
      child: Text(
        btnText,
        style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12),
      ),
      onPressed: () {
        servicePageController.currentIndex(index);
        changePage(index);
      },
      backGroundColor: servicePageController.currentIndex.value == index
          ? CustomColors.appWhite
          : CustomColors.primaryColor,
      foreGroundColor: servicePageController.currentIndex.value == index
          ? CustomColors.primaryColor1
          : CustomColors.appWhite,
      width: Get.width * 0.15,
    );
  }
}
