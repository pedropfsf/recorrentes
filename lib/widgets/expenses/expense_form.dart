import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recorrentes/models/expense_model.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/widgets/shared/money_field.dart';
import 'package:recorrentes/widgets/shared/date_picker.dart';
import 'package:recorrentes/widgets/shared/custom_text_field.dart';

final TextEditingController titleController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();
final CurrencyTextFieldController valueController = CurrencyTextFieldController(
  decimalSymbol: '.',
  thousandSymbol: ',',
  initIntValue: 0,
);
final TextEditingController paymentDateController = TextEditingController();

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key, this.onClose});

  final dynamic onClose;

  @override
  Widget build(BuildContext context) {
    void clearContent() {
      titleController.clear();
      descriptionController.clear();
      valueController.clear();
      paymentDateController.clear();
    }

    void saveExpense() {
      final ExpenseModel record = ExpenseModel(
        title: titleController.value.text.trim(),
        description: descriptionController.value.text.trim(),
        paymentDate: paymentDateController.value.text.trim(),
        value: valueController.intValue,
      );

      if (record.title.isEmpty || record.value == 0) {
        return;
      }

      context.read<ExpensesProvider>().addExpense(record);

      clearContent();
      Navigator.of(context).pop();
    }

    void extractDate(DateTime? date) {
      paymentDateController.text = date.toString();
    }

    return Padding(
      padding: const EdgeInsets.all(16).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Despesa',
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close),
              )
            ],
          ),
          CustomTextField(
            controller: titleController,
            title: 'Título',
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: descriptionController,
            maxLines: 2,
            title: 'Descrição',
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: MoneyField(
                  controller: valueController,
                  title: 'Valor',
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: DatePicker(
                  title: 'Data de pagamento',
                  onSelectDate: extractDate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: saveExpense,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: const Text(
                'Salvar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
