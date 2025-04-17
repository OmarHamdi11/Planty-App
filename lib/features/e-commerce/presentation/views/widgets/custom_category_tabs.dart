import 'package:flutter/material.dart';

class CustomCategoryTabs extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final Color selectedColor;
  final Color unselectedTextColor;

  const CustomCategoryTabs({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.selectedColor,
    required this.unselectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : unselectedTextColor,
                ),
              ),
              backgroundColor: Colors.white,
              selectedColor: selectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: selectedColor,
                  width: 1,
                ),
              ),
              selected: isSelected,
              onSelected: (_) => onCategorySelected(category),
            ),
          );
        },
      ),
    );
  }
}
