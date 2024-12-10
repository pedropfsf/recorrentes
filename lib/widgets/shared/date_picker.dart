import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:recorrentes/utils/date.dart';

class DatePickerState extends State<DatePicker> {
  DateTime currentDate = DateTime.now();
  final dateFormatter = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    debugPrint(widget.controller!.text);
    final date = dateForDateTime(widget.controller!.text) ?? DateTime.now();
    setState(() {
      currentDate = date;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<DateTime?> selectDate(
      BuildContext context,
    ) async {
      final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      );

      if (selectedDate != null && widget.controller != null) {
        widget.controller?.text = dateFormatter.format(selectedDate);
        setState(() {
          currentDate = selectedDate;
        });
      }

      return selectedDate;
    }

    return TextField(
      readOnly: true,
      onTap: () {
        selectDate(context).then((date) {
          widget.onSelectDate!(date);
        });
      },
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        label: widget.label != null ? Text(widget.label!) : null,
        hintText: widget.hintText,
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

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    this.label,
    this.hintText,
    this.onSelectDate,
    this.controller,
    this.onLoad,
  });

  final String? label;
  final String? hintText;
  final void Function(DateTime? date)? onSelectDate;
  final void Function(DateTime? date)? onLoad;
  final TextEditingController? controller;

  @override
  createState() => DatePickerState();
}
