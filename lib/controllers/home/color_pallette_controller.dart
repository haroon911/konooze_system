import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorController extends GetxController {
  var paletteGenerator = Rx<PaletteGenerator>(PaletteGenerator.fromColors([]));

  Future<void> updatePalette(ImageProvider imageProvider) async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(imageProvider);
    paletteGenerator.value = generator;
  }
}
