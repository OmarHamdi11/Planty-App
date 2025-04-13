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
        height: 48,
        width: MediaQuery.of(context).size.width / 2 - 48,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            // backgroundColor: Colors.green,
            side: const BorderSide(color: AppColors.primaryColor),
          ),
          child: const Text(
            "Save",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
