import '../../configs/export_config.dart';
import '../../models/export_models.dart';
import '../../services/export_services.dart';
import '../../widgets/export_widgets.dart';
import '../../widgets/http_widgets/httpErrWidget.dart';
import 'login_text_ctrl.dart';

class LoginController extends GetxController {
  BuildContext context;
  LoginController(this.context);
  TokenAuthModel? tokenAuthModel;

  final LoginTextController loginTextController = LoginTextController();
  final obscureText = true.obs;
  bool? validation;
  late AuthenticationService authenticationService;

  @override
  void onInit() {
    authenticationService = AuthenticationService();
    loginTextController.email.text = 'wya.wil.i.am@gmail.com';
    loginTextController.password.text = 'password123';
    super.onInit();
  }

  void onClickLogin() async {
    Get.focusScope?.unfocus();
    validation = loginTextController.isDataValid();
    if ((validation ?? false)) {
      await callAPITokenAuth();
    }
  }

  void showPassword() {
    obscureText.value = !obscureText.value;
  }

  void navigatorPage() {
    Get.toNamed(Routes.register);
  }

  void navigateAfterLoginPage() {
    Get.toNamed(Routes.bottomBarPages);
  }

  Future saveLoginData() async {
    await SharedPreferencesUtil.setTokenAuth(tokenAuthModel!);
    navigateAfterLoginPage();
  }

  Future callAPITokenAuth() async {
    var data = {
      "email": loginTextController.email.text.trim(),
      "password": loginTextController.password.text.trim(),
    };
    try {
      var response = authenticationService.tokenAuth(data);
      await authenticationService.returnResponse(response, showOverlay: true,
          onSuccess: (jsonString) {
        print(jsonString);
        tokenAuthModel = TokenAuthModel.fromJson(jsonString);
        UserConfig.session = tokenAuthModel;
        saveLoginData();
      });
    } catch (e) {
      debugPrint('Login $e');
      showNotFoundDialog(
          title: Texts.texts.loginFailed, middleText: Texts.texts.userNotFound);
    }
  }
}
