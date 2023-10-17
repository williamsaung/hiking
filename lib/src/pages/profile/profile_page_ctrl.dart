import '../../configs/export_config.dart';
import 'package:hiking/src/utils/base_controller/base_controller.dart';

import '../bottom_bar/bottom_bar_pages_ctrl.dart';

class ProfilePageController extends BaseController with StateMixin {
  switchToCampsiteOwner() {
    BottomBarPagesController bottomBarPagesController =
        Get.find<BottomBarPagesController>();
    bottomBarPagesController.setIsUserPage(false);
  }
}
