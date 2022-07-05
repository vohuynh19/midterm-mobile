import 'package:ecommerce_midterm/screens/Auth/account_screen.dart';
import 'package:ecommerce_midterm/screens/Cart/cart_screen.dart';
import 'package:ecommerce_midterm/screens/History/history_screen.dart';
import 'package:ecommerce_midterm/screens/Home/home_screen.dart';
import 'package:ecommerce_midterm/view_models/home_view_model.dart';
import 'package:ecommerce_midterm/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  List<BottomNavigationBarItem> _tabbarItems(HomeViewModel vm) {
    return vm.homeTabItems
        .map((e) =>
            BottomNavigationBarItem(icon: vm.tabIcon(e), label: vm.tabTitle(e)))
        .toList();
  }

  Widget _tabContainerView(HomeTabItem tab) {
    switch (tab) {
      case HomeTabItem.home:
        return const HomeScreen();
      case HomeTabItem.history:
        return const HistoryScreen();
      case HomeTabItem.account:
        return const AccountScreen();
      default:
    }
    return const Text("Test");
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<HomeViewModel>(context);
    var userVM = Provider.of<UserViewModel>(context);

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: _tabContainerView(vm.selectedTabItem),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).backgroundColor,
          items: _tabbarItems(vm),
          onTap: (value) {
            var item = vm.homeTabItems[value];
            // if ((item == HomeTabItem.history || item == HomeTabItem.account) &&
            //     !userVM.isAuthorized) {
            //   Navigator.pushNamed(context, '/login');
            //   return;
            // }
            vm.setSelectedTabIndex(value);
          },
          unselectedItemColor: Theme.of(context).iconTheme.color,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: vm.homeTabIndex,
        ),
      ),
    );
  }
}
