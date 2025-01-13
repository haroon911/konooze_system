import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.controller,
      this.icon,
      this.onSaved,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.onChanged,
      this.onIconPressed,
      this.autofocus = false,
      this.autofillHints,
      this.onFieldSubmitted});
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final String hintText;
  final String labelText;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onIconPressed;
  final Function(String submit)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.transparent),
        gapPadding: 20);
    return Container(
      margin: const EdgeInsets.only(top: 18),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        autofocus: autofocus,
        autofillHints: autofillHints,
        obscureText: obscureText,
        controller: controller,
        onSaved: (newValue) => onSaved,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText.tr,
          hintText: hintText.tr,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: onIconPressed,
              icon: Icon(
                icon,
                size: 25,
              ),
            ),
          ),
          //hamour style
          labelStyle: const TextStyle(fontSize: 20),

          // floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          filled: true,
          fillColor: Get.theme.colorScheme.outlineVariant.withOpacity(0.3),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder.copyWith(
              borderSide: BorderSide(color: Get.theme.colorScheme.primary)),
          errorBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(28),
            gapPadding: 20,
            borderSide: BorderSide(color: Get.theme.colorScheme.error),
          ),
          focusedErrorBorder: outlineInputBorder.copyWith(
              borderRadius: BorderRadius.circular(28),
              gapPadding: 20,
              borderSide: const BorderSide(color: Colors.redAccent)),
        ),
      ),
    );
  }
}
// bool isPassword(TextInputType keyboardType){
//   if(keyboardType== TextInputType.visiblePassword)
//   {return true;}
//   else {
//     return false;
//   }
// }


