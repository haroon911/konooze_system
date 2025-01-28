import 'dart:ui';

import 'package:flutter/material.dart';

class BlureFilter extends StatelessWidget {
  const BlureFilter(
      {super.key,
      this.sigmaX = 70,
      this.sigmaY = 70,
      this.height = 100,
      this.width = 100});
  final double sigmaX;
  final double sigmaY;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        // blendMode: BlendMode.darken,
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: SizedBox(height: height, width: width));
  }
}
