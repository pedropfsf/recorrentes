import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';

class MoneyField extends StatelessWidget {
  const MoneyField({
    super.key,
    this.label,
    this.hintText,
    this.maxLines,
    this.controller,
  });

  final String? label;
  final String? hintText;
  final int? maxLines;

  final CurrencyTextFieldController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      keyboardType: TextInputType.number,
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
