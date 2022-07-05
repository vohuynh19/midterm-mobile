import 'dart:async';
import 'package:ecommerce_midterm/models/item_model.dart';
import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:ecommerce_midterm/utils/enum_constant.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

enum HomeTabItem { home, history, account }

class HomeViewModel extends ChangeNotifier {
  HomeTabItem selectedTabItem = HomeTabItem.home;
  Categories selectedCategory = Categories.jacket;
  late Map<String, int> nameCount;
  List<Map<String, dynamic>> distinctList = [];
  int homeTabIndex = 0;
  int numItems = 0;
  num totalAmount = 0;
  List<Map<String, dynamic>> carts = [];
  Timer? configTimer;
  List<HomeTabItem> homeTabItems = [
    HomeTabItem.home,
    HomeTabItem.history,
    HomeTabItem.account,
  ];

  setCategory(Categories value) {
    selectedCategory = value;
    notifyListeners();
  }

  addToCart(Map<String, dynamic> value) {
    carts.add({
      "name": value['category'],
      "color": value['color'],
      "desc": value['desc'],
      "images": value['images'],
      "price": value['price'],
      "size": value['size']
    });
    numItems = numItems + 1;
    totalAmount = totalAmount + value['price'];
    notifyListeners();
  }

  setSelectedTabItem(HomeTabItem item) {
    selectedTabItem = item;
    notifyListeners();
  }

  setSelectedTabIndex(int index) {
    homeTabIndex = index;
    var item = homeTabItems[index];
    setSelectedTabItem(item);
    notifyListeners();
  }

  int getSelectedTabItem() {
    var index = homeTabItems.indexOf(selectedTabItem);
    return index;
  }

  String tabTitle(HomeTabItem item) {
    switch (item) {
      case HomeTabItem.home:
        return "Home";
      case HomeTabItem.history:
        return "History";
      case HomeTabItem.account:
        return "Account";
      default:
    }
    return "";
  }

  Widget tabIcon(HomeTabItem item) {
    switch (item) {
      case HomeTabItem.home:
        return const Icon(Icons.home);
      case HomeTabItem.history:
        return const Icon(Icons.history);
      case HomeTabItem.account:
        return const Icon(Icons.person);
      default:
    }
    return const Icon(Icons.home);
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
