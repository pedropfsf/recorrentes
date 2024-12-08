import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/utils/money.dart';
import 'package:recorrentes/models/expense_model.dart';
import 'package:recorrentes/widgets/expenses/expense_form.dart';
import 'package:recorrentes/widgets/shared/primary_button.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.item});

  final ExpenseModel item;

  @override
  Widget build(BuildContext context) {
    final expensesModel = context.read<ExpensesProvider>();

    void closeBottomSheet() {
      Navigator.pop(context);
    }

    void openBottomSheet() {
      expensesModel.setExpense(item);
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

    return ListTile(
      leading: IconButton(
        onPressed: openBottomSheet,
        icon: const Icon(Icons.edit),
      ),
      title: Text(item.title),
      subtitle: Text(
        getMoney(item.value),
        style: const TextStyle(
          color: Colors.green,
        ),
      ),
      trailing: PrimaryButton(
        onPressed: () {},
        title: 'Pagar',
      ),
    );
  }
}
