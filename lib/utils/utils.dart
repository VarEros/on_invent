import 'package:flutter/material.dart';

class Utils extends ChangeNotifier {
  bool _isGridView = false;
  get isGridView => _isGridView;

  void changeView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }
}