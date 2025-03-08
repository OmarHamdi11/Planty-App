import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class CustomForgotButton extends StatelessWidget {
  const CustomForgotButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Forgot password?",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.shadowColor,
          ),
        ),
      ),
    );
  }
}
