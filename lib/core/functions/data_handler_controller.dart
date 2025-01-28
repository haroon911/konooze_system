import 'package:konooze_system/core/classes/status_request.dart';

dataHandler(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
