import '../../configs/export_config.dart';
import '../../constants/export_constants.dart';
import '../../widgets/export_widgets.dart';

class BaseController extends GetxController {
  Future<void> callInitAPI({
    PageType pageType = PageType.create,
    Future<void> Function()? onCreate,
    Future<void> Function()? onEdit,
    void Function(String e)? onError,
    bool showOverlay = true,
  }) async {
    try {
      showOverlay ? LoadingCustom.showOverlay() : null;
      if (pageType == PageType.create) {
        onCreate != null ? await Future.sync(onCreate) : null;
      } else {
        onEdit != null ? await Future.sync(onEdit) : null;
      }
      showOverlay ? LoadingCustom.hideOverlay() : null;
    } catch (e) {
      showOverlay ? LoadingCustom.hideOverlay() : null;
      onError?.call(e.toString());
      debugPrint("callInitAPI Error: $e");
    }
  }
}
