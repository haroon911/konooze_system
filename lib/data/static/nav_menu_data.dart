import 'package:flutter/material.dart';
import 'package:konooze_system/model/home/nav_menu_model.dart';

class NavMenuData {
  final menu = <NavMenuModel>[
    const NavMenuModel(
      icon: Icons.home_outlined,
      title: 'الرئيسية',
      selectedIcon: Icons.home_rounded,
    ),
    const NavMenuModel(
      icon: Icons.storefront_outlined,
      title: 'المشاريع',
      selectedIcon: Icons.storefront_rounded,
    ),
    const NavMenuModel(
      icon: Icons.real_estate_agent_outlined,
      title: 'العملاء',
      selectedIcon: Icons.real_estate_agent_rounded,
    ),
  ];
}
