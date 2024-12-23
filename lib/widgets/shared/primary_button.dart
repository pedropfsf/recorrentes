import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.title = 'Clique me',
  });

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.onPrimary;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? primaryColor,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
