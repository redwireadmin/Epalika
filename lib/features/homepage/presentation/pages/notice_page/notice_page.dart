import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/features/homepage/presentation/pages/notice_page/controller/notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class NoticePageView extends StatelessWidget {
  NoticePageView({super.key});
  List<String> notices = ['Hello', 'Second Notice'];
  final noticeController = Get.lazyPut(() => NoticeController());
  // final NoticeController noticeController = Get.put(NoticeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notice"),
        ),
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
          child: ListView(
              children: Get.find<NoticeController>()
                  .noticeList
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ExpansionTile(
                            title: Text(e.title),
                            subtitle: Text(
                                DateFormat('d MMMM yyyy').format(e.createdAt)),
                            trailing: SizedBox.shrink(),
                            // leading: Text(e.createdAt.toString()),
                            children: [
                              Divider(
                                height: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  bottom: 20,
                                  right: 20,
                                ),
                                child: Text(e.noticebody),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
