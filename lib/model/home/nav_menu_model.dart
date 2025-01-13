import 'package:flutter/material.dart';

class NavMenuModel {
  final String title;
  final IconData icon;
  final IconData selectedIcon;

  const NavMenuModel({
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });
}
