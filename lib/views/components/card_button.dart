import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.title,
    this.icon = Icons.arrow_outward_rounded,
    this.content = "",
    this.notification = 0,
    this.onTap,
    this.backgroundColor = Colors.greenAccent,
  });
  final String title;
  final IconData icon;
  final String content;
  final int? notification;
  final void Function()? onTap;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const VerticalDivider(),
          Text(
            title,
            style: Get.textTheme.labelLarge,
          ),
          const VerticalDivider(),
          Text(
            content,
            style: Get.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class DashButtonContent {
  final String title;
  final IconData icon;
  final String content;
  final int? notification;
  final Function()? onTap;

  DashButtonContent(
      {required this.title,
      required this.content,
      required this.icon,
      this.notification = 0,
      this.onTap});
}
