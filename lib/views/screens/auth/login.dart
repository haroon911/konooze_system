import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/controllers/auth/login_controller.dart';
import 'package:konooze_system/views/components/auth/login_form.dart';
import 'package:konooze_system/views/components/auth/shared/auth_button.dart';
import 'package:konooze_system/views/components/auth/shared/auth_intro.dart';
import 'package:konooze_system/views/components/auth/shared/blur_effect.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: AuthForm(
              formKey: formKey,
            ),
          ),
        ),
      ),
    );
  }
}

class AuthForm extends GetView<LoginController> {
  const AuthForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Colors.blue.shade200,
                Colors.purple.shade200,
              ])),
          width: 400,
          height: 400,
        ),
        const BlureFilter(),
        Container(
          padding: const EdgeInsets.all(20),
          // decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     gradient: LinearGradient(colors: [Colors.blue, Colors.green])),
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthIntroduction(
                title: "شركة كنوز المتميزة",
                subTitle: "قم بتسجيل الدخول",
              ),
              LoginForm(formKey: formKey),
              AuthButton(
                title: 'تسجيل الدخول',
                onPressed: () {
                  controller.submitLogin(formKey);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
