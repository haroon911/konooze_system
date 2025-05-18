import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/bindings/initial_bindings.dart';
import 'package:konooze_system/core/services/services.dart';
import 'package:konooze_system/routes.dart';
// import 'package:snooze_system/views/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initailServices();
  runApp(const RealEstateManagementApp());
}

class RealEstateManagementApp extends StatelessWidget {
  const RealEstateManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar', 'SA'),
      title: 'konooze system demo',
      theme: ThemeData(
          fontFamily: "Cairo",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurpleAccent,
            brightness: Brightness.dark,
          )),
      getPages: routes,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
    );
  }
}
