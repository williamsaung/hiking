import '../../../services/export_services.dart';
import '../../../widgets/http_widgets/httpErrWidget.dart';
import 'register_text_ctrl.dart';

import '../../../configs/export_config.dart';
import '../../../widgets/export_widgets.dart';

class RegisterController extends GetxController {
  final BuildContext context;
  final RegisterTextController reigsterTextController =
      RegisterTextController();
  bool? validation;
  late AuthenticationService authenticationService;
  var email = ''.obs;
  RegisterController(this.context);

  @override
  void onInit() {
    authenticationService = AuthenticationService();
    super.onInit();
  }

  void navigatorPage() {
    Get.toNamed(Routes.emailVerification);
  }

  void onClickRegister() async {
    Get.focusScope?.unfocus();
    validation = reigsterTextController.isDataValid();
    print(validation);
    if ((validation ?? false)) {
      await callRegisterAPI();
    }
  }

  Future callRegisterAPI() async {
    var data = {
      "first_name": reigsterTextController.name.text.trim(),
      "email": reigsterTextController.email.text.trim(),
      "password": reigsterTextController.password.text.trim(),
    };
    print(data);
    try {
      var response = authenticationService.registerUser(data);
      await authenticationService.returnResponse(response, showOverlay: true,
          onSuccess: (jsonString) {
        email.value = reigsterTextController.email.text.trim();
        navigatorPage();
      });
    } catch (e) {
      debugPrint('Login $e');
      showNotFoundDialog(
          title: Texts.texts.registerFailed, middleText: Texts.texts.error);
    }
  }
}
