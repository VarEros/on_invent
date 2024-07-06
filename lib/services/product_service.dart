import 'package:flutter/material.dart';
import 'package:on_invent/data/product_data.dart';
import 'package:on_invent/models/product.dart';

class ProductService extends ChangeNotifier {
  Future<List<Product>> getProducts() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));
    return ProductData().products;
  }

  bool _productsLoaded = false;
  get productsLoaded => _productsLoaded;

  void setProductsLoaded(bool loaded) {
    _productsLoaded = loaded;
    notifyListeners();
  }
}