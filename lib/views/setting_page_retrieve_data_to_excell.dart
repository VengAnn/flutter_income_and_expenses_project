import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io'; // Required for File
import 'package:path_provider/path_provider.dart'; // Required for getTemporaryDirectory

class SettingPageRetrieveDataToExcel extends StatelessWidget {
  SettingPageRetrieveDataToExcel({super.key});

  // Dummy data for table
  final List<Map<String, dynamic>> tableData = [
    {'Date': '2024-09-25', 'Category': 'Food', 'Amount': 50, 'Type': 'Expense'},
    {
      'Date': '2024-09-24',
      'Category': 'Salary',
      'Amount': 500,
      'Type': 'Income'
    },
    {
      'Date': '2024-09-23',
      'Category': 'Transport',
      'Amount': 20,
      'Type': 'Expense'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        title: const Text('Export Data to Excel'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Type')),
                ],
                rows: tableData.map((data) {
                  return DataRow(cells: [
                    DataCell(Text(data['Date'])),
                    DataCell(Text(data['Category'])),
                    DataCell(Text(data['Amount'].toString())),
                    DataCell(Text(data['Type'])),
                  ]);
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // Export the Excel file and share it
              await exportAndShareExcel();
            },
            child: const Text('Export to Excel'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> exportAndShareExcel() async {
    try {
      // Create a new Excel document in memory
      var excel = Excel.createExcel();
      Sheet sheetObject = excel['Sheet1'];

      // Add header row
      sheetObject.appendRow([
        TextCellValue('Date'),
        TextCellValue('Category'),
        TextCellValue('Amount'),
        TextCellValue('Type'),
      ]);

      // Add data rows
      for (var data in tableData) {
        sheetObject.appendRow([
          TextCellValue(data['Date'].toString()),
          TextCellValue(data['Category'].toString()),
          IntCellValue(data['Amount']),
          TextCellValue(data['Type'].toString()),
        ]);
      }

      // Save the file in memory as bytes
      var fileBytes = excel.save();

      // Get the temporary directory
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/exported_data.xlsx');

      // Write the bytes to the file
      await file.writeAsBytes(fileBytes!);

      // Share the file using the file path
      // ignore: deprecated_member_use
      await Share.shareFiles([file.path], text: 'data export');

      // Notify the user
      Get.snackbar('Success', 'Excel file shared successfully');
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Failed to export Excel file: $e');
    }
  }
}
