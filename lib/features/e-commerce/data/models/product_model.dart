class ProductModel {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final String? description;

  ProductModel({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    this.description,
  });
}
