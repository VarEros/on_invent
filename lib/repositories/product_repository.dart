import '../data/product_data.dart';
import '../models/product.dart';

class ProductRepository {

  Future<List<Product>> getLocalProducts() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));
    return ProductData().products;
  }
}