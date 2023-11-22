import 'package:flutter/material.dart';

class AppDropdownItem extends StatefulWidget {
  final String label;
  final List<String> items;
  const AppDropdownItem({super.key, required this.label, required this.items});

  @override
  State<AppDropdownItem> createState() => _AppDropdownItemState();
}

class _AppDropdownItemState extends State<AppDropdownItem > {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Expanded(
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: widget.label,
            border: OutlineInputBorder(),
          ),
          value: widget.items.first,
          onChanged: (String? newValue) {
            // Handle dropdown changes
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, overflow: TextOverflow.ellipsis,),
            );
          }).toList(),
        ),
      ),
    );
  }
}