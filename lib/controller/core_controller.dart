import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_project/utils/storage_keys.dart';
import 'package:sample_project/views/auth/login_screen.dart';

import '../models/user.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();

  RxString userToken = "".obs;
  // Rx<AccessToken?> accessToken = Rxn<AccessToken>();
  // Rx<ThemeMode> themeMode = Rx<ThemeMode>(ThemeMode.system);

  @override
  void onInit() async {
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    var token = StorageHelper.getToken();
    userToken.value = token ?? "";
    log("current user----------------------- ${currentUser.value?.email}-");
    log("current user token----------------------- ${userToken.value}-");

    // accessToken.value = StorageHelper.getToken();
  }

  bool isUserLoggedIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    // await box.write(StorageKeys.ACCESS_TOKEN, null);
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAll(LogInScreen);
  }
}
