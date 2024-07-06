import 'package:flutter/material.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/repositories/product_repository.dart';

class ProductService extends ChangeNotifier {
  List<Product> _products = [];
  get products => _products;

  getProducts() async {
    _products = await ProductRepository().getLocalProducts();
    notifyListeners();
  }
}