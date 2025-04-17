import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class SaveCustomButton extends StatelessWidget {
  const SaveCustomButton({
    required this.onPressed,
    super.key,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.gradient,
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primaryColor,
            ),
            child: const Center(
              child: Text(
                "Save",
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
