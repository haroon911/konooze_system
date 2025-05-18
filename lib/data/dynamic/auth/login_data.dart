import 'package:flutter/material.dart';
import 'package:konooze_system/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  getData({
    required String email,
    required String password,
  }) async {
    var response = await crud.postData(ApiLinks.login, {
      "email": email.trim(),
      "password": password.trim(),
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
