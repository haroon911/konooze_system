import 'package:konooze_system/core/classes/status_request.dart';

dataHandler(dynamic response) {
  if (response is StatusRequest) {
    return response;
  } else if (response != null && response is Map<String, dynamic>) {
    // Assuming the API returns a Map with a 'status' key
    if (response.containsKey('status') && response['status'] == true) {
      return StatusRequest.success;
    } else {
      // Assuming any other response or status false indicates failure
      return StatusRequest.failure;
    }
  } else {
    // Handle cases where response is null or not a Map as a failure
    return StatusRequest.failure;
  }
}
