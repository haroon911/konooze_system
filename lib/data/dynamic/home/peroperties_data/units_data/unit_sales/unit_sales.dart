import 'dart:developer';

import 'package:konooze_system/core/classes/crud.dart';
import 'package:konooze_system/core/constants/api_links.dart';

class ViewUnitsSalesData {
  Crud crud;
  ViewUnitsSalesData(this.crud);
  getAllData({required int propertyId, required int unitId}) async {
    var response = await crud.postData(
      ApiLinks.viewUnitsSalesLink,
      {"property_id": propertyId.toString(), "unit_id": unitId.toString()},
    );
    log('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}
