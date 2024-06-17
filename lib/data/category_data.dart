import '../models/category.dart';

class CategoryData {
  List<Category> categories = [
    Category(
      id: 1,
      name: 'Blusa',
      icon: 0xf03c3,
      description: 'Blusas de moda para mujeres',
    ),
    Category(
      id: 2,
      name: 'Pantalón',
      icon: 0xf03c3,
      description: 'Pantalones de moda para mujeres',
    ),
    Category(
      id: 3,
      name: 'Zapato',
      icon: 0xe139,
      description: 'Zapatos de moda para mujeres',
    ),
    Category(
      id: 4,
      name: 'Bolso',
      icon: 0xe139,
      description: 'Bolsos de moda para mujeres',
    ),
    Category(
      id: 5,
      name: 'Accesorio',
      icon: 0xe139,
      description: 'Accesorios de moda para mujeres',
    ),
  ];
}