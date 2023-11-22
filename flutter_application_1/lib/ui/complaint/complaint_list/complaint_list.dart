import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/complaint.dart';
import 'package:flutter_application_1/utils/app_color.dart';

class ComplaintListScreen extends StatefulWidget {
  @override
  State<ComplaintListScreen> createState() => _ComplaintListScreenState();
}

class _ComplaintListScreenState extends State<ComplaintListScreen> {
  final List<Complaint> complaints = [
    // Replace with your actual data
    Complaint(
        id: 1,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 2,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 3,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 4,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 5,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 6,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 7,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 8,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 9,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 10,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 11,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 12,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 13,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 14,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 15,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 16,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 17,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 18,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 19,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 20,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),
    Complaint(
        id: 21,
        name: 'Nguyễn Văn A',
        address: '123 Đường ABC, TP. Hồ Chí Minh',
        content: 'Nội dung 1',
        unit: 'Đơn vị 1',
        date: '12/12/2022'),

    // Add more complaints...
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
            child: Text(
              'VỤ 12',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Tổng số lần / số đơn: ${complaints.length}/${complaints.length}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  width: screenWidth,
                  child: DataTable(
                    dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
                    headingRowColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                    border: TableBorder.all(),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Số TT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Họ và tên',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Địa chỉ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Nội dung',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Đơn vị',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Ngày đơn',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
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
            ),
          ),
          SizedBox(height: 16.0,),
        ],
      ),
    );
  }
}
