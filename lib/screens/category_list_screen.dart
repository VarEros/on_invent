import 'package:flutter/material.dart';
import '../data/category_data.dart';
import '../widgets/category_elem_widget.dart';


class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryList = CategoryData().categories;

    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return CategoryElemWidget(category: categoryList[index]);
      },
    );
  }
}