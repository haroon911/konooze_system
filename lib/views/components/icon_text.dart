import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconText extends StatelessWidget {
  const CustomIconText(
      {super.key,
      required this.label,
      this.iconData = Icons.crop,
      this.style,
      this.overflow,
      this.maxLines});

  final String label;
  final IconData iconData;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 5, 
        children: [
          Icon(iconData, color: Get.theme.colorScheme.primary),
          Text(
            label,
            style: style,
            softWrap: true,
            overflow: overflow,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
