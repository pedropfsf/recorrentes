import 'package:intl/intl.dart';

String getMoney(num value) {
  final numberFormatter = NumberFormat("#,##0.00", "pt_BR");
  return "R\$ ${numberFormatter.format(value)}";
}
