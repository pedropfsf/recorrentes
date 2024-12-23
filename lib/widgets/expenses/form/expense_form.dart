import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:recorrentes/utils/date.dart';
import 'package:recorrentes/utils/money.dart';
import 'package:recorrentes/models/expense_model.dart';
import 'package:recorrentes/providers/expenses_provider.dart';
import 'package:recorrentes/widgets/shared/money_field.dart';
import 'package:recorrentes/widgets/shared/date_picker.dart';
import 'package:recorrentes/widgets/shared/custom_text_field.dart';
import 'package:recorrentes/widgets/expenses/form/form_footer.dart';
import 'package:recorrentes/widgets/expenses/form/form_header.dart';

const uuid = Uuid();

class ExpenseFormState extends State<ExpenseForm> {
  String? selectedDate;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final CurrencyTextFieldController valueController =
      CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initIntValue: 0,
  );
  final TextEditingController paymentDateController = TextEditingController();

  void clearContent() {
    titleController.clear();
    descriptionController.clear();
    valueController.clear();
    paymentDateController.clear();
  }

  @override
  void initState() {
    clearContent();
    final expensesModel = context.watch<ExpensesProvider>();
    final expenseForEdit = expensesModel.expenseForEdit;
    if (expenseForEdit != null) {
      titleController.text = expenseForEdit.title;
      descriptionController.text = expenseForEdit.description!;
      valueController.text = getMoney(expenseForEdit.value);

      if (expenseForEdit.paymentDate != null) {
        paymentDateController.text =
            dateForFront(expenseForEdit.paymentDate) ?? '';
        selectedDate = expenseForEdit.paymentDate!;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final expensesProvider = context.watch<ExpensesProvider>();

    final registerButtonTitle =
        expensesProvider.expenseForEdit != null ? 'Editar' : 'Salvar';
    final formTitle = expensesProvider.expenseForEdit != null
        ? 'Editar despesa'
        : 'Salvar despesa';

    void close() {
      setState(() {
        selectedDate = null;
      });
      clearContent();
      widget.onClose!();
    }

    void removeEspense() {
      final expenseForEdit = expensesProvider.expenseForEdit;
      if (expenseForEdit != null) {
        expensesProvider.removeExpense(expenseForEdit);
        expensesProvider.setExpenseForEdit(null);
        clearContent();
        widget.onClose!();
      }
    }

    void saveExpense() {
      final expenseForEdit = expensesProvider.expenseForEdit;
      final id = expenseForEdit != null ? expenseForEdit.id : uuid.v4();

      final ExpenseModel record = ExpenseModel(
        id: id,
        title: titleController.value.text.trim(),
        description: descriptionController.value.text.trim(),
        paymentDate: selectedDate,
        value: valueController.doubleValue,
      );

      if (record.title.isEmpty || record.value == 0) {
        return;
      }

      if (expensesProvider.expenseForEdit != null) {
        expensesProvider.editExpense(record);
      } else {
        expensesProvider.addExpense(record);
      }

      clearContent();
      Navigator.of(context).pop();
    }

    void extractDate(DateTime? date) {
      setState(() {
        selectedDate = date.toString();
      });
    }

    return Padding(
      padding: const EdgeInsets.all(16).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormHeader(
            title: formTitle,
            onClose: close,
          ),
          CustomTextField(
            controller: titleController,
            label: 'Título',
          ),
          const SizedBox(height: 14),
          CustomTextField(
            controller: descriptionController,
            maxLines: 2,
            hintText: 'Descrição',
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: MoneyField(
                  controller: valueController,
                  label: 'Valor',
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: DatePicker(
                  controller: paymentDateController,
                  label: 'Data de pagamento',
                  onSelectDate: extractDate,
                  onLoad: (date) => extractDate(date),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          FormFooter(
            deleteButtonVisible: expensesProvider.expenseForEdit != null,
            saveButtonTitle: registerButtonTitle,
            onDelete: removeEspense,
            onSave: saveExpense,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, this.onClose});

  final VoidCallback? onClose;

  @override
  createState() => ExpenseFormState();
}
