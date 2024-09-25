import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:income_expenses/routes/route_hepler.dart';
import 'package:income_expenses/utils/app_color.dart';
import 'package:income_expenses/utils/constants.dart';
import 'package:income_expenses/utils/dimensions.dart';
import 'package:income_expenses/widgets/icon_reusable.dart';
import '../themes/theme_helper.dart';
import '../widgets/text_reusable.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> _switchValue = ValueNotifier<bool>(false);

  late AnimationController _controller;
  late List<Animation<Offset>> _animations;

  @override
  void initState() {
    super.initState();

    int numberOfContainers = 6;
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 3000), // Total duration of 3 seconds
    );

    _animations = [];

    for (int i = 0; i < numberOfContainers; i++) {
      double start = (i * 0.15);
      double end = start + 0.15;

      Animation<Offset> animation = Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            start,
            end,
            curve: Curves.easeOut,
          ),
        ),
      );

      _animations.add(animation);
    }

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextReusable(
          text: "title_setting_text".tr,
          fontSize: dimensions.fontSize20 * 1.5,
          color:
              Get.find<ThemeHelper>().isDarkMode ? Colors.amber : Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(dimensions.width10),
        child: Column(
          children: [
            // Profile setting container
            SlideTransition(
              position: _animations[0],
              child: ContainerSettingReusable(
                dimensions: dimensions,
                text1: "text_container_1".tr,
                text2: "sub_text_container_1".tr,
                myChild: CircleAvatar(
                  radius: dimensions.radius15 * 2,
                  backgroundImage:
                      const AssetImage("${Constants.assetPath}/profile.png"),
                ),
                bgColor: Colors.black38,
                onTap: () {
                  Get.toNamed(RouteHelper.getSettingProfilePage());
                },
              ),
            ),
            SizedBox(height: dimensions.height10),
            // Category setting container
            SlideTransition(
              position: _animations[1],
              child: ContainerSettingReusable(
                dimensions: dimensions,
                text1: "text_container_2".tr,
                text2: "sub_text_container_2".tr,
                myChild: IconReusable(
                  icon: Icons.language_outlined,
                  sizeIcon: dimensions.iconSize17,
                  color: Colors.amber,
                ),
                bgColor: Colors.transparent,
                onTap: () {
                  Get.toNamed(RouteHelper.getSettingCategoryPage());
                },
              ),
            ),
            SizedBox(height: dimensions.height10),
            // Language setting container
            SlideTransition(
              position: _animations[2],
              child: ContainerSettingReusable(
                dimensions: dimensions,
                text1: "text_container_3".tr,
                text2: "sub_text_container_3".tr,
                myChild: IconReusable(
                  icon: Icons.category_outlined,
                  sizeIcon: dimensions.iconSize17,
                  color: Colors.amber,
                ),
                bgColor: Colors.transparent,
                onTap: () {
                  Get.toNamed(RouteHelper.getSettingLanguagesPage());
                },
              ),
            ),
            SizedBox(height: dimensions.height10),
            // Dark mode toggle using AdvancedSwitch
            SlideTransition(
              position: _animations[3],
              child: ContainerSettingReusable(
                dimensions: dimensions,
                text1: "text_container_4".tr,
                text2: "sub_text_container_4".tr,
                myChild: IconReusable(
                  icon: Icons.dark_mode,
                  sizeIcon: dimensions.iconSize17,
                  color: Colors.amber,
                ),
                isSwitch: true, // Indicating it's a switch container
                switchController: _switchValue,
                onTap: () {},
              ),
            ),
            SizedBox(height: dimensions.height10),
            // Download setting container
            SlideTransition(
              position: _animations[4],
              child: ContainerSettingReusable(
                dimensions: dimensions,
                text1: "text_container_5".tr,
                text2: "sub_text_container_5".tr,
                myChild: IconReusable(
                  icon: Icons.download,
                  sizeIcon: dimensions.iconSize17,
                  color: Colors.amber,
                ),
                bgColor: Colors.transparent,
                onTap: () {
                  Get.toNamed(RouteHelper.getSettingRetrieveDataToExcel());
                },
              ),
            ),
            SizedBox(height: dimensions.height10),
            // Delete data setting container
            SlideTransition(
              position: _animations[5],
              child: ContainerSettingReusable(
                dimensions: dimensions,
                text1: "text_container_6".tr,
                text2: "sub_text_container_6".tr,
                myChild: IconReusable(
                  icon: Icons.delete,
                  sizeIcon: dimensions.iconSize17,
                  color: Colors.amber,
                ),
                bgColor: Colors.transparent,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerSettingReusable extends StatefulWidget {
  final Dimensions dimensions;
  final String text1;
  final String text2;
  final Color? bgColor;
  final Widget? myChild;
  final bool isSwitch;
  final ValueNotifier<bool>? switchController;
  final VoidCallback onTap;

  const ContainerSettingReusable({
    super.key,
    required this.dimensions,
    required this.text1,
    required this.text2,
    this.bgColor,
    this.myChild,
    this.isSwitch = false,
    this.switchController,
    required this.onTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ContainerSettingReusableState createState() =>
      _ContainerSettingReusableState();
}

class _ContainerSettingReusableState extends State<ContainerSettingReusable>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  double _scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onTapDown(),
      onTapUp: (_) => _onTapUp(),
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..scale(_scaleFactor),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: AppColor.colorLikeDark,
          borderRadius: BorderRadius.circular(widget.dimensions.radius10),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: SizedBox(
          width: double.maxFinite,
          height: widget.dimensions.height20 * 3.5,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget.dimensions.width10 * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon or image
                Row(
                  children: [
                    if (widget.myChild != null)
                      AnimatedOpacity(
                        opacity: _isPressed ? 0.5 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: widget.dimensions.width20 * 3,
                          height: widget.dimensions.height20 * 3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.bgColor ?? Colors.transparent,
                          ),
                          child: widget.myChild,
                        ),
                      ),
                    // Space between icon/image and text
                    SizedBox(width: widget.dimensions.width10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextReusable(
                          text: widget.text1,
                          fontSize: widget.dimensions.fontSize15,
                        ),
                        TextReusable(
                          text: widget.text2,
                          fontSize: widget.dimensions.fontSize15,
                        ),
                      ],
                    ),
                  ],
                ),
                // AdvancedSwitch or forward icon
                widget.isSwitch && widget.switchController != null
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              widget.dimensions.radius15 * 2),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        child: AdvancedSwitch(
                          controller: widget.switchController!,
                          activeColor: Colors.amber,
                          inactiveColor: Colors.black26,
                          borderRadius: BorderRadius.circular(
                              widget.dimensions.radius15 * 2),
                          width: widget.dimensions.width20 * 3.2,
                          height: widget.dimensions.height20 * 1.5,
                        ),
                      )
                    : IconReusable(
                        icon: Icons.arrow_forward_ios_outlined,
                        sizeIcon: widget.dimensions.iconSize17,
                        color: Colors.white,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapDown() {
    setState(() {
      _isPressed = true;
      _scaleFactor = 0.95; // Scale down the container on tap
    });
  }

  void _onTapUp() {
    setState(() {
      _isPressed = false;
      _scaleFactor = 1.0; // Return to normal scale
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
      _scaleFactor = 1.0;
    });
  }
}
