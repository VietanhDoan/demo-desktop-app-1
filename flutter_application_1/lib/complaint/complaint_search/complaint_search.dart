import 'package:flutter/material.dart';

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
  int? daysToDeadline;

  String selectedAuthority = 'Đơn thuộc thẩm quyền';
  String selectedReturnOrder = 'Có';
  String selectedConfirmOrder = 'Hiện tất';

  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  TextEditingController reportDateController = TextEditingController();


  @override
  void dispose() {
    dateController1.dispose();
    dateController2.dispose();
    reportDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TÌM KIẾM ĐƠN KHIẾU NẠI TỐ CÁO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            statusWidget(),
            SizedBox(height: 16.0),

            // Thông tin chung
            generalInfoWidget(), 
            SizedBox(height: 16.0),

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
                              decoration: InputDecoration(
                                hintText: 'Mã việc',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Đơn vị phân loại',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: SectionBox(
                  title: 'Nơi nhận được đơn',
                  child: Column(
                    children: [
                      // Hàng 1
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: buildTextField('Đơn vị'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: buildTextField('Nguồn'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: buildTextField('Lần'),
                            ),
                          ),
                          Expanded(
                            child: buildTextField('Số đơn'),
                          ),
                        ],
                      ),
                      // Hàng 2
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: buildTextField('CV số'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: buildDateField('từ ngày', dateController1),
                            ),
                          ),
                          Expanded(
                            child: buildDateField('đến ngày', dateController2),
                          ),
                        ],
                      ),
                      // Hàng 3
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: buildDateField('Nhận đơn từ ngày', dateController1),
                            ),
                          ),
                          Expanded(
                            child: buildDateField('đến ngày', dateController2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Quá trình xử lý
            SectionBox(
              title: 'Quá trình xử lý',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: buildDateField('Nhận từ ngày', dateController1)),
                      SizedBox(width: 8.0),
                      Expanded(child: buildDateField('đến ngày', dateController2)),
                      SizedBox(width: 8.0),
                      Expanded(child: buildTextField('Đơn vị')),
                      SizedBox(width: 8.0),
                      Expanded(child: buildTextField('Nội dung')),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(child: buildNumberField('CV số')),
                      SizedBox(width: 8.0),
                      Expanded(child: buildDateField('từ ngày', dateController1)),
                      SizedBox(width: 8.0),
                      Expanded(child: buildDateField('đến ngày', dateController2)),
                      SizedBox(width: 8.0),
                      Expanded(child: buildTextField('Cán bộ')),
                      SizedBox(width: 8.0),
                      Expanded(child: buildDateField('Ngày báo cáo', reportDateController)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

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
                        decoration: InputDecoration(
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
                        decoration: InputDecoration(
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
                      child: buildDateField('từ ngày', dateController1),
                    ),
                  ),
                  // "đến ngày" date picker
                  Expanded(
                    child: buildDateField('đến ngày', dateController2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
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
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text('Tìm mới'),
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
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text('Tìm'),
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
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
                      decoration: InputDecoration(
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
                          String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
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
                    decoration: InputDecoration(
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
  
  Widget buildDropdown(
      String label, 
      List<String> items, 
      String? value, 
      void Function(String?) onChanged
  ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: value,
      onChanged: (value) => onChanged(value), // The onChanged callback now handles a nullable String
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget buildRowTextFields(String firstHint, String secondHint) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: buildTextField(firstHint),
          ),
        ),
        Expanded(
          child: buildTextField(secondHint),
        ),
      ],
    );
  }

  Widget buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildNumberField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            daysToDeadline = int.tryParse(value);
          });
        },
      ),
    );
  }

  Widget buildDateRangePicker(String firstLabel, String secondLabel) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: buildDateField(firstLabel, reportDateController),
          ),
        ),
        Expanded(
          child: buildDateField(secondLabel, reportDateController),
        ),
      ],
    );
  }

  Widget buildDateField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          setState(() {
            controller.text = formattedDate;
          });
        }
      },
    );
  }
  
  Widget generalInfoWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column (Column 1)
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
              children: [
                Expanded(
                  child: buildDropdown(
                    'Thẩm quyền',
                    ['Đơn thuộc thẩm quyền', 'Đơn không thuộc thẩm quyền'],
                    selectedAuthority,
                    (newValue) {
                      if (newValue != null) { // Check for null
                        setState(() => selectedAuthority = newValue);
                      }
                    },
                  ),
                ),
                SizedBox(width: 8.0), // Spacing between the dropdowns
                Expanded(
                  child: buildDropdown(
                    'Trả lại đơn',
                    ['Có', 'Không'],
                    selectedReturnOrder,
                    (newValue) {
                      if (newValue != null) { // Check for null
                        setState(() => selectedReturnOrder = newValue);
                      }
                    },
                  ),
                ),
              ],
            ),
              buildRowTextFields('Số TT', 'Đơn vị'),
              buildDateRangePicker('Ngày đơn lần đầu từ ngày', 'đến ngày'),
              buildTextField('Địa chỉ'),
              buildTextField('Nội dung đơn'),
            ],
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildDropdown(
                'Xác nhận đơn',
                ['Hiện tất', 'Hiện một phần'],
                selectedConfirmOrder,
                (newValue) {
                  if (newValue != null) { // Check for null
                    setState(() => selectedConfirmOrder = newValue);
                  }
                },
              ),
              SizedBox(height: 8.0),
              buildDateRangePicker('Thụ lý từ ngày', 'đến ngày'),
              buildTextField('Họ và tên'),
              buildNumberField('Số ngày sắp quá hạn'),
              buildDateRangePicker('Thời hạn từ ngày', 'đến ngày'),
            ],
          ),
        ),
      ],
    );
  }
}

class SectionBox extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionBox({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              child,
            ],
          ),
        ),
      ],
    );
  }
}
