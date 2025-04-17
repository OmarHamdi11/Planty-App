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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppBarButton(
                icon: Icons.person_outline_rounded,
                onTap: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
