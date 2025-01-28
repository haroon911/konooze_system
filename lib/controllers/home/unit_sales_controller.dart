import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:konooze_system/core/functions/data_handler_controller.dart';
import 'package:konooze_system/data/dynamic/home/peroperties_data/units_data/unit_sales/unit_sales.dart';
import 'package:konooze_system/model/home/properties/unit_sales.dart';

class UnitSalesController extends GetxController {
  late StatusRequest statusRequest;
  ViewUnitsSalesData viewUnitsSalesData = ViewUnitsSalesData(Get.find());

  late List<UnitSale> unitSales = [];
  initData(int propertyId, int unitId) {
    getUnitSalesData(propertyId, unitId);
  }

  getUnitSalesData(int propertyId, int unitId) async {
    statusRequest = StatusRequest.loading;
    var response = await viewUnitsSalesData.getAllData(
        propertyId: propertyId, unitId: unitId);
    statusRequest = dataHandler(response);
    if (kDebugMode) {
      print(response);
    }
    if (statusRequest == StatusRequest.success) {
      if (response['status']) {
        if (response["data"] != null) {
          unitSales = response["data"]
              .map<UnitSale>((value) => UnitSale.fromJson(value))
              .toList();
        } else {
          statusRequest = StatusRequest.noData;
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
