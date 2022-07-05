import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

enum HomeTabItem { home, category, cart, account }

class HomeViewModel extends ChangeNotifier {
  HomeTabItem selectedTabItem = HomeTabItem.home;
  int homeTabIndex = 0;
  Timer? configTimer;
  List<HomeTabItem> homeTabItems = [
    HomeTabItem.home,
    HomeTabItem.category,
    HomeTabItem.cart,
    HomeTabItem.account,
  ];

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
      case HomeTabItem.category:
        return "Category";
      case HomeTabItem.cart:
        return "My Cart";
      case HomeTabItem.account:
        return "Account";
      default:
    }
    return "";
  }

  Icon tabIcon(HomeTabItem item) {
    switch (item) {
      case HomeTabItem.home:
        return const Icon(Icons.home);
      case HomeTabItem.category:
        return const Icon(Icons.store);
      case HomeTabItem.cart:
        return const Icon(Icons.shopping_cart);
      case HomeTabItem.account:
        return const Icon(Icons.person);
      default:
    }
    return const Icon(Icons.home);
  }
}
