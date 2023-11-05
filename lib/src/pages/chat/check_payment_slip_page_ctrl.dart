import 'dart:io';

import 'package:hiking/src/pages/chat/notification_page_ctrl.dart';
import 'package:hiking/src/pages/export_pages.dart';

import '../../configs/export_config.dart';
import 'package:hiking/src/utils/base_controller/base_controller.dart';

class CheckPaymentSlipPageController extends BaseController with StateMixin {
  final String paymentSlip;
  RxString selectedImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  CheckPaymentSlipPageController({
    required this.paymentSlip,
  });
}
