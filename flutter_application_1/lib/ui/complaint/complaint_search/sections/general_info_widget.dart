import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_date_field.dart';
import 'package:flutter_application_1/utils/app_text_field.dart';
import 'package:flutter_application_1/utils/dropdown.dart';

class GeneralInfoWidget extends StatefulWidget {
  const GeneralInfoWidget({super.key});

  @override
  State<GeneralInfoWidget> createState() => _GeneralInfoWidgetState();
}

class _GeneralInfoWidgetState extends State<GeneralInfoWidget> {
  String selectedAuthority = 'Đơn thuộc thẩm quyền';
  String selectedReturnOrder = 'Có';
  String selectedConfirmOrder = 'Hiện tất';
  int? daysToDeadline;

  TextEditingController reportDateController = TextEditingController();

  @override
  void dispose() {
    reportDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: AppDropdown(
                      label: 'Thẩm quyền',
                      items: [
                        'Đơn thuộc thẩm quyền',
                        'Đơn không thuộc thẩm quyền'
                      ],
                      value: selectedAuthority,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          // Check for null
                          setState(() => selectedAuthority = newValue);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 8.0), // Spacing between the dropdowns
                  Expanded(
                    child: AppDropdown(
                      label: 'Trả lại đơn',
                      items: ['Có', 'Không'],
                      value: selectedReturnOrder,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          // Check for null
                          setState(() => selectedReturnOrder = newValue);
                        }
                      },
                    ),
                  ),
                ],
              ),
              buildRowTextFields('Số TT', 'Đơn vị'),
              buildDateRangePicker('Ngày đơn lần đầu từ ngày', 'đến ngày'),
              AppTextField(hint: 'Địa chỉ'),
              AppTextField(hint: 'Nội dung đơn'),
            ],
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppDropdown(
                label: 'Xác nhận đơn',
                items: ['Hiện tất', 'Hiện một phần'],
                value: selectedConfirmOrder,
                onChanged: (newValue) {
                  if (newValue != null) {
                    // Check for null
                    setState(() => selectedConfirmOrder = newValue);
                  }
                },
              ),
              SizedBox(height: 8.0),
              buildDateRangePicker('Thụ lý từ ngày', 'đến ngày'),
              AppTextField(hint: 'Họ và tên'),
              buildNumberField('Số ngày sắp quá hạn'),
              buildDateRangePicker('Thời hạn từ ngày', 'đến ngày'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDateRangePicker(String firstLabel, String secondLabel) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AppDateField(
                label: firstLabel, controller: reportDateController),
          ),
        ),
        Expanded(
          child: AppDateField(
              label: secondLabel, controller: reportDateController),
        ),
      ],
    );
  }

  Widget buildRowTextFields(String firstHint, String secondHint) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AppTextField(hint: firstHint),
          ),
        ),
        Expanded(
          child: AppTextField(hint: secondHint),
        ),
      ],
    );
  }

  Widget buildNumberField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
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
}
