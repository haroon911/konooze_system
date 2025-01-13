import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/core/middleware/konooze_middleware.dart';
import 'package:konooze_system/home.dart';
import 'package:konooze_system/views/screens/auth/login.dart';
import 'package:konooze_system/views/screens/home/clients/clients_screen.dart';
import 'package:konooze_system/views/screens/home/properties/property_details.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: AppRoutes.login,
    page: () => LoginPage(),
    middlewares: [KonoozeMiddleware()],
  ),
  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomePage(),
  ),
  GetPage(
    name: AppRoutes.clients,
    page: () => const ClientsScreen(),
  ),
  GetPage(
    name: AppRoutes.propertyDetails,
    page: () => const PropertyDetailsScreen(),
  ),
  // GetPage(
  //   name: AppRoutes.addClients,
  //   page: () => const AddClientsPage(),
  // ),
  // GetPage(
  //   name: AppRoutes.projects,
  //   page: () => const ProjectScreen(),
  // ),
];
