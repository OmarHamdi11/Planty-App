import 'package:flutter/material.dart';

class CustomResetButton extends StatelessWidget {
  const CustomResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Forgot password?',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
          color: Color(0xffBBBDB6),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
