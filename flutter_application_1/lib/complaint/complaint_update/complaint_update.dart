import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_color.dart';

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
  String _returnOrderValue = 'Yes';
  String _authorityValue = 'Within Authority';


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
        title:
            Text('CẬP NHẬT ĐƠN KHIẾU NẠI TỐ CÁO', textAlign: TextAlign.center),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(255, 237, 232, 187),
                ),
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // row 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: 'Số TT',
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: 'Đơn vị',
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _dateHandlingController,
                            decoration: InputDecoration(
                              labelText: 'Ngày thụ lý',
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () => _selectDate(context, _dateHandlingController),
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),   
 
                    // row 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _dateFirstController,
                            decoration: InputDecoration(
                              labelText: 'Ngày đơn lần đầu',
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () => _selectDate(context, _dateFirstController),
                            readOnly: true,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Họ và tên',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // row 3
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
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
                      decoration: InputDecoration(
                        labelText: 'Đối tượng',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _returnOrderValue,
                      decoration: InputDecoration(
                        labelText: 'Trả lại đơn',
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _returnOrderValue = newValue!;
                        });
                      },
                      items: <String>['Yes', 'No']
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
              SizedBox(height: 20),

              // Row 5
              DropdownButtonFormField(
                value: _authorityValue,
                decoration: InputDecoration(
                  labelText: 'Thẩm quyền',
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _authorityValue = newValue!;
                  });
                },
                items: <String>['Within Authority', 'Outside Authority']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // Row 6
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Nội dung đơn',
                ),
                maxLines: null, // Allows for multi-line input
              ),
                    // row 5

                    // row 6

                    // row 7
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: buildDateField(context, 'Thời hạn'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: integerController,
                            decoration: InputDecoration(labelText: 'Số ngày'),
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
                              Text('Xác nhận đơn'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Nơi đang xử lý'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // row 8
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Nhập mới'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Update'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Trùng đơn+ việc'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Tiến độ'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Section 2->5
              Section(
                  title: 'PHÂN LOẠI ĐƠN',
                  content: Text('Content for Phân loại đơn')),
              Section(
                  title: 'NƠI NHẬN ĐƯỢC ĐƠN',
                  content: Text('Content for Nơi nhận được đơn')),
              Section(
                  title: 'QUÁ TRÌNH XỬ LÝ',
                  content: Text('Content for Quá trình xử lý')),
              Section(
                  title: 'CÁC KẾT LUẬN',
                  content: Text('Content for Các kết luận')),
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
        suffixIcon: Icon(Icons.calendar_today),
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

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
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
              child: Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          content,
        ],
      ),
    );
  }
}
