import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // We use Consumer to rebuild only the icon part when cart changes
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(blurRadius: 4, color: Colors.black12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.asset(
              product.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Product Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Product Category
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.category,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),

          const Spacer(),

          // Price + Cart Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, _) {
                    final isInCart = cartProvider.isInCart(product);
                    return IconButton(
                      icon: Icon(
                        isInCart
                            ? Icons.shopping_cart
                            : Icons.add_shopping_cart,
                        color: isInCart
                            ? AppColors.primaryColor
                            : AppColors.primaryColor,
                      ),
                      onPressed: () {
                        if (isInCart) {
                          cartProvider.removeFromCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("🗑️ Removed from cart"),
                            ),
                          );
                        } else {
                          cartProvider.addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("✅ Added to cart"),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
