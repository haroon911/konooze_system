import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/classes/crud.dart';
import 'package:konooze_system/core/constants/api_links.dart';
import 'package:konooze_system/core/services/services.dart';

class EditClientData {
  Crud crud;
  KonoozeServices konoozeServices = Get.find();

  EditClientData(this.crud);
  editData(
      {required String id,
      required String company,
      required String brand,
      required String type,
      required String details,
      required String mobile,
      required String email,
      required String clientName,
      required String imageName,
      File? file}) async {
    Map<String, dynamic> data = {
      "id": id,
      "company": company,
      "brand": brand,
      "mobile": mobile,
      "type": type,
      "email": email,
      "details": details,
      "client_name": clientName,
      "image_name": imageName,
      "user_id": konoozeServices.sharedPrefrences.getString("id"),
    };
    if (file != null) {
      // print(file);
      var response =
          await crud.postRequestWithFile(ApiLinks.editClientsLink, data, file);
      debugPrint('"---------"+$response');

      return response.fold((l) => l, (r) => r);
    } else {
      var response = await crud.postData(ApiLinks.editClientsLink, data);
      debugPrint('"---------"+$response');
      return response.fold((l) => l, (r) => r);
    }
  }
}
