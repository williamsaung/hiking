import '../../../services/export_services.dart';
import '../../../configs/export_config.dart';
import '../../../widgets/export_widgets.dart';
import '../../../widgets/http_widgets/httpErrWidget.dart';

class EmailVerificationController extends GetxController {
  final BuildContext context;
  final TextEditingController verificationNumber = TextEditingController();
  late AuthenticationService authenticationService;

  EmailVerificationController(this.context);

  @override
  void onInit() {
    authenticationService = AuthenticationService();
    super.onInit();
  }

  void navigatorPage() {
    Get.toNamed(Routes.completeProfile);
  }

  Future callemailVerifyAPI() async {
    var data = {
      "verification_number": verificationNumber.text.trim(),
    };
    print(data);
    try {
      var response = authenticationService.verifyEmail(data);
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
