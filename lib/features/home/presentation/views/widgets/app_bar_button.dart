import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.shadowColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: AppColors.primaryColor,
          size: 40,
        ),
      ),
    );
  }
}
