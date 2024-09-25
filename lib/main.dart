import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expenses/routes/route_hepler.dart';
import 'package:income_expenses/utils/share_preferences.dart';

import 'themes/theme_helper.dart';
import 'translations/app_translate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharePreferencesUtils.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeHelper());
    return GetBuilder<ThemeHelper>(builder: (themeHelper) {
      return GetMaterialApp(
        title: 'InCome and Expenses App',
        debugShowCheckedModeBanner: false,
        theme: themeHelper.themeData,
        translations: AppTranslations(),
        // Set the initial language here
        locale: SharePreferencesUtils.getAppLanguage() == 'kh'
            ? const Locale('kh')
            : const Locale('en'),
        // Fallback if the device's locale is not supported
        fallbackLocale: const Locale('kh'),
        initialRoute: RouteHelper.getInitial(),
        getPages: RouteHelper.listRoutes,
      );
    });
  }
}
