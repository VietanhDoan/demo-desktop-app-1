import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  const AppTextField({super.key, required this.hint});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hint,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}