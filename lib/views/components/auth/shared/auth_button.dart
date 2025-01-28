import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle().copyWith(
          elevation: const WidgetStatePropertyAll(20),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          backgroundColor:
              WidgetStatePropertyAll(Get.theme.colorScheme.inverseSurface),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 18, horizontal: 30)),
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.surface),
        ),
      ),
    );
  }
}
