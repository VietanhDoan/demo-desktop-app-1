import 'package:flutter/material.dart';

class SectionBox extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionBox({Key? key, required this.title, required this.child})
      : super(key: key);

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