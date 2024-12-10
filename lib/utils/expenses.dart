import 'package:recorrentes/models/expense_model.dart';

double getTotalExpenseAmount(List<ExpenseModel> expenses) {
  double finalValue = 0.0;

  for (final expense in expenses) {
    finalValue += expense.value;
  }

  return finalValue;
}
