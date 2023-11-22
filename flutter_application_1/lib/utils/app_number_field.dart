import 'package:flutter/material.dart';

class AppNumberField extends StatefulWidget {
  final String hint;
  const AppNumberField({super.key, required this.hint});

  @override
  State<AppNumberField> createState() => _AppNumberFieldState();
}

class _AppNumberFieldState extends State<AppNumberField> {
  int? daysToDeadline;
  @override
  Widget build(BuildContext context) {
        return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hint,
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
}