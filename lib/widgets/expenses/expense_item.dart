import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/utils/money.dart';
import 'package:recorrentes/utils/date.dart';
import 'package:recorrentes/models/expense_model.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/utils/values.dart';
import 'package:recorrentes/widgets/expenses/form/expense_form.dart';
import 'package:recorrentes/widgets/shared/primary_button.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.item, this.dragIndex = 0});

  final ExpenseModel item;
  final int? dragIndex;

  @override
  Widget build(BuildContext context) {
    final expensesProvider = context.read<ExpensesProvider>();

    void closeBottomSheet() {
      expensesProvider.setExpenseForEdit(null);
      Navigator.pop(context);
    }

    void openBottomSheet() {
      expensesProvider.setExpenseForEdit(item);
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return ExpenseForm(
            onClose: closeBottomSheet,
            context: context,
          );
        },
      );
    }

    return ListTile(
      dense: true,
      leading: SizedBox(
        width: 72,
        child: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.vertical,
          children: [
            ReorderableDragStartListener(
              index: dragIndex!,
              child: const Opacity(
                opacity: 0.5,
                child: Icon(Icons.drag_indicator),
              ),
            ),
            IconButton(
              onPressed: openBottomSheet,
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      ),
      title: Text(item.title),
      subtitle: SizedBox(
        height: 40,
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Opacity(
              opacity: 0.8,
              child: Text(
                returnIfNull(
                  dateForFront(item.paymentDate),
                  'Sem data de pagamento',
                ),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(height: 1),
            Text(
              getMoney(item.value),
              style: const TextStyle(
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
      trailing: PrimaryButton(
        onPressed: () {},
        title: 'Pagar',
      ),
    );
  }
}
