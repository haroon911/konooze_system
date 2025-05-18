import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/core/services/services.dart';
import 'package:konooze_system/data/static/nav_menu_data.dart';
import 'package:konooze_system/views/screens/home/clients/clients_screen.dart';
import 'package:konooze_system/views/screens/home/dashboard/dashboard.dart';
import 'package:konooze_system/views/screens/home/properties/properties_screen.dart';

class NavMenuController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int tab = 0;
  late List<NavigationRailDestination> navigationDestination;
  late List<NavigationDestination> bottomNavBarItems;
  NavigationRailLabelType labelType = NavigationRailLabelType.selected;
  KonoozeServices konoozeServices = Get.find();
  bool extended = false;
  IconData railingIcon = Icons.keyboard_arrow_left_rounded;
  NavMenuData menuData = NavMenuData();
  late AnimationController animationController;

  late Animation<double> animation;
  List<Widget> pages = const <Widget>[
    Dashboard(),
    PropertiesScreen(),
    ClientsScreen(),
  ];
  onExtendingNavRailMenu() {
    extended
        ? {
            labelType = NavigationRailLabelType.selected,
            extended = false,
            railingIcon = Icons.keyboard_arrow_left_rounded,
          }
        : {
            labelType = NavigationRailLabelType.none,
            extended = true,
            railingIcon = Icons.person_2_rounded,
          };
    animation.value == 30
        ? animationController.forward()
        : animationController.reverse();

    update();
  }

  void setExtended(bool value) {
    extended = value;
    update();
  }

  @override
  void onInit() {
    bottomNavBarItems = List.generate(
      menuData.menu.length,
      (index) => NavigationDestination(
        icon: Icon(menuData.menu[index].icon),
        label: menuData.menu[index].title,
        selectedIcon: Icon(menuData.menu[index].selectedIcon),
      ),
    );
    // Side Menu
    navigationDestination = List.generate(
      menuData.menu.length,
      (index) => NavigationRailDestination(
        icon: Icon(menuData.menu[index].icon),
        label: Text(menuData.menu[index].title),
        selectedIcon: Icon(menuData.menu[index].selectedIcon),
      ),
    );
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animation = Tween<double>(begin: 30, end: 50).animate(animationController);
    super.onInit();
  }

  void onDestinationSelected(index) {
    tab = index;
    debugPrint(index.toString());
    update();
  }

  void onLogoutPressed() {
    konoozeServices.sharedPrefrences.clear();
    Get.offNamed(AppRoutes.login);
  }
}
