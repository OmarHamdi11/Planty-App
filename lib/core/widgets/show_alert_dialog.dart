import 'package:flutter/material.dart';

void showAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  String confirmText = 'OK',
  VoidCallback? onConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onConfirm != null) {
              onConfirm();
            }
          },
          child: Text(confirmText),
        ),
      ],
    ),
  );
}
