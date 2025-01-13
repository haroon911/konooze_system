import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthIntroduction extends StatelessWidget {
  const AuthIntroduction({
    super.key,
    required this.title,
    required this.subTitle,
    this.extra = '',
  });
  final String title;
  final String subTitle;
  final String extra;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            subTitle.tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          addText(extra),
        ],
      ),
    );
  }
}

Widget addText(String extra) {
  if (extra.isEmpty) {
    return const SizedBox();
  } else {
    return Text(
      extra.tr,
      style: Get.theme.textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
