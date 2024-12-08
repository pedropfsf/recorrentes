import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final TextEditingController controller = TextEditingController();

class DatePickerState extends State<DatePicker> {
  DateTime currentDate = DateTime.now();
  final dateFormatter = DateFormat('dd/MM/yyyy');

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

      if (selectedDate != null) {
        controller.text = dateFormatter.format(selectedDate);
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
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.title,
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
  const DatePicker({super.key, this.title, this.onSelectDate});

  final String? title;
  final void Function(DateTime? date)? onSelectDate;

  @override
  createState() => DatePickerState();
}
