import '../../configs/export_config.dart';
import 'package:hiking/src/utils/base_controller/base_controller.dart';

import '../../models/export_models.dart';
import '../../services/export_services.dart';

class NotificationPageController extends BaseController with StateMixin {
  List<Booking> bookingList = [];
  final CampsiteService campsiteService = CampsiteService();

  @override
  void onInit() {
    initAPI();
    super.onInit();
  }

  Future initAPI() async {
    change(null, status: RxStatus.loading());
    await callInitAPI(
      showOverlay: true,
      onCreate: () async {
        await callAPIBooking();
        bookingList.isEmpty
            ? change(null, status: RxStatus.empty())
            : change(null, status: RxStatus.success());
      },
      onError: (e) {
        change(null, status: RxStatus.error());
      },
    );
  }

  addBankInfo() {
    Get.toNamed(Routes.addBankInfo);
  }

  Future<void> callAPIBooking() async {
    try {
      var response = campsiteService.getBookingList();
      await campsiteService.returnResponse(response, onSuccess: (jsonString) {
        List<Booking> dataList = [];
        for (var element in jsonString['results']) {
          dataList.add(Booking.fromJson(element));
        }
        bookingList.assignAll(dataList);
        print(bookingList);
      });
    } catch (e) {
      print('CampsiteList $e');
      rethrow;
    }
  }
}
