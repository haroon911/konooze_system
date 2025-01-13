
import 'dart:ui';

import 'package:flutter/material.dart';

class BlureFilter extends StatelessWidget {
  const BlureFilter({super.key, this.sigmaX = 70, this.sigmaY = 70});
  final double sigmaX;
  final double sigmaY;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        // blendMode: BlendMode.darken,
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: const SizedBox(height: 100, width: 100));
  }
}
