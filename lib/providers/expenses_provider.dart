import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:recorrentes/models/expense_model.dart';

class ExpensesProvider with ChangeNotifier {
  final List<ExpenseModel> _expenses = [];
  ExpenseModel? expenseForEdit;

  void addExpense(ExpenseModel item) {
    _expenses.add(item);
    notifyListeners();
  }

  void removeExpense(ExpenseModel item) {
    final index = _expenses.indexWhere((expense) => item.id == item.id);
    _expenses.removeAt(index);
    notifyListeners();
  }

  void setExpense(ExpenseModel item) {
    expenseForEdit = item;
  }

  UnmodifiableListView<ExpenseModel> get expenses {
    return UnmodifiableListView(_expenses);
  }
}
