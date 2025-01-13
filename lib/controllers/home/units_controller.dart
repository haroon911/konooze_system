import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:konooze_system/core/functions/data_handler_controller.dart';
import 'package:konooze_system/data/dynamic/home/peroperties_data/units_data/units_data.dart';
import 'package:konooze_system/model/home/properties/units.dart';
import 'package:konooze_system/views/screens/home/properties/components/view_unit_details.dart';

class UnitsController extends GetxController {
  late StatusRequest statusRequest;
  ViewProprtyUnitsData viewProprtyUnitsData = ViewProprtyUnitsData(Get.find());
  List<PropertyUnit> units = [];
  late int propertyId;
  getData(int? propertyId) async {
    statusRequest = StatusRequest.loading;
    var response = await viewProprtyUnitsData.getAllData(propertyId);
    statusRequest = dataHandler(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status']) {
        response["data"]
            .forEach((value) => units.add(PropertyUnit.fromJson(value)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  onUnitTapped(PropertyUnit unit) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ViewUnitDetails(
              unit: unit,
            )),
      ),
    );
  }

  @override
  void onInit() {
    propertyId = Get.arguments['property'].id;
    // print(propertyId);
    getData(propertyId);
    super.onInit();
  }
}
/*


import 'package:get/get.dart';
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/core/functions/data_handler_controller.dart';
import 'package:konooze_system/data/dynamic/properties_data.dart';
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


*/