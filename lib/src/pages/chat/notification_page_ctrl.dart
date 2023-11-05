import '../../configs/export_config.dart';
import 'package:hiking/src/utils/base_controller/base_controller.dart';

import '../../constants/export_constants.dart';
import '../../models/export_models.dart';
import '../../services/export_services.dart';

class NotificationPageController extends BaseController with StateMixin {
  List<Booking> bookingList = [];
  final CampsiteService campsiteService = CampsiteService();
  final int userId = UserConfig.session!.id!;

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

  checkPaymentSlip(String paymentSlip, int bookingID) {
    Get.toNamed(Routes.checkPaymentSlip,
        id: Keys.historyNavigationKey,
        arguments: {'paymentSlip': paymentSlip, 'bookingID': bookingID});
  }

  addPaymentSlip(int bookingID, String bankName, String bankNumber) {
    Get.toNamed(Routes.addPaymentSlip, id: Keys.chatNavigation, arguments: {
      'bookingID': bookingID,
      'bankName': bankName,
      'bankNumber': bankNumber
    });
  }

  seeBookingDetails(Booking booking) {
    Get.toNamed(Routes.campsiteHistoryDetails,
        id: Keys.historyNavigationKey, arguments: {'booking': booking});
  }

  addBankInfo(int bookingID) {
    Get.toNamed(Routes.addBankInfo,
        id: Keys.historyNavigationKey, arguments: {'bookingID': bookingID});
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
