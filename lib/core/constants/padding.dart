import 'package:flutter/material.dart';

class DefaultPadding extends StatelessWidget {
  final Widget child;
  const DefaultPadding(
      {super.key,
      required this.child,
      this.vertical = 0.0,
      this.horizontal = 20});
  final double vertical;
  final double horizontal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: child,
    );
  }
}
