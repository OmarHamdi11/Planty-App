import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class CustomNavigateWidget extends StatelessWidget {
  const CustomNavigateWidget({
    super.key,
    this.onTap,
    required this.text1,
    required this.text2,
  });

  final void Function()? onTap;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.shadowColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: text2,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
