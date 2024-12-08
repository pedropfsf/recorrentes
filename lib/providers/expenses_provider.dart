import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:recorrentes/models/expense_model.dart';

class ExpensesProvider with ChangeNotifier {
  final List<ExpenseModel> _expenses = [];

  void addExpense(ExpenseModel item) {
    _expenses.add(item);
    notifyListeners();
  }

  UnmodifiableListView<ExpenseModel> get expenses {
    return UnmodifiableListView(_expenses);
  }
}
