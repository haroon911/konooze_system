import 'package:flutter/material.dart';
import 'package:konooze_system/core/classes/crud.dart';
import 'package:konooze_system/core/constants/api_links.dart';

class ProprtiesData {
  Crud crud;
  ProprtiesData(this.crud);
  getAllData() async {
    var response = await crud.postData(ApiLinks.propertiesLink, {});
    debugPrint('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}
