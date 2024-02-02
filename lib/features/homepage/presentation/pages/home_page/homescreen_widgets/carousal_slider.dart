import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/homescreen_controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselSlider1 extends StatelessWidget {
  CarouselSlider1({super.key});
  final HomeController homeController = Get.put(HomeController());
  final List<String> images = [
    'homepage_topImage.jpg',
    'homepage_topImage.jpg',
    'homepage_topImage.jpg',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: Get.height * 0.17,
            autoPlay: true,
            // aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            onPageChanged: (index, _) =>
                homeController.updatePageIndicator(index),
            viewportFraction: 1,
          ),
          items: images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: Get.width,
                  child: Image.asset(
                    'assets/images/${image}',
                    fit: BoxFit.fitWidth,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Icon(
                        Icons.circle,
                        color: homeController.currentIndexSlider == i
                            ? CustomColors.primaryColor
                            : CustomColors.appBlack.withOpacity(0.5),
                        size: Get.height * 0.02,
                      ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
