import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/models/doctors.dart';
import 'package:sample_project/utils/custom_text_style.dart';
import 'package:sample_project/views/dashboard/description.dart';
import 'package:sample_project/widgets/custom/elevated_button.dart';

class DoctorListCard extends StatelessWidget {
  const DoctorListCard({
    super.key,
    required this.doctor,
  });

  final Doctors doctor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 128,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 9,
              color: const Color(0xFF494949).withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    height: 60,
                    width: 60,
                    imageUrl: doctor.displayImage ?? "",
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/common/logo.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width / 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name ?? "",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        doctor.category ?? "",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  doctor.email ?? "",
                  style: CustomTextStyles.f14W400(),
                ),
                SizedBox(
                  height: 40,
                  width: 90,
                  child: CustomElevatedButton(
                      title: "Book",
                      onTap: () {
                        Get.to(
                          () => SinglePage(
                            doctors: doctor,
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
