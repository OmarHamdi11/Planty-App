import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';

class CustomCartCard extends StatelessWidget {
  const CustomCartCard({
    super.key,
    required this.product,
    required this.cartProvider,
    required this.quantity,
  });

  final ProductModel product;
  final CartProvider cartProvider;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),

            // Product info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Quantity controls
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 18),
                  onPressed: () {
                    cartProvider.decreaseQuantity(product);
                  },
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, size: 18),
                  onPressed: () {
                    cartProvider.increaseQuantity(product);
                  },
                ),
              ],
            ),
            const SizedBox(width: 8),
            // Remove button
            TextButton(
              onPressed: () {
                cartProvider.removeFromCart(product);
              },
              child: const Text(
                "Remove",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
