// import 'package:flutter/material.dart';
// import '../../data/models/product_model.dart';

// class CartProvider with ChangeNotifier {
//   final List<ProductModel> _cartItems = [];

//   List<ProductModel> get cartItems => _cartItems;

//   void addToCart(ProductModel product) {
//     _cartItems.add(product);
//     notifyListeners();
//   }

//   void removeFromCart(ProductModel product) {
//     _cartItems.remove(product);
//     notifyListeners();
//   }

//   bool isInCart(ProductModel product) {
//     return _cartItems.contains(product);
//   }

//   int get cartCount => _cartItems.length;
// }

import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> _cartItems = [];
  final Map<ProductModel, int> _quantities = {}; // quantity tracking

  List<ProductModel> get cartItems => _cartItems;

  void addToCart(ProductModel product) {
    if (_cartItems.contains(product)) {
      _quantities[product] = (_quantities[product] ?? 1) + 1;
    } else {
      _cartItems.add(product);
      _quantities[product] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    _quantities.remove(product);
    notifyListeners();
  }

  void increaseQuantity(ProductModel product) {
    if (_cartItems.contains(product)) {
      _quantities[product] = (_quantities[product] ?? 1) + 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(ProductModel product) {
    if (_quantities[product] != null && _quantities[product]! > 1) {
      _quantities[product] = _quantities[product]! - 1;
    } else {
      removeFromCart(product);
    }
    notifyListeners();
  }

  int getQuantity(ProductModel product) {
    return _quantities[product] ?? 0;
  }

  double getTotalPrice() {
    double total = 0;
    for (final product in _cartItems) {
      final quantity = _quantities[product] ?? 1;
      total += product.price * quantity;
    }
    return total;
  }

  bool isInCart(ProductModel product) {
    return _cartItems.contains(product);
  }

  int get cartCount {
    int count = 0;
    for (final quantity in _quantities.values) {
      count += quantity;
    }
    return count;
  }
}
