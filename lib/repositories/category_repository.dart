import '../data/category_data.dart';
import '../models/category.dart';

class CategoryRepository {
  List<Category> getCategories() {
    return CategoryData().categories;
  }
}