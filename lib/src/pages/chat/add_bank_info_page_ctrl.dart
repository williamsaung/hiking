import 'package:hiking/src/configs/export_config.dart';
import 'package:hiking/src/services/export_services.dart';
import 'package:hiking/src/widgets/export_widgets.dart';

import '../../constants/export_constants.dart';
import '../export_pages.dart';
import 'notification_page_ctrl.dart';

class AddBankInfoPageController extends GetxController {
  final int bookingID;
  final TextEditingController bankNumber = TextEditingController();
  final TextEditingController bankName = TextEditingController();
  final CampsiteService campsiteService = CampsiteService();

  AddBankInfoPageController({
    required this.bookingID,
  });

  Future<void> submitBankInfo() async {
    updateBankInfo();
  }

  @override
  void onClose() {
    bankNumber.dispose();
    bankName.dispose();
    campsiteService.close();
    super.onClose();
  }

  Future<void> updateBankInfo() async {
    var data = {
      "bank_name": bankName.text,
      "bank_number": bankNumber.text,
      "status": 1
    };
    var request = campsiteService.updateBooking(bookingID, data);
    await campsiteService.returnResponse(
      request,
      onSuccess: (_) async {
        await Get.find<NotificationPageController>().initAPI();
        Get.off(NotificationPage(), id: Keys.chatNavigation);
      },
    );
  }
}
