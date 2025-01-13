import 'package:flutter/foundation.dart';
import 'package:konooze_system/core/classes/crud.dart';
import 'package:konooze_system/core/constants/api_links.dart';

class ClientsData {
  Crud crud;
  ClientsData(this.crud);
  getAllData() async {
    var response = await crud.postData(ApiLinks.veiwClientsLink, {});
    debugPrint('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}
