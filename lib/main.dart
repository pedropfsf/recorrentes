import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/theme/theme.dart';
import 'package:recorrentes/providers/expenses.dart';
import 'package:recorrentes/widgets/expenses/expense_form.dart';
import 'package:recorrentes/widgets/shared/app_bar_title.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpensesProvider()),
      ],
      child: MaterialApp(
        theme: themeData,
        home: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    void openBottomSheet() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ExpenseForm();
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openBottomSheet,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const AppBarTitle(
          title: 'Recorrentes',
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
