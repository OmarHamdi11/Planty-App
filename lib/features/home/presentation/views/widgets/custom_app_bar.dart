import 'package:flutter/material.dart';
import 'package:planty/features/home/presentation/views/widgets/app_bar_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarButton(
          icon: Icons.search,
          onTap: () {},
        ),
        Row(
          children: [
            AppBarButton(
              icon: Icons.shopping_cart_outlined,
              onTap: () {},
            ),
            const SizedBox(width: 16),
            AppBarButton(
              icon: Icons.person_outline_rounded,
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
