import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/complaint/complaint_list/complaint_list.dart';
import 'package:flutter_application_1/ui/complaint/complaint_search/complaint_search.dart';
import 'package:flutter_application_1/ui/complaint/complaint_update/complaint_update.dart';
import 'package:flutter_application_1/utils/app_color.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initialize variables for database connectivity, data, and controllers
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _queryResults = [];
  // Database configuration
  // final conn = MySqlConnection.connect(ConnectionSettings(
  //   host: 'localhost',
  //   port: 3306,
  //   user: 'root',
  //   db: 'app_01',
  //   password: '!J7X`_;@p\n+3wJx',
  // ));

  // // Function to insert data into MySQL
  // Future<void> _insertData(String data) async {
  //   final conn = await this.conn;
  //   // Insert data into the database
  // }

  // // Function to query and filter data from MySQL
  // Future<void> _queryData(String filter) async {
  //   final conn = await this.conn;
  //   // Query the database with filtering
  // }

  // Function to upload PDF
  Future<void> _uploadPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      // Upload file to the server or database
    }
  }

  // Function to export data to PDF
  Future<void> _exportToPdf(List<Map<String, dynamic>> data) async {
    PdfDocument document = PdfDocument();
    // Populate the PDF file with data
    // Save the document
  }

  // Function to get chart data
  List<FlSpot> _getChartData(List<Map<String, dynamic>> data) {
    // Convert data to chart points
    return [];
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> buttons = [
      {
        'label': 'DANH SÁCH ĐƠN KHIẾU NẠI TỐ CÁO',
        'image': 'assets/images/complaint_letter.jpg',
        'screen': ComplaintListScreen(),
      },
      {
        'label': 'TÌM KIẾM ĐƠN KHIẾU NẠI TỐ CÁO',
        'image': 'assets/images/search_complaint.jpg',
        'screen': ComplaintSearchScreen(),
      },
      {
        'label': 'CẬP NHẬT ĐƠN KHIẾU NẠI TỐ CÁO',
        'image': 'assets/images/update_complaint.jpg',
        'screen': ComplaintUpdateScreen(),
      },
      // Add more buttons as needed
    ];

    return Scaffold(
      backgroundColor: AppColor.orange,
      appBar: AppBar(
        title: Text('PHẦN MỀM QUẢN LÝ ĐƠN KHIẾU NẠI TỐ CÁO'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2),
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return MenuButton(label: buttons[index]['label'], imagePath: buttons[index]['image'], onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => buttons[index]['screen']),
            ),
          );
        },
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onPressed;

  const MenuButton({
    Key? key,
    required this.label,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0), // Padding around the entire button
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
            image: DecorationImage(
              image: AssetImage(imagePath), // This should be the path to your image file
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Dark overlay to ensure text stands out
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.black45, // Semi-transparent black overlay
                ),
              ),
              // Text label
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold, // Bold text to make the title stand out
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
