import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sample_project/models/doctors.dart';
import 'package:sample_project/utils/apis.dart';

class DoctorRepo {
  static Future<void> getDoctor({
    required Function(List<Doctors> docs) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      http.Response response = await http.get(
        Uri.parse(Api.doctors),
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<Doctors> doctors = doctorFromJson(data["data"]);
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
