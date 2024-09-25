import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expenses/utils/dimensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import the syncfusion charts package

import '../themes/theme_helper.dart';
import '../widgets/text_reusable.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late TooltipBehavior _tooltipBehavior; // Tooltip for showing section data

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true); // Initialize tooltip
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);

    // Sample data for the pie chart
    final List<_PieData> chartData = [
      _PieData('Food', 35),
      _PieData('Rent', 25),
      _PieData('Entertainment', 15),
      _PieData('Others', 15),
    ];

    // Colors for each pie chart section
    final List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextReusable(
          text: "title_report_text".tr,
          fontSize: dimensions.fontSize20 * 1.5,
          color:
              Get.find<ThemeHelper>().isDarkMode ? Colors.amber : Colors.black,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: dimensions.height20 * 20,
            child: SfCircularChart(
              legend: const Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              tooltipBehavior: _tooltipBehavior, // Enable tooltips
              series: <PieSeries<_PieData, String>>[
                PieSeries<_PieData, String>(
                  dataSource: chartData,
                  xValueMapper: (_PieData data, _) => data.category,
                  yValueMapper: (_PieData data, _) => data.value,
                  dataLabelMapper: (_PieData data, _) =>
                      '${data.category}: ${data.value}%',
                  pointColorMapper: (_PieData data, _) {
                    // Get the index of the current data point
                    final index = chartData.indexOf(data);
                    return colors[index]; // Return the corresponding color
                  },
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: dimensions.fontSize15,
                      //color: Colors.white,
                    ),
                  ),
                  onPointTap: (ChartPointDetails details) {
                    // final tappedSection = chartData[details.pointIndex!];
                    // _showSectionDetailDialog(tappedSection);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to show dialog with details about the tapped section
  // void _showSectionDetailDialog(_PieData tappedSection) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Details'),
  //         content: Text(
  //             'Category: ${tappedSection.category}\nValue: ${tappedSection.value}%'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Close'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

// Data model for pie chart
class _PieData {
  _PieData(this.category, this.value);
  final String category;
  final double value;
}
