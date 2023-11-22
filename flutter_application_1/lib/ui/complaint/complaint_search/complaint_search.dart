import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/complaint/complaint_search/sections/general_info_widget.dart';
import 'package:flutter_application_1/ui/complaint/complaint_search/items/section_box.dart';
import 'package:flutter_application_1/utils/app_color.dart';
import 'package:flutter_application_1/utils/app_date_field.dart';
import 'package:flutter_application_1/utils/app_number_field.dart';
import 'package:flutter_application_1/utils/app_text_field.dart';

class ComplaintSearchScreen extends StatefulWidget {
  @override
  State<ComplaintSearchScreen> createState() => _ComplaintSearchScreenState();
}

class _ComplaintSearchScreenState extends State<ComplaintSearchScreen> {
  String? selectedValue;
  String dropdownValue = 'Đơn thuộc thẩm quyền';

  TextEditingController dateController = TextEditingController();
  String dropdownValue2 = 'One';

  final TextEditingController _dateController = TextEditingController();
  String authorityValue = 'Option 1';
  String returnOrderValue = 'Có';
  String confirmOrderValue = 'Hiện tất';
  String name = '';

  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();

  @override
  void dispose() {
    dateController1.dispose();
    dateController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orange,
      appBar: AppBar(
        title: const Text('TÌM KIẾM ĐƠN KHIẾU NẠI TỐ CÁO'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.account_balance),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            statusWidget(),
            const SizedBox(height: 16.0),

            // Thông tin chung
            const GeneralInfoWidget(),
            const SizedBox(height: 16.0),

            // Phân loại đơn và Noi nhận được đon
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SectionBox(
                    title: 'Phân loại đơn',
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Mã việc',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Đơn vị phân loại',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: SectionBox(
                    title: 'Nơi nhận được đơn',
                    child: Column(
                      children: [
                        // Hàng 1
                        const Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: AppTextField(hint: 'Đơn vị'),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: AppTextField(hint: 'Nguồn'),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: AppTextField(hint: 'Lần'),
                              ),
                            ),
                            Expanded(
                              child: AppTextField(hint: 'Số đơn'),
                            ),
                          ],
                        ),
                        // Hàng 2
                        Row(
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: AppTextField(hint: 'CV số'),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: AppDateField(
                                    label: 'từ ngày',
                                    controller: dateController1),
                              ),
                            ),
                            Expanded(
                              child: AppDateField(
                                  label: 'đến ngày',
                                  controller: dateController2),
                            ),
                          ],
                        ),
                        // Hàng 3
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: AppDateField(
                                    label: 'Nhận đơn từ ngày',
                                    controller: dateController1),
                              ),
                            ),
                            Expanded(
                              child: AppDateField(
                                  label: 'đến ngày',
                                  controller: dateController2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Quá trình xử lý
            SectionBox(
              title: 'Quá trình xử lý',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: AppDateField(
                              label: 'Nhận từ ngày',
                              controller: dateController1)),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: AppDateField(
                              label: 'đến ngày', controller: dateController2)),
                      const SizedBox(width: 8.0),
                      const Expanded(child: AppTextField(hint: 'Đơn vị')),
                      const SizedBox(width: 8.0),
                      const Expanded(child: AppTextField(hint: 'Nội dung')),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Expanded(child: AppNumberField(hint: 'CV số')),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: AppDateField(
                              label: 'từ ngày', controller: dateController1)),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: AppDateField(
                              label: 'đến ngày', controller: dateController2)),
                      const SizedBox(width: 8.0),
                      const Expanded(child: AppTextField(hint: 'Cán bộ')),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: AppDateField(
                              label: 'Ngày báo cáo',
                              controller: dateController)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Kết luận
            SectionBox(
              title: 'Kết luận',
              child: Row(
                children: [
                  // "Nội dung" input text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Nội dung',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  // "CV số" input text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'CV số',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  // "từ ngày" date picker
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: AppDateField(
                          label: 'từ ngày', controller: dateController1),
                    ),
                  ),
                  // "đến ngày" date picker
                  Expanded(
                    child: AppDateField(
                        label: 'đến ngày', controller: dateController2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Add more widgets for other search criteria here...

            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tìm mới Button
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // Background color
                          onPrimary: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: const TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('Tìm mới'),
                      ),
                    ),
                    // Tìm Button
                    ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Background color
                        onPrimary: Colors.white, // Text color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text('Tìm'),
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

  Widget statusWidget() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <String>[
            "Chưa phân loại",
            "Chưa nhập nguồn",
            "Chưa xử lý",
            "Đã xử lý",
            "Quá hạn",
            "Hiện đầy đủ",
          ].map((String value) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Radio<String>(
                  value: value,
                  groupValue: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                ),
                Text(value),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _itemsWidget() {
    TextEditingController dateController = TextEditingController();
    String dropdownValue2 = 'One';
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Example of a text field
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Mã việc',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Example of a dropdown
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: DropdownButtonFormField<String>(
              value: dropdownValue2,
              decoration: const InputDecoration(
                labelText: 'Đơn vị phân loại',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue2 = newValue!;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          // Example of date range fields
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextFormField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Nhận từ ngày',
                      border: OutlineInputBorder(),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        String formattedDate =
                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    labelText: 'đến ngày',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    // ... Repeat the process for picking an end date
                  },
                ),
              ),
            ],
          ),

          // Other fields would follow a similar pattern...
          // Add your buttons or additional form fields here
        ],
      ),
    );
  }
}
