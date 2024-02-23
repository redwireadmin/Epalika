// import 'dart:convert';

import 'package:e_palika/features/homepage/data/repository/notice_repository/notice_repository.dart';
import 'package:e_palika/features/homepage/presentation/pages/notice_page/model/notice_model.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController {
  RxBool loading = false.obs;
  final _api = NoticeRepository();
  List<NoticeItemModel> noticeList = [];
  void getAllNotice() {
    loading.value = true;
    _api.noticeApi().then((value) {
      // print(json.decode(value));
      NoticeModel noticeModel = NoticeModel.fromJson(value);
      print(noticeModel);

      noticeList = noticeModel.data;
      print(noticeList);
      loading.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getAllNotice();
  }
}
