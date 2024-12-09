import 'dart:convert';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:recorrentes/models/expense_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpensesProvider with ChangeNotifier {
  List<ExpenseModel> _expenses = [];
  ExpenseModel? expenseForEdit;

  void addExpense(ExpenseModel item) {
    _expenses.add(item);
    setSavedExpenses();
    notifyListeners();
  }

  void editExpense(ExpenseModel item) {
    final index = _expenses.indexWhere((expense) => expense.id == item.id);
    _expenses[index] = item;
    setSavedExpenses();
    notifyListeners();
  }

  void removeExpense(ExpenseModel item) {
    final index = _expenses.indexWhere((expense) => expense.id == item.id);
    if (index > -1) {
      _expenses.removeAt(index);
    }
    setSavedExpenses();
    notifyListeners();
  }

  void orderExpense(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final ExpenseModel element = _expenses.removeAt(oldIndex);
    _expenses.insert(newIndex, element);
    setSavedExpenses();
    notifyListeners();
  }

  void setExpenseForEdit(ExpenseModel? item) {
    expenseForEdit = item;
  }

  void setSavedExpenses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final records = _expenses.map((expense) => expense.toMap()).toList();
    prefs.setString('expenses', jsonEncode(records));
  }

  void getSavedExpenses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final expensesInJson = prefs.getString('expenses');
    if (expensesInJson != null) {
      final data = jsonDecode(expensesInJson) as List<dynamic>;
      _expenses = data.map((item) => ExpenseModel.fromMap(item)).toList();
    }
    notifyListeners();
  }

  UnmodifiableListView<ExpenseModel> get expenses {
    return UnmodifiableListView(_expenses);
  }
}
