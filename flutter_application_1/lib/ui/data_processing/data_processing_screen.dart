import 'dart:io';
import 'dart:async';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart' as excel;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

class DataProcessingScreen extends StatefulWidget {
  @override
  State<DataProcessingScreen> createState() => _DataProcessingScreenState();
}

class _DataProcessingScreenState extends State<DataProcessingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NHẬP, XUẤT DỮ LIỆU'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _importData(context),
              child: Text('Nhập dữ liệu'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _exportData(context),
              child: Text('Xuất dữ liệu'),
            ),
          ],
        ),
      ),
    );
  }

  _importData(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'csv', 'xls'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      // Xử lý file đọc dữ liệu từ file ở đây
      // Ví dụ: Đọc dữ liệu từ file Excel
      // var bytes = await file.readAsBytes();
      // var excel = excel.Excel.decodeBytes(bytes);
      // var sheet = excel['Sheet1'];
      // ... Xử lý dữ liệu từ sheet
      print('Đã upload file thành công');
      // Fluttertoast.showToast(
      //     msg: 'Đã upload file thành công',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  _exportData(BuildContext context) async {
    // Xử lý dữ liệu để xuất ra file ở đây
    // Ví dụ: Tạo một workbook và thêm dữ liệu vào sheet
    var excel = Excel.createExcel();
    var sheet = excel['Sheet1'];
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
        'Dữ liệu xuất đi';

    // Lưu workbook vào tệp Excel
    var excelFileName = 'exported_data.xlsx';
    var excelFile = await _saveExcelFile(excel, excelFileName);

    print('Tệp Excel được lưu tại: $excelFile');
    // Fluttertoast.showToast(
    //     msg: 'Tệp Excel được lưu tại: $excelFile',
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.black,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  Future<String> _saveExcelFile(excel.Excel excel, String fileName) async {
    // Get the external storage directory using the path_provider package
    var directory = await getExternalStorageDirectory();

    if (directory == null) {
      // Handle the case where the directory is not available
      throw Exception('External storage directory not available');
    }

    var filePath = '${directory.path}/$fileName';

    // Ghi workbook vào tệp Excel
    await File(filePath).writeAsBytes(excel.encode()!);

    return filePath;
  }

  /// Desktop app
  Future<String> readFile(String filePath) async {
    try {
      final file = File(filePath);
      return await file.readAsString();
    } catch (e) {
      // Handle the error, e.g. file not found
      return Future.error('Error reading file: $e');
    }
  }

  Future<File> writeFile(String filePath, String content) async {
    final file = File(filePath);
    return file.writeAsString(content);
  }
}
