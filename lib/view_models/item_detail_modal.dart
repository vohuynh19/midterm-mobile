import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/item-provider.dart';

class ItemDetailViewModal extends ChangeNotifier {
  bool isLoading = false;
  Map<String, dynamic> data = {};
  int itemNumber = 1;

  void fetchData(BuildContext context, String title) {
    var vm = Provider.of<ItemProvider>(context, listen: false);
    data = vm.itemArr.firstWhere((element) => element['title'] == title);

    notifyListeners();
  }

  void setItemNumber(int value) {
    itemNumber = value;
    notifyListeners();
  }
}
