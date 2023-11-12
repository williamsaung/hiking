import 'package:hiking/src/models/export_models.dart';

import '../../configs/export_config.dart';
import '../../constants/export_constants.dart';

class MapController extends GetxController {
  final int userId = UserConfig.session!.id!;

  @override
  void onInit() {
    super.onInit();
  }

  goDetails(campsite) async {
    Campsite myCampsite = Campsite.fromJson(campsite);
    Get.toNamed(Routes.campsiteDetails,
        id: Keys.mapNavigationKey, arguments: {'result': myCampsite});
  }
}
