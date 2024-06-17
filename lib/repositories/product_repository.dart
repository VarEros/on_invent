import '../data/product_data.dart';
import '../models/product.dart';

class ProductRepository {
  List<Product> getProducts() {
    return ProductData().products;
  }
}