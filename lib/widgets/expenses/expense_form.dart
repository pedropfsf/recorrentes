import 'package:flutter/material.dart';
import 'package:recorrentes/utils/dimensions.dart';
import 'package:recorrentes/widgets/shared/custom_text_field.dart';

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWindowWidth(context),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(),
            const SizedBox(height: 8),
            CustomTextField(),
          ],
        ),
      ),
    );
  }
}
