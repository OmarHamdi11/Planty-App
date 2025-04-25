import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class ConfirmOrderButton extends StatelessWidget {
  const ConfirmOrderButton({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.gradient,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              "Confirm Order",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
