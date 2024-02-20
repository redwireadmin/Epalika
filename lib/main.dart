import 'package:e_palika/config/getx_localization/languages.dart';
import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/features/homepage/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LanguageController languageController = Get.put(LanguageController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project',
      theme: ThemeData(
        primarySwatch: CustomColors.pallete1,
        appBarTheme: AppBarTheme(
            backgroundColor: CustomColors.primaryColor12,
            elevation: 4.0,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      translations: Language(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: Routes.splash,
      getPages: getPages,
    );
  }
}
