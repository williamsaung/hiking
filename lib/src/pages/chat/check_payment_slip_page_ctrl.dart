import 'dart:io';

import 'package:hiking/src/constants/export_constants.dart';
import 'package:hiking/src/pages/chat/notification_page_ctrl.dart';
import 'package:hiking/src/pages/export_pages.dart';

import '../../configs/export_config.dart';
import 'package:hiking/src/utils/base_controller/base_controller.dart';

import '../../services/export_services.dart';

class CheckPaymentSlipPageController extends BaseController with StateMixin {
  final int bookingID;
  final String paymentSlip;
  RxString selectedImagePath = ''.obs;
  late CampsiteService campsiteService;

  @override
  void onInit() {
    campsiteService = CampsiteService();
    super.onInit();
  }

  Future callApproveBookingAPI() async {
    var data = {"status": 3};
    var request = campsiteService.updateBooking(bookingID, data);
    await campsiteService.returnResponse(
      request,
      onSuccess: (_) async {
        await Get.find<NotificationPageController>().initAPI();
        Get.off(NotificationPage(), id: Keys.historyNavigationKey);
      },
    );
  }

  CheckPaymentSlipPageController({
    required this.paymentSlip,
    required this.bookingID,
  });
}
