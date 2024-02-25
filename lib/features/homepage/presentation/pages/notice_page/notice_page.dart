import 'package:e_palika/config/app_urls/app_urls.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/features/homepage/presentation/pages/notice_page/controller/notice_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class NoticePageView extends StatelessWidget {
  NoticePageView({super.key});
  List<String> notices = ['Hello', 'Second Notice'];
  final controller = Get.lazyPut(() => NoticeController());
  // final noticeController = Get.lazyPut(() => NoticeController());
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
          child: Obx(
            () => Get.find<NoticeController>().loading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: CustomColors.appWhite,
                    ),
                  )
                : ListView(
                    children: Get.find<NoticeController>()
                        .noticeList
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ExpansionTile(
                                  title: Text(e.title),
                                  subtitle: Text(DateFormat('d MMMM yyyy')
                                      .format(e.createdAt)),
                                  trailing: SizedBox.shrink(),
                                  // leading: e.image == null || e.image == ''
                                  //     ? SizedBox.shrink()
                                  //     : Image.network(
                                  //         'http://192.168.1.51:8000/${e.image}'),
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
                                      child: Column(
                                        children: [
                                          Text(e.noticebody),
                                          e.image == null || e.image == ''
                                              ? SizedBox.shrink()
                                              : Image.network(
                                                  '${AppUrls.baseUrl}/${e.image}'),
                                          SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.download,
                                                size: 17,
                                              ),
                                              SizedBox(width: 10),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'Download'.tr,
                                                  style: const TextStyle(
                                                    color: CustomColors
                                                        .primaryColor1,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          final url =
                                                              '${AppUrls.baseUrl}/api/v1/notice/download/${e.id}'; // Replace with your URL
                                                          final Uri uri =
                                                              Uri.parse(url);
                                                          await launchUrl(
                                                            uri,
                                                            mode: LaunchMode
                                                                .externalApplication,
                                                          );
                                                        },
                                                ),
                                              ),
                                            ],
                                          ),
                                          // CustomElevatedButton(
                                          //   width: 20,
                                          //   child: Row(
                                          //     mainAxisSize: MainAxisSize.min,
                                          //     children: [
                                          //       Icon(
                                          //         Icons.download,
                                          //         size: 17,
                                          //       ),
                                          //       SizedBox(width: 10),
                                          //       Text("Download"),
                                          //     ],
                                          //   ),
                                          //   onPressed: () async {
                                          //     final url =
                                          //         'http://192.168.1.51:8000/api/v1/notice/download/${e.id}'; // Replace with your URL
                                          //     final Uri uri = Uri.parse(url);
                                          //     await launchUrl(
                                          //       uri,
                                          //       mode: LaunchMode
                                          //           .externalApplication,
                                          //     );

                                          //     // Save the image data to a file
                                          //     //
                                          //     //http://192.168.1.51:8000/api/v1/notice/download/${e.id}
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList()),
          ),
        ),
      ),
    );
  }
}
