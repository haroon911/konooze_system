import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitAppAlert() {
  Get.defaultDialog(
      title: 'خروج'.tr,
      middleText: "قم بتأكيد الخروج",
      confirm: ElevatedButton(
        onPressed: () {
          PaintingBinding.instance.imageCache.clear();
          exit(0);
        },
        child: Text('تأكيد الخروج'.tr),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('الغاء'.tr),
      ));
  return Future.value(true);
}
