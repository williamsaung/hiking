import 'package:hiking/src/pages/auth/register/register_ctrl.dart';

import '../../../services/export_services.dart';
import '../../../configs/export_config.dart';
import '../../../widgets/export_widgets.dart';
import '../../../widgets/http_widgets/httpErrWidget.dart';

class CompleteProfileController extends GetxController {
  final BuildContext context;
  final TextEditingController phoneNumber = TextEditingController();
  late AuthenticationService authenticationService;

  CompleteProfileController(this.context);

  @override
  void onInit() {
    authenticationService = AuthenticationService();
    super.onInit();
  }

  void navigatorPage() {
    Get.toNamed(Routes.phoneVerification);
  }

  Future callsendOTPAPI() async {
    var data = {
      "phone_number": phoneNumber.text.trim(),
      "email": Get.find<RegisterController>().email.value,
    };
    print(data);
    try {
      var response = authenticationService.sendOTP(data);
      await authenticationService.returnResponse(response, showOverlay: true,
          onSuccess: (jsonString) {
        print(jsonString);
        navigatorPage();
      });
    } catch (e) {
      debugPrint('Login $e');
      showNotFoundDialog(
          title: Texts.texts.verificationFailed, middleText: Texts.texts.error);
    }
  }
}
