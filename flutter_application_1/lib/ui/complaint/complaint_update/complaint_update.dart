import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_color.dart';
import 'package:flutter_application_1/utils/app_date_field.dart';
import 'package:flutter_application_1/utils/app_dropdown_item.dart';
import 'package:flutter_application_1/utils/app_style.dart';
import 'package:flutter_application_1/utils/app_text_field.dart';

class ComplaintUpdateScreen extends StatefulWidget {
  @override
  State<ComplaintUpdateScreen> createState() => _ComplaintUpdateScreenState();
}

class _ComplaintUpdateScreenState extends State<ComplaintUpdateScreen> {
  String dropdownValue = 'One';
  final _formKey = GlobalKey<FormState>();
  bool confirmOrderCheckbox = false;
  String returnOrderDropdownValue = 'Option 1';
  String authorityDropdownValue = 'Option 2';
  TextEditingController dateController = TextEditingController();
  TextEditingController integerController = TextEditingController();
  TextEditingController _dateHandlingController = TextEditingController();
  TextEditingController _dateFirstController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  String _returnOrderValue = 'Có';
  String _authorityValue = 'Đơn thuộc thẩm quyền';

  @override
  void dispose() {
    _dateHandlingController.dispose();
    _dateFirstController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _subjectController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orange,
      appBar: AppBar(
        title: const Text('CẬP NHẬT ĐƠN KHIẾU NẠI TỐ CÁO',
            textAlign: TextAlign.center),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.account_balance), // Icon for the Viện kiểm sát
          onPressed: () {
            // Assuming HomeScreen is the widget for your home screen
            Navigator.pop(context);
          },
        ), // Icon for the Viện kiểm sát
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // row 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              labelText: 'Số TT',
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              labelText: 'Đơn vị',
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: _dateHandlingController,
                            decoration: const InputDecoration(
                              labelText: 'Ngày thụ lý',
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () =>
                                _selectDate(context, _dateHandlingController),
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // row 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _dateFirstController,
                            decoration: const InputDecoration(
                              labelText: 'Ngày đơn lần đầu',
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () =>
                                _selectDate(context, _dateFirstController),
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Họ và tên',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // row 3
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: 'Địa chỉ',
                      ),
                    ),
                    // row 4
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _subjectController,
                            decoration: const InputDecoration(
                              labelText: 'Đối tượng',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonFormField(
                            value: _returnOrderValue,
                            decoration: const InputDecoration(
                              labelText: 'Trả lại đơn',
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _returnOrderValue = newValue!;
                              });
                            },
                            items: <String>['Có', 'Không']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Row 5
                    DropdownButtonFormField(
                      value: _authorityValue,
                      decoration: const InputDecoration(
                        labelText: 'Thẩm quyền',
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _authorityValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Đơn thuộc thẩm quyền',
                        'Đơn không thuộc thẩm quyền'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Row 6
                    TextFormField(
                      controller: _contentController,
                      decoration: const InputDecoration(
                        labelText: 'Nội dung đơn',
                      ),
                      maxLines: null, // Allows for multi-line input
                    ),

                    // row 7
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: buildDateField(context, 'Thời hạn'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: integerController,
                            decoration:
                                const InputDecoration(labelText: 'Số ngày'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Checkbox(
                                value: confirmOrderCheckbox,
                                onChanged: (bool? value) {
                                  setState(() {
                                    confirmOrderCheckbox = value!;
                                  });
                                },
                              ),
                              const Text('Xác nhận đơn'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Nơi đang xử lý'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // row 8
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Nhập mới',
                              style: TextStyle(
                                  fontSize: AppStyle.fontSizeTextButton),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  fontSize: AppStyle.fontSizeTextButton),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Trùng đơn + việc',
                              style: TextStyle(
                                  fontSize: AppStyle.fontSizeTextButton),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Tiến độ',
                              style: TextStyle(
                                  fontSize: AppStyle.fontSizeTextButton),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Section 2->5
              Section(
                title: 'PHÂN LOẠI ĐƠN',
                content: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // "Mã việc" Input Text
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Mã việc',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      // "Nhóm việc" Input Text
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Nhóm việc',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      // "Đơn vị phân loại" Input Text
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Đơn vị phân loại',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle the action when the button is pressed
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                  fontSize: AppStyle.fontSizeTextButton),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Section(
                title: 'NƠI NHẬN ĐƯỢC ĐƠN',
                content: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // Align items to stretch to fill the cell height
                    children: <Widget>[
                      Expanded(child: AppTextField(hint: 'Đơn vị nhận')),
                      SizedBox(width: 8.0),
                      Expanded(
                          child: AppDateField(
                        label: 'Ngày nhận',
                        controller: dateController,
                      )),
                      SizedBox(width: 8.0),
                      Expanded(
                          child: AppDropdownItem(
                              label: 'Chuyển đơn vị',
                              items: ['Item 1', 'Item 2'])),
                      SizedBox(width: 8.0),
                      Expanded(
                          child: AppDropdownItem(
                              label: 'Nguồn đến',
                              items: ['Source 1', 'Source 2'])),
                      SizedBox(width: 8.0),
                      Expanded(child: AppTextField(hint: 'Số công văn')),
                      SizedBox(width: 8.0),
                      Expanded(
                          child: AppDateField(
                        label: 'Ngày công văn (đơn)',
                        controller: dateController,
                      )),
                      SizedBox(width: 8.0),
                      Expanded(child: AppTextField(hint: 'Lần')),
                      SizedBox(width: 8.0),
                      Expanded(child: AppTextField(hint: 'Số đơn')),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle the action when the button is pressed
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                  fontSize: AppStyle.fontSizeTextButton),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Section(
                  title: 'QUÁ TRÌNH XỬ LÝ',
                  content: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch, // Make children fill the cell height
                      children: <Widget>[
                        Expanded(
                            child: AppDateField(
                          label: 'Ngày xử lý',
                          controller: dateController,
                        )),
                        SizedBox(width: 8.0),
                        Expanded(child: AppTextField(hint: 'Đơn vị xử lý')),
                        SizedBox(width: 8.0),
                        Expanded(
                            child: AppDropdownItem(
                                label: 'Văn bản giải quyết ban hành',
                                items: ['Item 1', 'Item 2'])),
                                SizedBox(width: 8.0),
                        Expanded(
                            child: AppDropdownItem(
                                label: 'Nội dung xử lý',
                                items: ['Content 1', 'Content 2'])),
                                SizedBox(width: 8.0),
                        Expanded(child: AppTextField(hint: 'Số công văn')),
                        SizedBox(width: 8.0),
                        Expanded(
                            child: AppDateField(
                          label: 'Ngày công văn',
                          controller: dateController,
                        )),
                        SizedBox(width: 8.0),
                        Expanded(
                            child: AppDropdownItem(
                                label: 'Cán bộ xử lý',
                                items: ['Officer 1', 'Officer 2'])),
                                SizedBox(width: 8.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle the action when the button is pressed
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: AppStyle.fontSizeTextButton),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Section(
                  title: 'CÁC KẾT LUẬN',
                  content: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch, // Align children to stretch to fill the row height
                      children: <Widget>[
                        Expanded(
                          flex:
                              2, // You can adjust flex factor to give more space to certain columns if needed
                          child: AppTextField(
                              hint: 'Đơn vị'), // Custom text field widget
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          flex: 2,
                          child: AppDateField(
                            label: 'Ngày kết luận',
                            controller: dateController,
                          ), // Custom date picker widget
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          flex: 2,
                          child: AppTextField(
                              hint:
                                  'Số công văn'), // Custom text field widget for number input
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          flex: 3,
                          child: AppDropdownItem(
                              label: 'Nội dung kết luận',
                              items: ['Item 1', 'Item 2']), // Dropdown menu
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          flex: 3,
                          child: AppTextField(
                              hint:
                                  'Ghi chú'), // Custom text field widget for notes
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle the action when the button is pressed
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: AppStyle.fontSizeTextButton),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateField(BuildContext context, String label) {
    return TextFormField(
      controller: dateController,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          String formattedDate =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          setState(() {
            dateController.text = formattedDate;
          });
        }
      },
    );
  }

  Widget buildButton(
      BuildContext context, String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      controller.text = "${picked.toLocal()}".split(' ')[0];
    }
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget content;

  const Section({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          content,
        ],
      ),
    );
  }
}
