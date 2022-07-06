import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> itemArr = [];
  var isLoading = false;

  void addItem(Map<String, dynamic> data, int amount) async {
    isLoading = true;
    notifyListeners();
    itemArr.add({"data": data, "amount": amount});
    isLoading = false;
    notifyListeners();
  }

  void updateItem(Map<String, dynamic> data, int amount) async {
    var index = itemArr
        .indexWhere((element) => element['data']['title'] == data['title']);
    if (index != null) {
      itemArr[index]['amount'] = amount;
      notifyListeners();
    }
  }

  void removeAll() async {
    itemArr = [];
    notifyListeners();
  }
}
