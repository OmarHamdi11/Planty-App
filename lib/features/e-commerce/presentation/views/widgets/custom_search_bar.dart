import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.onChanged,
  });

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        onChanged: onChanged,
        cursorColor: AppColors.primaryColor,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: 'Search plant',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Container(
            padding: const EdgeInsets.all(12.0),
            child: const Icon(
              Icons.search,
              color: AppColors.primaryColor, // Icon color
              size: 32,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor, // Border color
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor, // Focus border color
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
      ),
    );
  }
}
