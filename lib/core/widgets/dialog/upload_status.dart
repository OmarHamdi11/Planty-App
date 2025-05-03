import 'package:flutter/material.dart';

enum UploadStatus { success, error }

class ResultStatusDialog extends StatelessWidget {
  final UploadStatus status;
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const ResultStatusDialog({
    super.key,
    required this.status,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSuccess = status == UploadStatus.success;
    final icon = isSuccess ? Icons.check : Icons.close;
    final iconColor = isSuccess ? Colors.green : Colors.red;
    final buttonColor = isSuccess ? Colors.greenAccent : Colors.redAccent;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(24),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: iconColor.withOpacity(0.1),
              child: Icon(icon, size: 40, color: iconColor),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: onPressed,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
