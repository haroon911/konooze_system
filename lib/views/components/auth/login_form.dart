import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:konooze_system/controllers/auth/login_controller.dart';
import 'package:konooze_system/core/util/utils.dart';
import 'package:konooze_system/views/components/auth/shared/auth_text_form.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AutofillGroup(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthTextFormField(
                autofocus: true,
                autofillHints: const [AutofillHints.email],
                labelText: 'الايميل',
                hintText: 'email@example.com',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email_outlined,
                validator: (value) => utils.emailInputValidator(value!),
                onSaved: (newValue) =>
                    controller.emailController.text = newValue!,
              ),
              GetBuilder<LoginController>(builder: (context) {
                return AuthTextFormField(
                  autofillHints: const [AutofillHints.password],
                  labelText: 'كلمة السر',
                  hintText: 'Password',
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  icon: Icons.lock_outline_rounded,
                  obscureText: controller.obscureText,
                  validator: (value) => utils.passwordInputValidator(value!),
                  onSaved: (newValue) =>
                      controller.passwordController.text = newValue!,
                  onIconPressed: () => context.showPassword(),
                  onFieldSubmitted: (submit) {
                    controller.submitLogin(formKey);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
