import 'package:hiking/src/models/export_models.dart';

import '../../configs/export_config.dart';
import 'package:hiking/src/utils/base_controller/base_controller.dart';

import '../../constants/export_constants.dart';
import '../../services/export_services.dart';

class MyCampsitePageController extends BaseController with StateMixin {
  final CampsiteService campsiteService = CampsiteService();
  List<Campsite> campsiteList = [];

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
        await callAPICampsite();
        campsiteList.isEmpty
            ? change(null, status: RxStatus.empty())
            : change(null, status: RxStatus.success());
      },
      onError: (e) {
        change(null, status: RxStatus.error());
      },
    );
  }

  String getStatusName(int type) {
    if (type == 0) {
      return Texts.texts.pending;
    } else if (type == 1) {
      return Texts.texts.accepted;
    } else if (type == 2) {
      return Texts.texts.rejected;
    } else {
      return Texts.texts.paymentInfoFilled;
    }
  }

  Future<void> callAPICampsite() async {
    try {
      var response = campsiteService.getCampsiteList();
      await campsiteService.returnResponse(response, onSuccess: (jsonString) {
        print(jsonString['results']);
        List<Campsite> dataList = [];
        for (var element in jsonString['results']) {
          dataList.add(Campsite.fromJson(element));
        }
        campsiteList.assignAll(dataList);
        print(campsiteList);
      });
    } catch (e) {
      print('CampsiteList $e');
      rethrow;
    }
  }

  addMyCampsite() {
    Get.toNamed(Routes.addCampsiteForm);
  }

  addCardInfo() {
    Get.toNamed(Routes.addCardInfo);
  }
}
