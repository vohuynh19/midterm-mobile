import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  List<Map<String, dynamic>> itemArr = [];
  var isLoading = false;

  void fetchItems() async {
    isLoading = true;
    itemArr = [];
    notifyListeners();
    var data = await FirebaseFirestore.instance.collection("food").get();
    data.docs.forEach((element) {
      itemArr.add(element.data());
    });

    isLoading = false;
    notifyListeners();
  }

  List<Map<String, dynamic>> getCategoryItem(String type) {
    return (itemArr.where((element) => element['category'] == type)).toList();
  }

  List<Map<String, dynamic>> filterCategoryItem(String type, String searchStr) {
    return (itemArr.where((element) =>
        element['category'] == type &&
        (element['title'] as String).contains(searchStr))).toList();
  }
}
