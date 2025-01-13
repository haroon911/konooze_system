import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
// import 'package:hamour/core/functions/check_connection.dart';
import 'package:http/http.dart' as http;
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:path/path.dart';

String _basicAuth = 'Basic ${base64Encode(utf8.encode('haroon:123456'))}';

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(linkurl, Map data) async {
    try {
      // if (await checkInternetConnection()) {
      var response = await http.post(Uri.parse(linkurl), body: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // print("------response body: " + response.body);
        Map responseBody = jsonDecode(response.body);
        return right(responseBody);
      } else {
        return left(StatusRequest.serverFailure);
      }
      // } else {
      //   return left(StatusRequest.offlineFailure);
      // }
    } catch (_) {
      return left(StatusRequest.serverFailure);
    }
  }

  // postRequestWithFile(String url, Map data, File file) async {
  //   try {
  //     var request = http.MultipartRequest("POST", Uri.parse(url));
  //     var fileLenght = await file.length();
  //     var stream = http.ByteStream(file.openRead());
  //     var multiPartFile = http.MultipartFile(
  //       "file",
  //       stream,
  //       fileLenght,
  //       filename: basename(file.path),
  //     );
  //     request.files.add(multiPartFile);
  //     data.forEach((key, dynamic value) {
  //       request.fields[key] = value;
  //     });
  //     request.headers.addAll(myheaders);
  //     var myRequest = await request.send();
  //     var response = await http.Response.fromStream(myRequest);
  //     if (myRequest.statusCode == 200) {
  //       Map responseBody = jsonDecode(response.body);
  //       return right(responseBody);
  //     } else {
  //       return left(StatusRequest.serverFailure);
  //     }
  //   } catch (e) {
  //     debugPrint('Error catched $e');
  //     // return <String, dynamic>{};
  //     return left(StatusRequest.serverFailure);
  //   }
  // }

// postRequestWithFile(String url, Map data, File file) async {
//   try {
//     var request = http.MultipartRequest("POST", Uri.parse(url));
//     var fileLenght = await file.length();
//     var stream = http.ByteStream(file.openRead());
//     var multiPartFile = http.MultipartFile(
//       "file",
//       stream,
//       fileLenght,
//       filename: basename(file.path),
//     );
//     request.files.add(multiPartFile);
//     data.forEach((key, value) {
//       request.fields[key] = value;
//     });
//     request.headers.addAll(myheaders);
//     var myRequest = await request.send();
//     var response = await http.Response.fromStream(myRequest);
//     if (myRequest.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       debugPrint('Error ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error catched $e');
//     return <String, dynamic>{};
//   }
// }
  Future<Either<StatusRequest, Map>> postRequestWithFile(
      String url, Map<String, dynamic> data, File file) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var fileLength = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multiPartFile = http.MultipartFile(
        "file",
        stream,
        fileLength,
        filename: basename(file.path),
      );
      request.files.add(multiPartFile);
      data.forEach((String key, dynamic value) {
        request.fields[key] = value;
      });
      request.headers.addAll(myheaders);
      var myRequest = await request.send();
      var response = await http.Response.fromStream(myRequest);
      // print("------ reuest feedback: "+myRequest.toString());
      if (myRequest.statusCode == 200) {
        Map responseBody = jsonDecode(response.body);
        return right(responseBody);
      } else {
        return left(StatusRequest.serverFailure);
      }
    } catch (e) {
      debugPrint('Error caught: $e');
      return left(StatusRequest.serverFailure);
    }
  }
}
