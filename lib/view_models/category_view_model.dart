import 'package:ecommerce_midterm/utils/enum_constant.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  Categories selectedCategory = Categories.tShirt;

  setCategory(Categories value) {
    selectedCategory = value;
    notifyListeners();
  }

  String getCategoryStrings(Categories selected) {
    switch (selected) {
      case Categories.jacket:
        return "Jacket";
      case Categories.jean:
        return "Jean";
      case Categories.tShirt:
        return "T-Shirt";
      case Categories.tankTop:
        return "Tank Top";
      case Categories.kaki:
        return "Ka Ki";
      case Categories.polo:
        return "Polo";
      case Categories.short:
        return "Short";
      default:
        return "";
    }
  }
}
