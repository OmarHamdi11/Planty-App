import 'package:flutter/material.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/home/presentation/views/widgets/app_bar_button.dart';

class CartNavigationButton extends StatelessWidget {
  const CartNavigationButton({
    super.key,
    required this.cartProvider,
    required this.cartNavigation,
  });

  final CartProvider cartProvider;
  final void Function()? cartNavigation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 24),
          child: AppBarButton(
            onTap: cartNavigation,
            icon: Icons.shopping_cart_outlined,
          ),
        ),
        if (cartProvider.cartCount > 0)
          Positioned(
            right: 16,
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
    );
  }
}
