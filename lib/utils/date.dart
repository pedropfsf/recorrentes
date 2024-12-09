import 'package:intl/intl.dart';

DateTime? dateForDateTime(String? value) {
  if (value == null || value.isEmpty) return null;
  final finalValue = value.split('/').reversed.join('-');
  return DateTime.parse(finalValue);
}

String? dateForDatabase(String? value) {
  if (value == null) return null;
  final finalValue = value.split('/').reversed.join('-');
  return DateTime.parse(finalValue).toString();
}

String? dateForFront(String? value) {
  if (value == null || value.isEmpty) return null;
  final dateFormatter = DateFormat('dd/MM/yyyy');
  final date = DateTime.parse(value);
  return dateFormatter.format(date);
}
