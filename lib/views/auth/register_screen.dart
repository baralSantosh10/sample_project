// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/controller/auth/register_screen_controller.dart';
import 'package:sample_project/utils/colors.dart';
import 'package:sample_project/utils/custom_text_style.dart';
import 'package:sample_project/utils/validators.dart';
import 'package:sample_project/views/auth/login_screen.dart';
import 'package:sample_project/widgets/custom/custom_password_fields.dart';
import 'package:sample_project/widgets/custom/custom_textfield.dart';
import 'package:sample_project/widgets/custom/elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final c = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 3,
                width: double.infinity,
                child: const Image(
                  image: AssetImage("assets/images/event.png"),
                  fit: BoxFit.fill,
                ),
              ),
              Form(
                key: c.formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register Your Account",
                        style: CustomTextStyles.f24W600(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Please fill the form to continue",
                        style: CustomTextStyles.f14W400(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Full Name",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        hint: "Alone Maskey",
                        controller: c.nameController,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email Address",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        hint: "hi5@gmail.com",
                        controller: c.emailController,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Phone Number",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                          controller: c.phoneNumberController,
                          validator: Validators.checkPhoneField,
                          hint: "Phone Number",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomPasswordField(
                        controller: c.passwordController,
                        validator: Validators.checkFieldEmpty,
                        eye: c.passwordObscure.value,
                        onEyeClick: c.onEyeCLick,
                        hint: "Password",
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Confirm Password",
                        style: CustomTextStyles.f14W400(),
                      ),
                      Obx(
                        () => CustomPasswordField(
                          hint: "Password",
                          eye: c.passwordObscure.value,
                          validator: Validators.checkPasswordField,
                          onEyeClick: c.onEyeCLick,
                          controller: c.passwordController,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomElevatedButton(
                        title: "Register",
                        onTap: () {
                          c.onSubmit();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account ? ",
                            style: CustomTextStyles.f14W400(),
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(() => LogInScreen());
                            },
                            child: InkWell(
                              onTap: () {
                                Get.to(() => LogInScreen());
                              },
                              child: Text(
                                "Login Here",
                                style: CustomTextStyles.f14W400(
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
