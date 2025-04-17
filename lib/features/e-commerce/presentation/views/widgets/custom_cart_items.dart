import 'package:flutter/material.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/custom_cart_card.dart';

class CustomCartItems extends StatelessWidget {
  const CustomCartItems({
    super.key,
    required this.cartItems,
    required this.cartProvider,
  });

  final List<ProductModel> cartItems;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          final quantity = cartProvider.getQuantity(product);

          return CustomCartCard(
            product: product,
            cartProvider: cartProvider,
            quantity: quantity,
          );
        },
      ),
    );
  }
}
