import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/providers/expenses_provider.dart';

class ReloadExpenseButton extends StatelessWidget {
  const ReloadExpenseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final expensesProvider = context.read<ExpensesProvider>();

    void reload() {
      expensesProvider.unpayAllExpenses();
    }

    return IconButton(
      onPressed: reload,
      icon: const Icon(Icons.refresh),
    );
  }
}
