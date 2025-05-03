import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/widgets/error_view.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/e-commerce/presentation/manager/product_cubit/product_cubit.dart';
import 'package:planty/features/e-commerce/presentation/manager/product_cubit/product_state.dart';
import 'package:planty/features/e-commerce/presentation/views/cart_view.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
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
              cartNavigation: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ),
                );
              },
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
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor),
                    ),
                  );
                } else if (state is ProductLoaded) {
                  final filteredProducts = state.products.where((product) {
                    final matchesCategory = selectedCategory == "All" ||
                        product.type == selectedCategory;
                    final matchesSearch = product.name
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
                    return matchesCategory && matchesSearch;
                  }).toList();

                  return filteredProducts.isNotEmpty
                      ? CustomProductGrid(filteredProducts: filteredProducts)
                      : const Expanded(
                          child: Center(child: Text('No products found.')),
                        );
                } else if (state is ProductError) {
                  return Expanded(
                    child: ErrorView(
                      errorMessage: state.message,
                      onRetry: () {
                        context.read<ProductCubit>().fetchProducts();
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
