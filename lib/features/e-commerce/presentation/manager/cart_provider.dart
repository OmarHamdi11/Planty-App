import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> _cartItems = [];

  List<ProductModel> get cartItems => _cartItems;

  void addToCart(ProductModel product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  bool isInCart(ProductModel product) {
    return _cartItems.contains(product);
  }

  int get cartCount => _cartItems.length;
}
