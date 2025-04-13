import 'package:flutter/material.dart';

class SignOutCustomButton extends StatelessWidget {
  const SignOutCustomButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: SizedBox(
        height: 48,
        width: MediaQuery.of(context).size.width / 2 - 48,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
          ),
          child: const Text(
            "Sign Out",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
