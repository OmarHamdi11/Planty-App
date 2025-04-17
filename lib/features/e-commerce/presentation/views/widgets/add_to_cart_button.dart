import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.isInCart,
    required this.cartProvider,
    required this.product,
  });

  final bool isInCart;
  final CartProvider cartProvider;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton.icon(
        onPressed: () {
          if (isInCart) {
            cartProvider.removeFromCart(product);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("🗑️ Removed from cart")),
            );
          } else {
            cartProvider.addToCart(product);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("✅ Added to cart")),
            );
          }
        },
        icon: Icon(
          isInCart ? Icons.check : Icons.add,
          size: 18,
          color: isInCart ? AppColors.primaryColor : Colors.white,
        ),
        label: Text(
          isInCart ? 'Added' : 'Add to Cart',
          style: TextStyle(
            color: isInCart ? AppColors.primaryColor : Colors.white,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isInCart ? Colors.white : AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
