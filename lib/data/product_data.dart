import '../models/product.dart';

class ProductData {
  List<Product> products = [
    Product(
      id: 1,
      categoryId: 1,
      name: 'Blusa de moda',
      price: 25.00,
      imageUrl: 'assets/images/blusa.jpg',
      description: 'Blusa de moda para mujeres',
    ),
    Product(
      id: 2,
      categoryId: 1,
      name: 'Blusa casual',
      price: 20.00,
      imageUrl: 'assets/images/blusa2.jpg',
      description: 'Blusa casual para mujeres',
    ),
    Product(
      id: 3,
      categoryId: 1,
      name: 'Blusa elegante',
      price: 30.00,
      imageUrl: 'assets/images/blusa3.jpg',
      description: 'Blusa elegante para mujeres',
    ),
    Product(
      id: 4,
      categoryId: 2,
      name: 'Pantalón de mezclilla',
      price: 40.00,
      imageUrl: 'assets/images/pantalon.jpg',
      description: 'Pantalón de mezclilla para mujeres',
    ),
    Product(
      id: 5,
      categoryId: 2,
      name: 'Pantalón de vestir',
      price: 50.00,
      imageUrl: 'assets/images/pantalon2.jpg',
      description: 'Pantalón de vestir para mujeres',
    ),
    Product(
      id: 6,
      categoryId: 2,
      name: 'Pantalón casual',
      price: 45.00,
      imageUrl: 'assets/images/pantalon3.jpg',
      description: 'Pantalón casual para mujeres',
    ),
  ];
}