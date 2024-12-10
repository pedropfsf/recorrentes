import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/utils/expenses.dart';
import 'package:recorrentes/utils/money.dart';

class Counters extends StatelessWidget {
  const Counters({super.key});

  @override
  Widget build(BuildContext context) {
    final expensesProvider = context.watch<ExpensesProvider>();
    final expenses = expensesProvider.expenses;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Quantidade: ${expenses.length}',
        ),
        const SizedBox(width: 16),
        Text(
          'Total: ${getMoney(getTotalExpenseAmount(expenses))}',
        ),
      ],
    );
  }
}
