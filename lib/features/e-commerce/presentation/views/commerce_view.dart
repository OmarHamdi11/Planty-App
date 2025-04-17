import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/custom_category_tabs.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/custom_commerce_app_bar.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/custom_product_grid.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

class CommerceView extends StatefulWidget {
  const CommerceView({super.key});

  @override
  State<CommerceView> createState() => _CommerceViewState();
}

class _CommerceViewState extends State<CommerceView> {
  String selectedCategory = "All";
  String searchText = "";

  final List<String> categories = [
    "All",
    "Popular",
    "Recommended",
    "Indoor",
    "Outdoor"
  ];

  final List<ProductModel> allProducts = [
    ProductModel(
      name: 'Melon',
      category: 'Popular',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 4,
      description:
          'Melon is a delicious and refreshing fruit that is perfect for summer. It is low in calories and high in vitamins A and C.',
    ),
    ProductModel(
      name: 'Orange',
      category: 'Outdoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 2,
    ),
    ProductModel(
      name: 'Paddy',
      category: 'Recommended',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1,
    ),
    ProductModel(
      name: 'Papaya',
      category: 'Outdoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 6,
    ),
    ProductModel(
      name: 'Melon',
      category: 'Popular',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 4,
    ),
    ProductModel(
      name: 'Orange',
      category: 'Outdoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 2,
    ),
    ProductModel(
      name: 'Paddy',
      category: 'Recommended',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1,
    ),
    ProductModel(
      name: 'Papaya',
      category: 'Outdoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 6,
    ),
    ProductModel(
      name: 'Melon',
      category: 'Popular',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 4,
    ),
    ProductModel(
      name: 'Orange',
      category: 'Outdoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 2,
    ),
    ProductModel(
      name: 'Paddy',
      category: 'Recommended',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1,
    ),
    ProductModel(
      name: 'Papaya',
      category: 'Indoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 6,
    ),
    ProductModel(
      name: 'Melon',
      category: 'Popular',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 4,
    ),
    ProductModel(
      name: 'Orange',
      category: 'Outdoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 2,
    ),
    ProductModel(
      name: 'Paddy',
      category: 'Recommended',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1,
    ),
    ProductModel(
      name: 'Papaya',
      category: 'Outdoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 6,
    ),
    ProductModel(
      name: 'Melon',
      category: 'Popular',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 4,
    ),
    ProductModel(
      name: 'Orange',
      category: 'Indoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 2,
    ),
    ProductModel(
      name: 'Paddy',
      category: 'Recommended',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1,
    ),
    ProductModel(
      name: 'Papaya',
      category: 'Indoor',
      imageUrl:
          'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 6,
    ),
  ];

  List<ProductModel> get filteredProducts {
    return allProducts.where((product) {
      final matchesCategory =
          selectedCategory == "All" || product.category == selectedCategory;
      final matchesSearch =
          product.name.toLowerCase().contains(searchText.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomCommerceAppBar(
              cartProvider: cartProvider,
              cartNavigation: () {},
            ),
            const SizedBox(height: 10),
            // Search Bar
            CustomSearchBar(
              onChanged: (value) => setState(() => searchText = value),
            ),
            const SizedBox(height: 10),
            // Category Tabs
            CustomCategoryTabs(
              categories: categories,
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
              selectedColor: AppColors.primaryColor,
              unselectedTextColor: AppColors.primaryColor,
            ),

            const SizedBox(height: 20),

            // Product Grid
            CustomProductGrid(filteredProducts: filteredProducts),
          ],
        ),
      ),
    );
  }
}
