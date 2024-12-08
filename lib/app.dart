import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recorrentes/widgets/shared/app_bar_title.dart';
import 'package:recorrentes/widgets/expenses/floating_button_expense_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
