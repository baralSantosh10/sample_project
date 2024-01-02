import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/controller/dashboard/home_screen_controller.dart';
import 'package:sample_project/models/doctors.dart';
import 'package:sample_project/widgets/doctorListCard.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

final c = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: c.allDoctorsDetails.length,
                itemBuilder: (context, index) {
                  Doctors doc = c.allDoctorsDetails[index];
                  return DoctorListCard(
                    doctor: doc,
                  );
                }),
      ),
    );
  }
}
