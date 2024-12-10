import 'package:flutter/material.dart';
import 'package:recorrentes/widgets/shared/delete_button.dart';
import 'package:recorrentes/widgets/shared/primary_button.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key,
    required this.deleteButtonVisible,
    this.onDelete,
    this.onSave,
    required this.saveButtonTitle,
  });

  final bool deleteButtonVisible;
  final VoidCallback? onDelete;
  final VoidCallback? onSave;
  final String saveButtonTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: deleteButtonVisible,
          child: DeleteButton(
            onPressed: onDelete,
          ),
        ),
        const SizedBox(width: 8),
        PrimaryButton(
          onPressed: onSave,
          title: saveButtonTitle,
        )
      ],
    );
  }
}
