import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
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
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              "Proceed To Checkout",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
