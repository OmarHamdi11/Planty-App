import 'package:flutter/material.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';

class CustomDescriptionWidget extends StatelessWidget {
  const CustomDescriptionWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Text(
          product.details,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
