import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.label,
    this.maxLines,
    this.controller,
  });

  final String? label;
  final String? hintText;
  final int? maxLines;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurpleAccent,
            width: 1.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
