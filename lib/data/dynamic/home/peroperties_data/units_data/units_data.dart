import 'dart:developer';

import 'package:konooze_system/core/classes/crud.dart';
import 'package:konooze_system/core/constants/api_links.dart';

class ViewProprtyUnitsData {
  Crud crud;
  ViewProprtyUnitsData(this.crud);
  getAllData(int? propertyId) async {
    var response = await crud.postData(
      ApiLinks.viewPropertyUnitsLink,
      propertyId != null ? {"property_id": propertyId.toString()} : {},
    );
    log('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}
