import 'package:flutter/material.dart';

class Utils extends ChangeNotifier {
  bool _isGridView = false;
  get isGridView => _isGridView;

  void changeView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }

  List<int> _categoriesSelected = [];
  get categoriesSelected => _categoriesSelected;

  void setSelectedCategories(List<int> categories) {
    _categoriesSelected = categories;
    notifyListeners();
  }
}