import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
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
    this.maxlines,
  });
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
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.transparent),
        gapPadding: 20);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        enableSuggestions: true,
          
          maxLines: maxlines,
          autofocus: autofocus,
          autofillHints: autofillHints,
          obscureText: obscureText,
          controller: controller,
          onSaved: (newValue) => onSaved,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
          
            labelText: labelText,
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: onIconPressed,
              icon: Icon(
                icon,
                size: 25,
              ),
            ),
            //hamour style
            labelStyle: const TextStyle(fontSize: 18),
            filled: true,

            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
          )),
    );
  }
}
