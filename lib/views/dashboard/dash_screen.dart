import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/controller/dashboard/dash_screen_controller.dart';
import 'package:sample_project/utils/colors.dart';

class DashScreen extends StatelessWidget {
  static const String routeName = "/dash_screen";
  final c = Get.put(DashScreenController());
   DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: c.key,
      body: Obx(() => c.pages[c.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(selectedIndex: c.currentIndex.value, onItemSelected: c.onItemTapped,
        items: [
          BottomNavyBarItem(icon: Icon(Icons.home)
          , title: Text("Home"),
          textAlign: TextAlign.center,
          activeColor: AppColors.primaryColor,
          inactiveColor: AppColors.lGrey),
          BottomNavyBarItem(
                  icon: Icon(Icons.history),
                  title: Text("History"),
                  textAlign: TextAlign.center,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.lGrey),
                  BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  textAlign: TextAlign.center,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.lGrey),
        ],)
      ),
     
    );
  }
}
