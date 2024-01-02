import 'dart:async';

import 'package:get/get.dart';
import 'package:sample_project/controller/core_controller.dart';

import 'package:sample_project/views/auth/login_screen.dart';
import 'package:sample_project/views/dashboard/dash_screen.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());
  @override
  void onInit() {
    Timer(const Duration(seconds: 15), () async {
      if (c.isUserLoggedIn()) {
        Get.offAll(() => DashScreen());
      } else {
        Get.offAll(() => LogInScreen());
      }
    });
    super.onInit();
  }
}
