import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class CommunityCustomAppBar extends StatelessWidget {
  const CommunityCustomAppBar({
    super.key,
    this.onTap,
    required this.icon,
  });

  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Planty Community',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
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
        ),
      ],
    );
  }
}
