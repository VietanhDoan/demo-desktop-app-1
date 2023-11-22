import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final void Function(String?) onChanged;
  const AppDropdown({super.key, required this.label, required this.items, this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      value: value,
      onChanged: (value) => onChanged(
          value), // The onChanged callback now handles a nullable String
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}