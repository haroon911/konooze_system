import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:path/path.dart';

class Crud {
  // Basic Authentication Header
  static const String _username = 'haroon';
  static const String _password = '123456';
  static final String _basicAuth =
      'Basic ${base64Encode(utf8.encode('$_username:$_password'))}';

  // Default headers
  static Map<String, String> defaultHeaders = {
    'Authorization': _basicAuth,
    'Content-Type': 'application/json',
  };

  /// Sends a POST request with form data.
  Future<Either<StatusRequest, Map>> postData(
      String url, Map<String, dynamic> data) async {
    // try {
    // Check internet connection
    // Uncomment this if `checkInternetConnection` is implemented
    // if (!await checkInternetConnection()) {
    //   return left(StatusRequest.offlineFailure);
    // }

    // Send POST request
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: data, // not jsonEncode(data)
    );
    print(jsonEncode(data));
    // Handle response
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responseBody =
          response.body.isNotEmpty ? jsonDecode(response.body) : {};
      return right(responseBody);
    } else {
      debugPrint('Server Error: ${response.statusCode} - ${response.body}');
      return left(StatusRequest.serverFailure);
    }
  }
  //   } on SocketException {
  //     debugPrint('No Internet Connection');
  //     return left(StatusRequest.offlineFailure);
  //   } on FormatException {
  //     debugPrint('Invalid Response Format  ');
  //     return left(StatusRequest.invalidResponse);
  //   } catch (e) {
  //     debugPrint('Unexpected Error: $e');
  //     return left(StatusRequest.serverFailure);
  //   }
  // }

  /// Sends a POST request with a file upload.
  Future<Either<StatusRequest, Map>> postRequestWithFile(
      String url, Map<String, dynamic> data, File file) async {
    try {
      // Prepare multipart request
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var fileLength = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multiPartFile = http.MultipartFile(
        "file",
        stream,
        fileLength,
        filename: basename(file.path),
      );

      // Add file and data to request
      request.files.add(multiPartFile);
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add headers
      request.headers.addAll(defaultHeaders);

      // Send request
      var myRequest = await request.send();
      var response = await http.Response.fromStream(myRequest);

      // Handle response
      if (myRequest.statusCode == 200 || myRequest.statusCode == 201) {
        Map<String, dynamic> responseBody =
            response.body.isNotEmpty ? jsonDecode(response.body) : {};
        return right(responseBody);
      } else {
        debugPrint('Server Error: ${myRequest.statusCode}');
        return left(StatusRequest.serverFailure);
      }
    } on SocketException {
      debugPrint('No Internet Connection');
      return left(StatusRequest.offlineFailure);
    } on FormatException {
      debugPrint('Invalid Response Format');
      return left(StatusRequest.invalidResponse);
    } catch (e) {
      debugPrint('Unexpected Error: $e');
      return left(StatusRequest.serverFailure);
    }
  }
}

// import 'dart:convert';
// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// // import 'package:hamour/core/functions/check_connection.dart';
// import 'package:http/http.dart' as http;
// import 'package:konooze_system/core/classes/status_request.dart';
// import 'package:path/path.dart';

// String _basicAuth = 'Basic ${base64Encode(utf8.encode('haroon:123456'))}';

// Map<String, String> myheaders = {'authorization': _basicAuth};

// class Crud {
//   Future<Either<StatusRequest, Map>> postData(linkurl, Map data) async {
//     try {
//       // if (await checkInternetConnection()) {
//       var response = await http.post(Uri.parse(linkurl), body: data);

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // print("------response body: " + response.body);
//         Map responseBody =
//             response.body.isNotEmpty ? jsonDecode(response.body) : {};
//         return right(responseBody);
//       } else {
//         return left(StatusRequest.serverFailure);
//       }
//       // } else {
//       //   return left(StatusRequest.offlineFailure);
//       // }
//     } catch (_) {
//       return left(StatusRequest.serverFailure);
//     }
//   }

//   // postRequestWithFile(String url, Map data, File file) async {
//   //   try {
//   //     var request = http.MultipartRequest("POST", Uri.parse(url));
//   //     var fileLenght = await file.length();
//   //     var stream = http.ByteStream(file.openRead());
//   //     var multiPartFile = http.MultipartFile(
//   //       "file",
//   //       stream,
//   //       fileLenght,
//   //       filename: basename(file.path),
//   //     );
//   //     request.files.add(multiPartFile);
//   //     data.forEach((key, dynamic value) {
//   //       request.fields[key] = value;
//   //     });
//   //     request.headers.addAll(myheaders);
//   //     var myRequest = await request.send();
//   //     var response = await http.Response.fromStream(myRequest);
//   //     if (myRequest.statusCode == 200) {
//   //       Map responseBody = jsonDecode(response.body);
//   //       return right(responseBody);
//   //     } else {
//   //       return left(StatusRequest.serverFailure);
//   //     }
//   //   } catch (e) {
//   //     debugPrint('Error catched $e');
//   //     // return <String, dynamic>{};
//   //     return left(StatusRequest.serverFailure);
//   //   }
//   // }

// // postRequestWithFile(String url, Map data, File file) async {
// //   try {
// //     var request = http.MultipartRequest("POST", Uri.parse(url));
// //     var fileLenght = await file.length();
// //     var stream = http.ByteStream(file.openRead());
// //     var multiPartFile = http.MultipartFile(
// //       "file",
// //       stream,
// //       fileLenght,
// //       filename: basename(file.path),
// //     );
// //     request.files.add(multiPartFile);
// //     data.forEach((key, value) {
// //       request.fields[key] = value;
// //     });
// //     request.headers.addAll(myheaders);
// //     var myRequest = await request.send();
// //     var response = await http.Response.fromStream(myRequest);
// //     if (myRequest.statusCode == 200) {
// //       return jsonDecode(response.body);
// //     } else {
// //       debugPrint('Error ${response.statusCode}');
// //     }
// //   } catch (e) {
// //     print('Error catched $e');
// //     return <String, dynamic>{};
// //   }
// // }
//   Future<Either<StatusRequest, Map>> postRequestWithFile(
//       String url, Map<String, dynamic> data, File file) async {
//     try {
//       var request = http.MultipartRequest("POST", Uri.parse(url));
//       var fileLength = await file.length();
//       var stream = http.ByteStream(file.openRead());
//       var multiPartFile = http.MultipartFile(
//         "file",
//         stream,
//         fileLength,
//         filename: basename(file.path),
//       );
//       request.files.add(multiPartFile);
//       data.forEach((String key, dynamic value) {
//         request.fields[key] = value;
//       });
//       request.headers.addAll(myheaders);
//       var myRequest = await request.send();
//       var response = await http.Response.fromStream(myRequest);
//       // print("------ reuest feedback: "+myRequest.toString());
//       if (myRequest.statusCode == 200) {
//         Map responseBody = jsonDecode(response.body);
//         return right(responseBody);
//       } else {
//         return left(StatusRequest.serverFailure);
//       }
//     } catch (e) {
//       debugPrint('Error caught: $e');
//       return left(StatusRequest.serverFailure);
//     }
//   }
// }
