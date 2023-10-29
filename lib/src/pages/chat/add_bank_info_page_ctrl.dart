import 'package:hiking/src/configs/export_config.dart';
import 'package:hiking/src/widgets/export_widgets.dart';

class AddBankInfoPageController extends GetxController {
  final TextEditingController number = TextEditingController();

  Future<void> navigateAfterBookingPage() async {
    // print('hehee');
    // Get.offAllNamed(Routes.start, id: Keys.profileNavigationKey);
    Get.back();
  }
}
