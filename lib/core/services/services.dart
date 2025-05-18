import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:konooze_system/model/auth/user_model.dart';

class KonoozeServices extends GetxService {
  late SharedPreferences sharedPrefrences;
  Future<KonoozeServices> initServices() async {
    sharedPrefrences = await SharedPreferences.getInstance();
    return this;
  }
}

extension KonoozeServicesSession on KonoozeServices {
  void saveUserSession(UserModel userModel) {
    sharedPrefrences.setString("id", userModel.id?.toString() ?? '');
    sharedPrefrences.setString("userName", userModel.name ?? '');
    sharedPrefrences.setString("userImageUrl", userModel.imageUrl ?? '');
  }
}

initailServices() async {
  await Get.putAsync(() => KonoozeServices().initServices());
}
