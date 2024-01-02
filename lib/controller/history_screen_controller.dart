import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sample_project/models/booking_history.dart';
import 'package:sample_project/repo/history_repo.dart';
import 'package:sample_project/utils/custom_snackbar.dart';

class HistoryScreenController extends GetxController {
  @override
  void onInit() {
    getAllHistory();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<BookingHistory> historyDetail = <BookingHistory>[].obs;

  getAllHistory() async {
    loading.value = true;
    await HistoryRepo.getHistory(
      onSuccess: (allDoctors) {
        loading.value = false;
        historyDetail.addAll(allDoctors);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "History", message: message);
      }),
    );
  }
}
