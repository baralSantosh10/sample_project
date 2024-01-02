import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sample_project/models/booking_history.dart';
import 'package:sample_project/utils/apis.dart';
import 'package:sample_project/utils/storage_keys.dart';

class HistoryRepo {
  static Future<void> getHistory({
    required Function(List<BookingHistory> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var token = StorageHelper.getToken();
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      log("${Api.getHistory}?token=$token");

      http.Response response = await http.get(
        Uri.parse("${Api.getHistory}?token=$token"),
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<BookingHistory> doctors = bookingHistoryFromJson(data["data"]);
        onSuccess(doctors);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log(e.toString());
      onError("Sorry! something went wrong");
    }
  }
}
