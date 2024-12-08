import 'package:recorrentes/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/theme/theme.dart';
import 'package:recorrentes/providers/expenses.dart';

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
