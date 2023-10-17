import '../../configs/export_config.dart';
import '../export_widgets.dart';

class LoadingCustom {
  static BuildContext? context = Get.context;

  static void showOverlay() {
    debugPrint("showOverlay $context");
    return context?.loaderOverlay.show();
  }

  static void hideOverlay() {
    debugPrint("hideOverlay $context");
    return context?.loaderOverlay.hide();
  }

  static Widget loadingWidget({double size = 30}) {
    return SpinKitThreeBounce(
      color: AppTheme.blue,
      size: size,
    );
  }

  static Widget loadingOverlayWidget({double size = 30}) {
    return SpinKitThreeBounce(
      color: AppTheme.white,
      size: size,
    );
  }

  static Future disableTouch() async {
    Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: Container(),
        ),
        barrierDismissible: false,
        barrierColor: Colors.transparent);
  }
}
