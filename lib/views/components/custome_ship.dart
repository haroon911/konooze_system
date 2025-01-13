import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
    this.icon = Icons.timelapse_rounded,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      color: WidgetStatePropertyAll(Get.theme.focusColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      side: BorderSide.none,
      label: Text(
        label,
        style: Get.textTheme.labelMedium,
      ),
      avatar: Icon(
        icon,
        size: 15,
      ),
    );
  }
}
