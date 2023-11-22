import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_color.dart';

class ComplaintListScreen extends StatefulWidget {
  @override
  State<ComplaintListScreen> createState() => _ComplaintListScreenState();
}

class _ComplaintListScreenState extends State<ComplaintListScreen> {
  final List<Complaint> complaints = [
    // Replace with your actual data
    Complaint(id: 1, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 2, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 3, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 4, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 5, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 6, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 7, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 8, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 9, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 10, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    Complaint(id: 11, name: 'Nguyễn Văn A', address: '123 Đường ABC, TP. Hồ Chí Minh', content: 'Nội dung 1', unit: 'Đơn vị 1', date: '12/12/2022'),
    // Add more complaints...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orange,
      appBar: AppBar(
        title: const Text('DANH SÁCH ĐƠN KHIẾU NẠI TỐ CÁO'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.account_balance), // Icon for the Viện kiểm sát
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Số TT')),
              DataColumn(label: Text('Họ và tên')),
              DataColumn(label: Text('Địa chỉ')),
              DataColumn(label: Text('Nội dung')),
              DataColumn(label: Text('Đơn vị')),
              DataColumn(label: Text('Ngày đơn')),
            ],
            rows: complaints
                .map(
                  (complaint) => DataRow(cells: [
                    DataCell(Text(complaint.id.toString())),
                    DataCell(Text(complaint.name)),
                    DataCell(Text(complaint.address)),
                    DataCell(Text(complaint.content)),
                    DataCell(Text(complaint.unit)),
                    DataCell(Text(complaint.date)),
                  ]),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class Complaint {
  final int id;
  final String name;
  final String address;
  final String content;
  final String unit;
  final String date;

  Complaint({
    required this.id,
    required this.name,
    required this.address,
    required this.content,
    required this.unit,
    required this.date,
  });
}