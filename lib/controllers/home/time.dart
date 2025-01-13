import 'dart:async';

import 'package:get/get.dart';

class DateTimeController extends GetxController {
  var currentDate = DateTime.now().obs;
  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentDate.value = DateTime.now();
    });
  }
  @override
void onInit() {
  super.onInit();
  startTimer();
}

}
