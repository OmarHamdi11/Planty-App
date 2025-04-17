import 'package:flutter/material.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';
import 'package:planty/features/e-commerce/presentation/views/product_detail_view.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/product_card.dart';

class CustomProductGrid extends StatelessWidget {
  const CustomProductGrid({
    super.key,
    required this.filteredProducts,
  });

  final List<ProductModel> filteredProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: filteredProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailView(product: product),
                ),
              );
            },
            child: ProductCard(product: product),
          );
        },
      ),
    );
  }
}
