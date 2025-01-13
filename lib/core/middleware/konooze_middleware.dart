import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/core/services/services.dart';

class KonoozeMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  KonoozeServices konoozeServices = Get.find();
  bool isAuthenticated = false;
  @override
  RouteSettings? redirect(String? route) {
    // // konoozeServices.sharedPrefrences.clear();
    isAuthenticated = checkUserAuthentication();

    if (isAuthenticated) {
      return const RouteSettings(name: AppRoutes.homePage);
    }
    // print(
    //     'Current route: $route, Authenticated: ${konoozeServices.sharedPrefrences.getBool("auth")}');
    return super.redirect(route);

    // return const RouteSettings(name: AppRoutes.login);
  }

  bool checkUserAuthentication() {
    return konoozeServices.sharedPrefrences.getBool("auth") ?? false;
  }
}
