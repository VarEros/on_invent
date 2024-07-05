import '../models/product.dart';

class ProductData {
  List<Product> products = [
    Product(
      id: 1,
      categoryId: 1,
      name: 'Blusa de moda',
      description: 'Blusa de moda para mujeres',
      stock: 20,
      sellingPrice: 25,
      buyingPrice: 15,
      imageUrl: 'assets/images/Screenshot 2024-06-18 163920.png',
    ),
    Product(
      id: 2,
      categoryId: 1,
      name: 'Blusa casual',
      description: 'Blusa casual para mujeres',
      stock: 10,
      sellingPrice: 20,
      buyingPrice: 10,
      imageUrl: 'assets/images/Screenshot 2024-06-18 163920.png',
    ),
    // Product(
    //   id: 3,
    //   categoryId: 1,
    //   name: 'Blusa elegante',
    //   sellingPrice: 30.00,
    //   buyingPrice: 20.00,
    //   imageUrl: 'assets/images/blusa3.jpg',
    //   description: 'Blusa elegante para mujeres',
    // ),
    // Product(
    //   id: 4,
    //   categoryId: 2,
    //   name: 'Pantalón de mezclilla',
    //   sellingPrice: 40.00,
    //   buyingPrice: 30.00,
    //   imageUrl: 'assets/images/pantalon.jpg',
    //   description: 'Pantalón de mezclilla para mujeres',
    // ),
    // Product(
    //   id: 5,
    //   categoryId: 2,
    //   name: 'Pantalón de vestir',
    //   sellingPrice: 50.00,
    //   buyingPrice: 40.00,
    //   imageUrl: 'assets/images/pantalon2.jpg',
    //   description: 'Pantalón de vestir para mujeres',
    // ),
    // Product(
    //   id: 6,
    //   categoryId: 2,
    //   name: 'Pantalón casual',
    //   sellingPrice: 35.00,
    //   buyingPrice: 25.00,
    //   imageUrl: 'assets/images/pantalon3.jpg',
    //   description: 'Pantalón casual para mujeres',
    // ),
  ];
}