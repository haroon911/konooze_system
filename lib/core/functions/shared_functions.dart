import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

copyFiled({required String title, required String message}) async {
  await Clipboard.setData(ClipboardData(text: message));

  Get.showSnackbar(
    GetSnackBar(
      snackStyle: SnackStyle.FLOATING,
      duration: const Duration(milliseconds: 1500),
      title: title,
      message: message,
      maxWidth: Get.width / 1.2,
      borderRadius: 20,
      margin: const EdgeInsets.symmetric(vertical: 20),
      // margin: Get.width > 700
      //     ? EdgeInsets.symmetric(horizontal: 150, vertical: 10)
      //     : EdgeInsets.all(20),
    ),
  );
}
