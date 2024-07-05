import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../screens/category_screen.dart';

class CategoryElemWidget extends StatelessWidget {
  final Category category;
  const CategoryElemWidget({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(IconData(category.icon, fontFamily: 'MaterialIcons')),
      title: Text(category.name),
      subtitle: Text(category.description),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(category: category))),
    );
  }
}