import 'package:intl/intl.dart';

String dateForFront(String value) {
  final dateFormatter = DateFormat('dd/MM/yyyy');
  final date = DateTime.parse(value);
  return dateFormatter.format(date);
}
