import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expenses/themes/theme_helper.dart';
import 'package:income_expenses/utils/dimensions.dart';
import 'package:income_expenses/views/home_page.dart';
import 'package:income_expenses/views/report_page.dart';
import 'package:income_expenses/views/setting_page.dart';
import 'package:income_expenses/widgets/icon_reusable.dart';

import '../themes/dark_mode.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ReportPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);
    return Scaffold(
      body: _pages[_selectedIndex],
      //
      bottomNavigationBar: CurvedNavigationBar(
        color: Get.find<ThemeHelper>().isDarkMode
            // ignore: deprecated_member_use
            ? mydarkMode.colorScheme.background
            : Colors.white,
        backgroundColor: Get.find<ThemeHelper>().isDarkMode
            ? mydarkMode.colorScheme.inverseSurface
            : Colors.grey.shade900,
        buttonBackgroundColor: Get.find<ThemeHelper>().isDarkMode
            ? Colors.amber
            : Colors.grey.shade900,
        height: dimensions.height20 * 3,
        animationCurve: Curves.easeIn,
        index: _selectedIndex,
        items: [
          CurvedNavigationBarItem(
            child: IconReusable(
              icon: Icons.home,
              sizeIcon: dimensions.fontSize15 * 2,
              color: _selectedIndex == 0
                  ? Get.find<ThemeHelper>().isDarkMode
                      // ignore: deprecated_member_use
                      ? mydarkMode.colorScheme.background
                      : Colors.white
                  : !Get.find<ThemeHelper>().isDarkMode
                      // ignore: deprecated_member_use
                      ? mydarkMode.colorScheme.background
                      : Colors.white,
            ),
            label: 'bottom_nav_1'.tr,
          ),
          CurvedNavigationBarItem(
            child: IconReusable(
              icon: Icons.bar_chart_outlined,
              sizeIcon: dimensions.fontSize15 * 2,
              color: _selectedIndex == 1
                  ? Get.find<ThemeHelper>().isDarkMode
                      // ignore: deprecated_member_use
                      ? mydarkMode.colorScheme.background
                      : Colors.white
                  : !Get.find<ThemeHelper>().isDarkMode
                      // ignore: deprecated_member_use
                      ? mydarkMode.colorScheme.background
                      : Colors.white,
            ),
            label: 'bottom_nav_2'.tr,
          ),
          CurvedNavigationBarItem(
            child: IconReusable(
              icon: Icons.settings,
              sizeIcon: dimensions.fontSize15 * 2,
              color: _selectedIndex == 2
                  ? Get.find<ThemeHelper>().isDarkMode
                      // ignore: deprecated_member_use
                      ? mydarkMode.colorScheme.background
                      : Colors.white
                  : !Get.find<ThemeHelper>().isDarkMode
                      // ignore: deprecated_member_use
                      ? mydarkMode.colorScheme.background
                      : Colors.white,
            ),
            label: 'bottom_nav_3'.tr,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
      ),
    );
  }
}
