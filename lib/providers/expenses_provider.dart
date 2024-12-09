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

  void editExpense(ExpenseModel item) {
    final index = _expenses.indexWhere((expense) => expense.id == item.id);
    _expenses[index] = item;
    notifyListeners();
  }

  void removeExpense(ExpenseModel item) {
    final index = _expenses.indexWhere((expense) => expense.id == item.id);
    if (index > -1) {
      _expenses.removeAt(index);
    }
    notifyListeners();
  }

  void orderExpense(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final ExpenseModel element = _expenses.removeAt(oldIndex);
    _expenses.insert(newIndex, element);
    notifyListeners();
  }

  void setExpenseForEdit(ExpenseModel? item) {
    expenseForEdit = item;
  }

  UnmodifiableListView<ExpenseModel> get expenses {
    return UnmodifiableListView(_expenses);
  }
}
