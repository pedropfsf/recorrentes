import 'package:flutter/material.dart';
import 'package:recorrentes/widgets/expenses/expense_form.dart';

class FloatingButtonExpenseForm extends StatelessWidget {
  const FloatingButtonExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    void closeBottomSheet() {
      Navigator.pop(context);
    }

    void openBottomSheet() {
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
