import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/e-commerce/presentation/views/cart_view.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/add_to_cart_button.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/cart_navigation_button.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/custom_description_widget.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/name_and_price_custom_widget.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final isInCart = cartProvider.isInCart(product);

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          CartNavigationButton(
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image
            ImageCustomWidget(product: product),
            const SizedBox(height: 16),

            // Name and Price
            NameAndPriceCustomWidget(product: product),
            const SizedBox(height: 10),

            // Add to cart button
            AddToCartButton(
              isInCart: isInCart,
              cartProvider: cartProvider,
              product: product,
            ),
            const SizedBox(height: 20),

            // Description
            CustomDescriptionWidget(product: product),
          ],
        ),
      ),
    );
  }
}

class ImageCustomWidget extends StatelessWidget {
  const ImageCustomWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        product.imageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
