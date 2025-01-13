import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/classes/crud.dart';
import 'package:konooze_system/core/constants/api_links.dart';
import 'package:konooze_system/core/services/services.dart';

class AddClientData {
  Crud crud;
  KonoozeServices konoozeServices = Get.find();

  AddClientData(this.crud);
  addData(
      {required String company,
      required String brand,
      required String type,
      required String clientName,
      required String details,
      required String mobile,
      required String email,
      File? file}) async {
    Map<String, dynamic> data = {
      "company": company,
      "brand": brand,
      "mobile": mobile,
      "type": type,
      "email": email,
      "client_name": clientName,
      "user_id": konoozeServices.sharedPrefrences.getString('id') ?? "1",
      "details": details,
    };

    if (file != null) {
      // print(file);
      var response =
          await crud.postRequestWithFile(ApiLinks.addClientsLink, data, file);
      debugPrint('"---------"+$response');

      return response.fold((l) => l, (r) => r);
    } else {
      var response = await crud.postData(ApiLinks.addClientsLink, data);
      debugPrint('"---------"+$response');
      return response.fold((l) => l, (r) => r);
    }
  }
}
