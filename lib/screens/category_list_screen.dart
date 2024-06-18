import 'package:flutter/material.dart';
import '../data/category_data.dart';
import '../models/category.dart';
import '../widgets/category_elem_widget.dart';


class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<Category> categoryList = CategoryData().categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return CategoryElemWidget(category: categoryList[index]);
      },
    );
  }
}