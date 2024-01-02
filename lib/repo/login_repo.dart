import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sample_project/models/user.dart';
import 'package:sample_project/utils/apis.dart';

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required void Function(User user, String token) onSuccess,
    required void Function(String message) onError,
  }) async {
    try {
      
      // Define headers with content type for JSON
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      // Log headers for debugging
      log("Headers: $headers");

      // Create a JSON-encoded request body
      var body = jsonEncode(
          {"email": email, "password": password, "type": "customer"});

      // Make the HTTP POST request
      http.Response response = await http.post(
        Uri.parse(Api.loginUrl),
        headers: headers,
        body: body,
      );

      // Log the entire response for debugging
      log("Response: $response");
      

      
      dynamic data = jsonDecode(response.body);

      // Check if the status code indicates success
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Extract token and user data
        String accessToken = data["token"].toString();
        User user = User.fromJson(data["user"]);

        // Call the onSuccess callback with user and token
        onSuccess(user, accessToken);
      } else {
        // Call the onError callback with the error message
        onError(data["message"]);
      }
    } catch (e, s) {
      // Log and handle exceptions
      log("Error: $e");
      log("Stack Trace: $s");
      onError("Sorry, something went wrong");
    }
  }
}
