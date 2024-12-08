import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';

class MoneyField extends StatelessWidget {
  const MoneyField({
    super.key,
    this.title,
    this.maxLines,
    this.controller,
  });

  final String? title;
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
        hintText: title,
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
