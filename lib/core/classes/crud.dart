import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // Remove http import
import 'package:dio/dio.dart'; // Import dio
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

  // Create a Dio instance
  final Dio _dio = Dio();

  /// Sends a POST request with form data using Dio.
  Future<Either<StatusRequest, Map>> postData(
      String url, Map<String, dynamic> data) async {
    try {
      // Check internet connection (optional, might work differently with Dio/web)
      // if (!await checkInternetConnection()) {
      //   return left(StatusRequest.offlineFailure);
      // }

      debugPrint('Sending POST to: $url');
      debugPrint('Request Data: ${jsonEncode(data)}'); // Log request data

      // Create headers specifically for form-urlencoded data, excluding application/json
      Map<String, String> headersForFormData = Map.from(defaultHeaders);
      headersForFormData
          .remove('Content-Type'); // Remove the default application/json header

      // Send POST request using Dio
      var response = await _dio.post(
        url,
        options: Options(
          contentType: Headers
              .formUrlEncodedContentType, // Explicitly set form-urlencoded content type
          headers:
              headersForFormData, // Use the modified headers (includes Authorization, excludes default Content-Type)
        ),
        data:
            data, // Pass the map directly, dio handles form encoding with the correct contentType
      );

      debugPrint(
          'Response Status Code: ${response.statusCode}'); // Log status code

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Dio often decodes JSON automatically based on Content-Type
        // Ensure response.data is treated as a Map<String, dynamic>
        Map<String, dynamic> responseBody = response.data is Map
            ? Map<String, dynamic>.from(response.data)
            : {};
        debugPrint(
            'Successful Response Body: ${jsonEncode(responseBody)}'); // Log successful response body
        return right(responseBody);
      } else {
        debugPrint('Server Error Status: ${response.statusCode}');
        debugPrint(
            'Error Response Data: ${response.data}'); // Log response.data for non-200 status
        // You might want more granular error handling based on status code or response data
        return left(StatusRequest.serverFailure);
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      debugPrint('DioException caught: ${e.type}'); // Log DioException type
      debugPrint(
          'DioException Message: ${e.message}'); // Log DioException message
      debugPrint(
          'DioException Response Data: ${e.response?.data}'); // Log response data on error

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        debugPrint('Dio Error: Connection or Unknown error');
        return left(StatusRequest
            .offlineFailure); // Assuming connection issues are offline
      } else if (e.type == DioExceptionType.badResponse) {
        debugPrint('Dio Error: Bad response - ${e.response?.statusCode}');
        debugPrint('Dio Error Response Data: ${e.response?.data}');
        // You might want more granular error handling based on status code or response data
        return left(StatusRequest
            .serverFailure); // Treat bad response as server failure
      } else if (e.type == DioExceptionType.cancel) {
        debugPrint('Dio Error: Request cancelled');
        return left(StatusRequest
            .serverFailure); // Or a specific cancelled status if you have one
      } else {
        debugPrint('Dio Error: Other type - ${e.type}');
        return left(StatusRequest.serverFailure);
      }
    } catch (e) {
      // Catch any other unexpected errors
      debugPrint(
          'Unexpected Error Type: ${e.runtimeType}'); // Log unexpected error type
      debugPrint('Unexpected Error: $e'); // Log unexpected error details
      return left(StatusRequest.serverFailure);
    }
  }

  /// Sends a POST request with a file upload using Dio.
  Future<Either<StatusRequest, Map>> postRequestWithFile(
      String url, Map<String, dynamic> data, File file) async {
    try {
      // Prepare form data with file
      String fileName = basename(file.path);
      FormData formData = FormData.fromMap({
        for (var entry in data.entries) entry.key: entry.value,
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      // Remove Content-Type from defaultHeaders as Dio handles it for FormData
      Map<String, String> headersForFormData = Map.from(defaultHeaders);
      headersForFormData.remove('Content-Type');

      // Send POST request with FormData using Dio
      var response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: headersForFormData), // Use modified headers
      );

      // Handle response (similar to postData)
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = response.data is Map
            ? Map<String, dynamic>.from(response.data)
            : {};
        debugPrint('Successful Response Body: ${jsonEncode(responseBody)}');
        return right(responseBody);
      } else {
        debugPrint('Server Error: ${response.statusCode}');
        debugPrint('Error Response Data: ${response.data}');
        return left(StatusRequest.serverFailure);
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors (similar to postData)
      debugPrint('DioException caught: ${e.type}');
      debugPrint('DioException Message: ${e.message}');
      debugPrint('DioException Response Data: ${e.response?.data}');

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        debugPrint('Dio Error: Connection or Unknown error');
        return left(StatusRequest.offlineFailure);
      } else if (e.type == DioExceptionType.badResponse) {
        debugPrint('Dio Error: Bad response - ${e.response?.statusCode}');
        debugPrint('Dio Error Response Data: ${e.response?.data}');
        return left(StatusRequest.serverFailure);
      } else if (e.type == DioExceptionType.cancel) {
        debugPrint('Dio Error: Request cancelled');
        return left(StatusRequest.serverFailure);
      } else {
        debugPrint('Dio Error: Other type - ${e.type}');
        return left(StatusRequest.serverFailure);
      }
    } catch (e) {
      // Catch any other unexpected errors
      debugPrint('Unexpected Error Type: ${e.runtimeType}');
      debugPrint('Unexpected Error: $e');
      return left(StatusRequest.serverFailure);
    }
  }
}

// Keep the commented out sections as they might contain useful references or alternative implementations.
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
//   //     }
//   //     // Removed incorrect 'else {' that caused syntax error
//   //     else {
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
// //   }
// //   catch (e) {
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
