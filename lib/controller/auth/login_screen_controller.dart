import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_project/controller/core_controller.dart';
import 'package:sample_project/repo/login_repo.dart';
import 'package:sample_project/utils/custom_snackbar.dart';
import 'package:sample_project/utils/storage_keys.dart';
import 'package:sample_project/views/dashboard/dash_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LogInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait ..");
      await LoginRepo.login(
        email: emailController.text,
        password: passwordController.text,
        onSuccess: (user, token) async {
          loading.hide();
          final box = GetStorage();
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
          Get.put(CoreController()).loadCurrentUser();
          Get.offAll(() => DashScreen());
          CustomSnackBar.success(title: "Login", message: "Login Successfull");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Login", message: message);
        },
      );
    }
  }
}
