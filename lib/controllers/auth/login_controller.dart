import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/core/functions/data_handler_controller.dart';
import 'package:konooze_system/core/services/services.dart';
import 'package:konooze_system/data/dynamic/auth/login_data.dart';
import 'package:konooze_system/model/auth/user_model.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool keepLogedIn = false;
  bool obscureText = true;
  KonoozeServices konoozeServices = Get.find();
  StatusRequest statusRequest = StatusRequest.noState;
  LoginData loginData = LoginData(Get.find());
  bool remember = false;
  List data = [];
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    Get.snackbar('كنوز المتميزة', 'مرحباً بك',
        margin: const EdgeInsets.all(20));
    super.onReady();
  }

  submitLogin(GlobalKey<FormState> formKey) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      formKey.currentState!.save();
      onLogin();
    }
  }

  onLogin() async {
    statusRequest = StatusRequest.loading;

    update();
    UserModel userModel;
    var response = await loginData.getData(
        email: emailController.text, password: passwordController.text);
    statusRequest = dataHandler(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        userModel = UserModel.fromJson(response['data']);
        konoozeServices.sharedPrefrences
            .setString("id", userModel.id.toString());
        konoozeServices.sharedPrefrences
            .setString("id", userModel.id.toString());
        konoozeServices.sharedPrefrences
            .setString("userName", userModel.name.toString());
        konoozeServices.sharedPrefrences
            .setString("userImageUrl", userModel.imageUrl.toString());
        Get.offNamed(AppRoutes.homePage);
        konoozeServices.sharedPrefrences.setBool("auth", true);
        statusRequest = StatusRequest.success;
      }
    } else {
      Get.snackbar('خطأ في الادخال', 'الايميل او كلمة السر غير صحيحة',
          margin: const EdgeInsets.all(20));
    }
  }

  changeCheck(value) {
    remember = value;
    remember
        ? konoozeServices.sharedPrefrences.setBool("auth", true)
        : konoozeServices.sharedPrefrences.setBool("auth", false);
    update();
  }
}
