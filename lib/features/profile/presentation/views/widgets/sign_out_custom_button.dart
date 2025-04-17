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
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red.shade300,
            ),
            child: const Center(
              child: Text(
                "SignOut",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
