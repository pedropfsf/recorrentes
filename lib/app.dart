import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/widgets/shared/app_bar_title.dart';
import 'package:recorrentes/widgets/expenses/expense_item.dart';
import 'package:recorrentes/widgets/expenses/floating_button_expense_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = context.watch<ExpensesProvider>().expenses;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const FloatingButtonExpenseForm(),
      appBar: AppBar(
        title: const AppBarTitle(
          title: 'Recorrentes',
        ),
      ),
      body: ListView.builder(
        itemExtent: 50.0,
        shrinkWrap: true,
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return ExpenseItem(
            item: expenses[index],
          );
        },
      ),
    );
  }
}
