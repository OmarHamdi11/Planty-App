import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.formKey,
    required this.text,
  });

  final String text;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff49640F)), // Green border
        borderRadius: BorderRadius.circular(30.0), // Rounded border
      ),
      child: TextButton(
        onPressed: () {
          formKey.currentState!.validate();
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded border
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            color: Color(0xff49640F),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
