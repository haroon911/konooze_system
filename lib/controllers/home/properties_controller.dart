import 'package:get/get.dart';
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/core/functions/data_handler_controller.dart';
import 'package:konooze_system/data/dynamic/home/peroperties_data/properties_data.dart';
import 'package:konooze_system/model/home/properties/properties.dart';

class PropertiesController extends GetxController {
  late StatusRequest statusRequest;
  ProprtiesData proprtiesData = ProprtiesData(Get.find());
  List<Property> proprties = [];
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await proprtiesData.getAllData();
    statusRequest = dataHandler(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status']) {
        response["data"]
            .forEach((value) => proprties.add(Property.fromJson(value)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  onPropertyTapped(int index) {
    Get.toNamed(AppRoutes.propertyDetails,
        arguments: {"property_details": proprties[index]});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
