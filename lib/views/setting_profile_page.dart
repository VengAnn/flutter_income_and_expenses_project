import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expenses/utils/app_color.dart';
import 'package:income_expenses/utils/constants.dart';
import 'package:income_expenses/utils/dimensions.dart';
import 'package:income_expenses/widgets/container_reusable.dart';
import 'package:income_expenses/widgets/icon_reusable.dart';
import 'package:income_expenses/widgets/text_reusable.dart';

class SettingProfilePage extends StatelessWidget {
  const SettingProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: IconReusable(
            icon: Icons.arrow_back_ios,
            sizeIcon: dimensions.iconSize17,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: TextReusable(
          text: "Profile",
          fontSize: dimensions.fontSize20,
          color: Colors.amber,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(dimensions.width10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: dimensions.height20 * 2),
            // image profile here
            CircleAvatar(
              backgroundColor: Colors.amber,
              radius: dimensions.radius15 * 3,
              backgroundImage:
                  const AssetImage('${Constants.assetPath}/profile.png'),
            ),
            SizedBox(height: dimensions.height20),
            TextReusable(
              text: "VENG ANN",
              fontSize: dimensions.fontSize21,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            //
            SizedBox(height: dimensions.height20),
            //
            ContainerReusable(
              radius: dimensions.radius10,
              color: AppColor.colorLikeDark,
              horizontalMargin: 0,
              verticalMargin: 0,
              child: Padding(
                padding: EdgeInsets.all(dimensions.width10),
                child: Row(
                  children: [
                    IconReusable(
                      icon: Icons.person,
                      sizeIcon: dimensions.iconSize17,
                      color: Colors.blue,
                    ),
                    SizedBox(width: dimensions.width10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextReusable(
                          text: "Email",
                          fontSize: dimensions.fontSize15 * 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        TextReusable(
                          text: "Vengann@gmail.com",
                          fontSize: dimensions.fontSize15 / 1.1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //
            SizedBox(height: dimensions.height10),
            //Container phone number
            ContainerReusable(
              radius: dimensions.radius10,
              color: AppColor.colorLikeDark,
              horizontalMargin: 0,
              verticalMargin: 0,
              child: Padding(
                padding: EdgeInsets.all(dimensions.width10),
                child: Row(
                  children: [
                    IconReusable(
                      icon: Icons.phone,
                      sizeIcon: dimensions.iconSize17,
                      color: Colors.blue,
                    ),
                    SizedBox(width: dimensions.width10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextReusable(
                          text: "Phone",
                          fontSize: dimensions.fontSize15 * 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        TextReusable(
                          text: "0654654",
                          fontSize: dimensions.fontSize15 / 1.1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: dimensions.height20),
            //
            ContainerReusable(
              radius: dimensions.radius20,
              color: Colors.amber,
              horizontalMargin: 0,
              verticalMargin: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: dimensions.height20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //
                    TextReusable(
                      text: "Logout",
                      fontSize: dimensions.fontSize20,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: dimensions.width10),
                    //
                    IconReusable(
                      icon: Icons.logout_outlined,
                      sizeIcon: dimensions.iconSize17 * 1.4,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
