import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:income_expenses/utils/app_color.dart';
import 'package:income_expenses/utils/dimensions.dart';
import 'package:income_expenses/widgets/Icon_reusable.dart';
import 'package:income_expenses/widgets/container_reusable.dart';
import 'package:income_expenses/widgets/text_reusable.dart';

import '../themes/theme_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTimeRange? selectedDateRange;

  // Format the date range for display
  String getFormattedDateRange() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');

    if (selectedDateRange == null) {
      // Show only the current date if no range is selected (default behavior)
      return formatter.format(DateTime.now());
    } else if (DateFormat('yyyy-MM-dd').format(selectedDateRange!.start) ==
        DateFormat('yyyy-MM-dd').format(selectedDateRange!.end)) {
      // Show only the start date if it's the same as the end date (single date selected)
      return formatter.format(selectedDateRange!.start);
    } else {
      // Show the full range if multiple dates are selected
      return '${formatter.format(selectedDateRange!.start)} - ${formatter.format(selectedDateRange!.end)}';
    }
  }

  void adjustDateRange({required bool isNext}) {
    setState(() {
      selectedDateRange ??= DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      );

      DateTime newStart = selectedDateRange!.start;
      DateTime newEnd = selectedDateRange!.end;

      if (isNext) {
        // Move to the next day
        newStart = newStart.add(const Duration(days: 1));
        newEnd = newEnd.add(const Duration(days: 1));
      } else {
        // Move to the previous day
        newStart = newStart.subtract(const Duration(days: 1));
        newEnd = newEnd.subtract(const Duration(days: 1));
      }

      // Update the selected date range
      selectedDateRange = DateTimeRange(start: newStart, end: newEnd);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dimension = Dimensions(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextReusable(
          text: "title_text".tr,
          fontSize: dimension.fontSize20 * 1.5,
          color:
              Get.find<ThemeHelper>().isDarkMode ? Colors.amber : Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: dimension.width10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //icon prevent
                    IconReusable(
                      callBackOnTap: () {
                        adjustDateRange(isNext: false);
                      },
                      icon: Icons.arrow_back,
                      sizeIcon: dimension.iconSize17,
                      color: Colors.white,
                    ),
                    // here show the custom of day
                    GestureDetector(
                      onTap: () async {
                        // Open date range picker with current date as default
                        DateTimeRange? pickedDateRange =
                            await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          initialDateRange: DateTimeRange(
                            start: DateTime.now(),
                            end: DateTime.now(),
                          ), // Default to current date (single date)
                          initialEntryMode: DatePickerEntryMode.calendar,
                        );

                        // Update the selected date range
                        if (pickedDateRange != null) {
                          setState(() {
                            selectedDateRange = pickedDateRange;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimension.radius10),
                          border: Border.all(
                            width: 2,
                            color: Colors.amber,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(dimension.width10),
                          child: Center(
                            child: TextReusable(
                              text: getFormattedDateRange(),
                              fontSize: dimension.fontSize15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // icon or btn to next day
                    IconReusable(
                      callBackOnTap: () {
                        adjustDateRange(isNext: true);
                      },
                      icon: Icons.arrow_forward,
                      sizeIcon: dimension.iconSize17,
                      color: Colors.white,
                    ),
                  ],
                ),
                //
                SizedBox(
                  height: double.maxFinite,
                  child: ListView.builder(
                    itemCount: 5 + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return ContainerReusable(
                          radius: 0,
                          color: Colors.transparent,
                          width: 40,
                          height: 50,
                          horizontalMargin: dimension.width5,
                          verticalMargin: dimension.width5,
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ContainerReusable(
                                  radius: dimension.radius10,
                                  color: Colors.amber,
                                  horizontalMargin: 0,
                                  verticalMargin: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(dimension.width10),
                                    child: TextReusable(
                                      text: "16/09/2024",
                                      fontSize: dimension.fontSize15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                //
                                //
                                Row(
                                  children: [
                                    TextReusable(
                                      text: "\$",
                                      fontSize: dimension.fontSize20,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    TextReusable(
                                      text: "10.00",
                                      fontSize: dimension.fontSize20,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return ContainerReusable(
                        radius: dimension.radius10,
                        color: AppColor.colorLikeDark,
                        horizontalMargin: dimension.width5,
                        verticalMargin: dimension.width5 / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // Icon for each category
                                  CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    child: IconReusable(
                                      icon: Icons.category_sharp,
                                      sizeIcon: dimension.iconSize17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // a bit space
                                  SizedBox(
                                    width: dimension.width5,
                                  ),
                                  // text of each category
                                  TextReusable(
                                    text: "Investment",
                                    fontSize: dimension.fontSize15,
                                    color: const Color.fromARGB(
                                        255, 233, 232, 232),
                                  ),
                                ],
                              ),
                              // each money expense
                              Row(
                                children: [
                                  TextReusable(
                                    text: "- \$",
                                    fontSize: dimension.fontSize20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  TextReusable(
                                    text: "150.00",
                                    fontSize: dimension.fontSize20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: dimension.width20 * 3,
        height: dimension.width20 * 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dimension.radius15),
          color: Colors.amber,
        ),
        child: IconReusable(
          icon: Icons.add,
          sizeIcon: dimension.iconSize17,
          color: Colors.black,
        ),
      ),
    );
  }
}
