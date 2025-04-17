// // 'https://images.pexels.com/photos/8258536/pexels-photo-8258536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'

import 'package:flutter/material.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/home/presentation/views/widgets/app_bar_button.dart';

class CustomCommerceAppBar extends StatelessWidget {
  const CustomCommerceAppBar({
    super.key,
    required this.cartProvider,
    required this.cartNavigation,
  });

  final CartProvider cartProvider;
  final void Function()? cartNavigation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Planty Shop',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBarButton(
                  onTap: cartNavigation,
                  icon: Icons.shopping_cart_outlined,
                ),
              ),
              if (cartProvider.cartCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartProvider.cartCount.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
