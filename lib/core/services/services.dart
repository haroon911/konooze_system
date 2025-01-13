import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KonoozeServices extends GetxService {
  late SharedPreferences sharedPrefrences;
  Future<KonoozeServices> initServices() async {
    sharedPrefrences = await SharedPreferences.getInstance();
    return this;
  }
}

initailServices() async {
  await Get.putAsync(() => KonoozeServices().initServices());
}
