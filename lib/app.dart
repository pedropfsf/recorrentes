import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/utils/dimensions.dart';
import 'package:recorrentes/widgets/expenses/counters.dart';
import 'package:recorrentes/widgets/expenses/reload_expense_button.dart';
import 'package:recorrentes/widgets/shared/app_bar_title.dart';
import 'package:recorrentes/widgets/expenses/expense_item.dart';
import 'package:recorrentes/widgets/expenses/add_expense_button.dart';

class AppState extends State<App> {
  @override
  void initState() {
    final expensesProvider = context.read<ExpensesProvider>();
    expensesProvider.getSavedExpenses();

    super.initState();
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
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const AppBarTitle(
          title: 'Recorrentes',
        ),
        actions: const [
          ReloadExpenseButton(),
          AddExpenseButton(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Counters(),
          ),
          SizedBox(
            height: getWindowHeight(context) - 116,
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
