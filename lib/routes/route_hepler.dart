import 'package:get/get.dart';
import '../views/setting_language_page.dart';
import '../views/splash_page.dart';

import '../views/main_page.dart';
import '../views/setting_profile_page.dart';
import '../views/setting_page_retrieve_data_to_excell.dart';
import '../views/setting_category_page.dart';

class RouteHelper {
  static const String _initial = '/';
  static const String _mainPage = '/main-page';

  static const String _settingProfilePage = '/setting-profile-page';
  static const String _settingLanguagesPage = '/setting-languages-page';
  static const String _settingRetrieveDataToExcel =
      '/setting-retrieve-data-to-excel';
  static const String _settingCategoryPage = '/setting-category-page';

  // all get route
  static String getInitial() => _initial;
  static String getMainPage() => _mainPage;

  static String getSettingProfilePage() => _settingProfilePage;
  static String getSettingLanguagesPage() => _settingLanguagesPage;
  static String getSettingRetrieveDataToExcel() => _settingRetrieveDataToExcel;
  static String getSettingCategoryPage() => _settingCategoryPage;

  static List<GetPage> listRoutes = [
    GetPage(
      name: _initial,
      page: () => const SplashPage(),
      transition: Transition.fade,
    ),
    //
    GetPage(
      name: _mainPage,
      page: () => const MainPage(),
      transition: Transition.fade,
    ),
    //
    GetPage(
      name: _settingProfilePage,
      page: () => const SettingProfilePage(),
      transition: Transition.fade,
    ),
    //
    GetPage(
      name: _settingLanguagesPage,
      page: () => const SettingLanguagePage(),
      transition: Transition.fade,
    ),
    //
    GetPage(
      name: _settingRetrieveDataToExcel,
      page: () => SettingPageRetrieveDataToExcel(),
      transition: Transition.fade,
    ),
    //
    GetPage(
      name: _settingCategoryPage,
      page: () => SettingCategoryPage(),
      transition: Transition.fade,
    ),
  ];
}
