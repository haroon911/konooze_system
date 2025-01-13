import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
  static bool validateEmail(String email) {
    return GetUtils.isEmail(email);
  }

  static void showSnackBar(String title, String message, Widget icon) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Get.theme.primaryColor.withOpacity(.4),
      title: title,
      isDismissible: true,
      duration: const Duration(milliseconds: 2000),
      icon: icon,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      snackStyle: SnackStyle.GROUNDED,
      barBlur: 30,
    ));
  }

  emailInputValidator(String value) {
    if (value.isEmpty) {
      return "لايمكن ان يكون حقل الايمل فارغ";
    } else if (!GetUtils.isEmail(value)) {
      return "ايميل غير صحيح".tr;
    } else {
      return null;
    }
  }

  passwordInputValidator(String value) {
    if (value.isEmpty) {
      return "لايمكن ان يكون حقل كلمة السر فارغ";
    } else if (value.isNotEmpty && value.length < 8) {
      return "shortPassError".tr;
    } else {
      return null;
    }
  }

  confiormInputValidator(String value, String pass, String conformPass) {
    if (value.isEmpty) {
      return "matchNullError".tr;
    } else if (value.isNotEmpty && value.length < 8) {
      return "shortPassError".tr;
    } else if (pass != conformPass) {
      return "matchPassError".tr;
    } else {
      return null;
    }
  }

  phoneInputValidator(String value) {
    if (value.isEmpty) {
      return "phoneNullErorr".tr;
    } else if (!GetUtils.isPhoneNumber(value)) {
      return "invalidPhone".tr;
    } else if (value.isNotEmpty && value.length < 9) {
      return "shortPhone".tr;
    } else {
      return null;
    }
  }

  textInputValidator(String value) {
    if (value.isEmpty) {
      return "textNullErorr".tr;
    } else {
      return null;
    }
  }
}
