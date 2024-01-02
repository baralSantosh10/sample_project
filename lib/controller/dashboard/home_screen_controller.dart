import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/models/doctors.dart';
import 'package:sample_project/repo/booking_repo.dart';
import 'package:sample_project/repo/doctor_repo.dart';
import 'package:sample_project/utils/custom_snackbar.dart';
import 'package:sample_project/views/dashboard/dash_screen.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    getAllDoctorDetails();
    super.onInit();
  }

  final keys = GlobalKey<ScaffoldState>();
  RxInt current = RxInt(0);

  RxBool loading = RxBool(false);

  RxList<Doctors> allDoctorsDetails = <Doctors>[].obs;

  TextEditingController startDateController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;

  startChooseDate(BuildContext context) async {
    log("choose date");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );

    if (pickedDate != null) {
      startSelectedDate.value = pickedDate;

      startDateController.text =
          startSelectedDate.value.toString().split(" ")[0];
      log('--------->>>>>>>>>>>>${startDateController.text.toString()}');
    }
  }

  getAllDoctorDetails() async {
    loading.value = true;
    await DoctorRepo.getDoctor(
      onSuccess: (allDoctors) {
        loading.value = false;
        allDoctorsDetails.addAll(allDoctors);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Doctor", message: message);
      }),
    );
  }

  final dateKeys = GlobalKey<FormState>();

  addBooking(String id, String date) async {
    loading.value = true;
    await BookingRepo.addBooking(
      date: date,
      docId: id,
      onSuccess: () {
        loading.value = false;
        Get.offAll(() => DashScreen);
        CustomSnackBar.success(
            title: "Booking", message: "Booking is done sucessfully");
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Booking", message: message);
      }),
    );
  }
}
