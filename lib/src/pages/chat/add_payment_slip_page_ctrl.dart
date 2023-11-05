import 'dart:io';

import 'package:hiking/src/pages/chat/notification_page_ctrl.dart';
import 'package:hiking/src/pages/export_pages.dart';

import '../../configs/export_config.dart';
import 'package:hiking/src/utils/base_controller/base_controller.dart';

import '../../constants/export_constants.dart';
import '../../models/export_models.dart';
import '../../services/export_services.dart';
import '../../widgets/http_widgets/httpErrWidget.dart';

class AddPaymentSlipPageController extends BaseController with StateMixin {
  final picker = ImagePicker();
  final int bookingID;
  final String bankName;
  final String bankNumber;
  RxString selectedImagePath = ''.obs;
  late CampsiteService campsiteService;

  @override
  void onInit() {
    campsiteService = CampsiteService();
    super.onInit();
  }

  AddPaymentSlipPageController({
    required this.bookingID,
    required this.bankName,
    required this.bankNumber,
  });

  Future callAPIUploadSlip() async {
    try {
      var response = campsiteService.addUploadSlip(
        bookingID: bookingID,
        data: {
          'status': 2.toString(),
        },
        image: File(selectedImagePath.value),
      );
      await campsiteService.returnResponse(response, showOverlay: true,
          onSuccess: (jsonString) async {
        await Get.find<NotificationPageController>().initAPI();
        Get.off(NotificationPage(), id: Keys.chatNavigation);
      });
    } catch (e) {
      print(e);
      showNotFoundDialog(title: Texts.texts.failToSave, middleText: '');
    }
  }

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      print('called');
    } else {
      print('No image selected.');
    }
  }
}
