import 'package:get/get.dart';
import 'package:konooze_system/core/classes/crud.dart';
import 'package:konooze_system/core/services/services.dart';

class InitialBindings extends Bindings {
  KonoozeServices konoozeServices = Get.find();
  @override
  void dependencies() {
    Get.put(Crud());
    if (konoozeServices.sharedPrefrences.getBool("auth") == null) {
      konoozeServices.sharedPrefrences.setBool("auth", false);
    }
  }
}
