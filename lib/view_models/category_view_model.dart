import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  String selectedCategory = 'do_an_kho';
  String searchFilter = '';

  setCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  setSearchFilter(String value) {
    searchFilter = value;
    notifyListeners();
  }
}
