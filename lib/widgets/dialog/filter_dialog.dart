import 'package:flutter/material.dart';
import 'package:on_invent/data/category_data.dart';
import 'package:on_invent/models/category.dart';
import 'package:on_invent/utils/utils.dart';

class FilterDialog extends StatefulWidget {
  final Utils utils;
  FilterDialog({ super.key, required this.utils});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  final List<Category> categoryList = CategoryData().categories;
  final List<int> categoriesSelected = [];

    @override
  void initState() {
    categoriesSelected.addAll(widget.utils.categoriesSelected);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: const Text('Filtrar Productos'),
      content: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: categoryList.map((category) {
          return FilterChip(
            label: Text(category.name),
            selected: categoriesSelected.contains(category.id),
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  categoriesSelected.add(category.id);
                } else {
                  categoriesSelected.remove(category.id);
                }
              });
            },
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            widget.utils.setSelectedCategories(categoriesSelected);
            Navigator.of(context).pop();
          },
          child: const Text('Filtrar'),
        ),
      ],
    );
  }
}