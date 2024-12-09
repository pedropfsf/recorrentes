import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/widgets/expenses/form/expense_form.dart';

class FloatingButtonExpenseForm extends StatelessWidget {
  const FloatingButtonExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    final expensesProvider = context.read<ExpensesProvider>();

    void closeBottomSheet() {
      Navigator.pop(context);
    }

    void openBottomSheet() {
      expensesProvider.setExpenseForEdit(null);
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return ExpenseForm(
            onClose: closeBottomSheet,
          );
        },
      );
    }

    return FloatingActionButton(
      onPressed: openBottomSheet,
      child: const Icon(Icons.add),
    );
  }
}
