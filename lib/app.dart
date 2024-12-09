import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/utils/dimensions.dart';
import 'package:recorrentes/utils/expenses.dart';
import 'package:recorrentes/utils/money.dart';
import 'package:recorrentes/widgets/shared/app_bar_title.dart';
import 'package:recorrentes/widgets/expenses/expense_item.dart';
import 'package:recorrentes/widgets/expenses/floating_button_expense_form.dart';

class AppState extends State<App> {
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    final expensesProvider = context.read<ExpensesProvider>();
    if (!isInitialized) {
      expensesProvider.getSavedExpenses();
      isInitialized = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final expensesProvider = context.watch<ExpensesProvider>();
    final expenses = expensesProvider.expenses;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const FloatingButtonExpenseForm(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const AppBarTitle(
          title: 'Recorrentes',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          ),
          SizedBox(
            height: getWindowHeight(context) - 100,
            child: ReorderableListView(
              padding: const EdgeInsets.all(0),
              onReorder: expensesProvider.orderExpense,
              children: [
                for (int index = 0; index < expenses.length; index += 1)
                  ExpenseItem(
                    key: Key('$index'),
                    item: expenses[index],
                    dragIndex: index,
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  createState() => AppState();
}
