import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_color.dart';

class ComplaintUpdateScreen extends StatefulWidget {
  @override
  State<ComplaintUpdateScreen> createState() => _ComplaintUpdateScreenState();
}

class _ComplaintUpdateScreenState extends State<ComplaintUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orange,
      appBar: AppBar(
        title: Text('CẬP NHẬT ĐƠN KHIẾU NẠI TỐ CÁO', textAlign: TextAlign.center),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.account_balance), // Icon for the Viện kiểm sát
          onPressed: () {
            // Assuming HomeScreen is the widget for your home screen
            Navigator.pop(context);
          },
        ), // Icon for the Viện kiểm sát
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Vụ 12')), // Label "Vụ 12"
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Section 1 - No title, just content
              Container(
                padding: EdgeInsets.all(16.0),
                // Add your content for section 1 here
              ),
              Section(title: 'PHÂN LOẠI ĐƠN', content: Text('Content for Phân loại đơn')),
              Section(title: 'NƠI NHẬN ĐƯỢC ĐƠN', content: Text('Content for Nơi nhận được đơn')),
              Section(title: 'QUÁ TRÌNH XỬ LÝ', content: Text('Content for Quá trình xử lý')),
              Section(title: 'CÁC KẾT LUẬN', content: Text('Content for Các kết luận')),
            ],
          ),
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget content;

  const Section({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          content,
        ],
      ),
    );
  }
}
