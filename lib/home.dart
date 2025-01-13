import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/controllers/home/nav_menu_controller.dart';
// import 'package:konooze_system/controllers/home/properties_controller.dart';
import 'package:konooze_system/core/constants/responsive.dart';

import 'views/components/nav_menus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavMenuController());
    final isMobile = Responsive.isMobile(context);
    return Scaffold(
      body: Row(
        children: [
          !isMobile ? const NavRailMenu() : const SizedBox(),
          Expanded(
              child: GetBuilder<NavMenuController>(
            builder: (controller) => controller.pages.elementAt(controller.tab),
          ))
        ],
      ),
      bottomNavigationBar: isMobile ? const BottomNavMenu() : null,
    );
  }
}

//                !isMobile ? const NavRailMenu() : const SizedBox(),
