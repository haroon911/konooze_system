import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:konooze_system/model/home/properties/properties.dart';
import 'package:carousel_slider/carousel_controller.dart';

class PropertyDetailsController extends GetxController {
  late StatusRequest statusRequest;
  late Property property;
  CarouselSliderController imageController = CarouselSliderController();
  CarouselSliderController thumbnailImageController =
      CarouselSliderController();
  int currentPage = 0;

  onImageControllerChanged(int index) {
    thumbnailImageController.animateToPage(index,
        duration: const Duration(milliseconds: 200));
    currentPage = index;
    update();
  }

  onthumbnailImageControllerChanged(int index) {
    imageController.animateToPage(index,
        duration: const Duration(milliseconds: 100));
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.loading;
    property = Get.arguments["property"];
    
    statusRequest = StatusRequest.success;
    update();
    super.onInit();
  }

  double largeScreenPercentage = 1;
  double maxWidth = 1000;
  double desktopThreshold = 700;

  double calculateConstrainedWidth(double screenWidth) {
    return (screenWidth > desktopThreshold
            ? screenWidth * largeScreenPercentage
            : screenWidth)
        .clamp(0.0, maxWidth);
  }
}
