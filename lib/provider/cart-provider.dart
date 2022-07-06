import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  void removeAll() {
    itemArr = [];
    notifyListeners();
  }

  void submitCart() async {
    var collection = FirebaseFirestore.instance.collection('cart_record');
    collection
        .add({"docs": itemArr, "createdAt": DateTime.now()}) // <-- Your data
        .then((_) => Fluttertoast.showToast(msg: "Đặt hàng thành công"))
        .catchError(
            (error) => Fluttertoast.showToast(msg: "Đặt hàng thất bại"));
    itemArr = [];
    notifyListeners();
  }
}
