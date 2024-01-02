import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/controller/history_screen_controller.dart';
import 'package:sample_project/models/booking_history.dart';
import 'package:sample_project/utils/colors.dart';
import 'package:sample_project/utils/custom_text_style.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final c = Get.put(HistoryScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: CustomTextStyles.f16W400(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.historyDetail.clear();
          c.getAllHistory();
        },
        child: SafeArea(
          child: Obx(
            () => c.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: c.historyDetail.length,
                    itemBuilder: (context, index) {
                      BookingHistory history = c.historyDetail[index];
                      return HistoryListCard(
                        history: history,
                        colors: index % 2 == 0
                            ? AppColors.primaryColor
                            : Colors.amber,
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

class HistoryListCard extends StatelessWidget {
  const HistoryListCard({
    key,
    required this.history,
    required this.colors,
  }) : super(key: key);

  final BookingHistory history;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 9,
                color: const Color(0xFF494949).withOpacity(0.06),
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: colors,
                ),
                width: 10,
                height: 120,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item name: ${history.name ?? ""}",
                    style: CustomTextStyles.f14W400(),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Item Details: ${history.email ?? ""}",
                    style: CustomTextStyles.f14W400(),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Size ${history.date ?? ""} ${history.time ?? ""}",
                    style: CustomTextStyles.f14W400(),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondaryTextColor,
                    ),
                    child: Text(
                      "",
                      style: CustomTextStyles.f14W400(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
