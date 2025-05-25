import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/controllers/home/nav_menu_controller.dart';

class NavRailMenu extends StatelessWidget {
  const NavRailMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavMenuController>(builder: (controller) {
      return NavigationRail(
        leading: DrawerHeader(
            child: Column(
          children: [
            AnimatedBuilder(
              animation: controller.animation,
              builder: (BuildContext context, Widget? child) {
                return IconButton.filled(
                  onPressed: controller.onExtendingNavRailMenu,
                  icon: Icon(
                    controller.railingIcon,
                    size: controller.animation.value,
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            Text(
              // controller.konoozeServices.sharedPrefrences
              //     .getString("userName")!
              //     .split(" ")
              //     .first,
              "soli",
              overflow: TextOverflow.fade,
              softWrap: true,
              style: Get.theme.textTheme.labelLarge,
            ),
          ],
        )),
        trailing: Column(
          children: [
            IconButton(
                onPressed: controller.onLogoutPressed,
                icon: const Icon(Icons.exit_to_app_rounded)),
          ],
        ),
        elevation: 5,
        extended: controller.extended,
        selectedIndex: controller.tab,
        destinations: controller.navigationDestination,
        labelType: controller.labelType,
        onDestinationSelected: controller.onDestinationSelected,
      );
    });
  }
}

class BottomNavMenu extends StatelessWidget {
  const BottomNavMenu({super.key});

  @override
  Widget build(context) {
    return GetBuilder<NavMenuController>(builder: (controller) {
      return NavigationBar(
        destinations: controller.bottomNavBarItems,
        onDestinationSelected: controller.onDestinationSelected,
        selectedIndex: controller.tab,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      );
    });
  }
}
