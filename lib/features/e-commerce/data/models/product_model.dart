class ProductModel {
  final int id;
  final String name;
  final String type;
  final double price;
  final String imageUrl;
  final String details;

  ProductModel({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
    required this.details,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imagePath'],
      details: json['details'],
    );
  }
}
