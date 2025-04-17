import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.onTap,
  });

  final IconData? icon;
  final String title;
  final String subTitle;
  final String imagePath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: Colors.black12),
            BoxShadow(blurRadius: 4, color: Colors.black12),
            BoxShadow(blurRadius: 4, color: Colors.black12),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: AppColors.primaryColor,
          ),
        ),
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: AppFonts.poppins,
                    fontSize: 25,
                  ),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ],
            ),
            Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
