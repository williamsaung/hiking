import '../../../configs/export_config.dart';
import '../../../constants/export_constants.dart';
import '../../../models/export_models.dart';
import '../../../widgets/export_widgets.dart';

class CampsiteDetailsPageController extends GetxController {
  final Campsite campsite;
  CampsiteDetailsPageController({required this.campsite});

  goBook() async {
    Get.toNamed(Routes.bookCampsite,
        id: Keys.mapNavigationKey, arguments: {'result': campsite});
  }

  goMessage() async {
    Get.toNamed(Routes.message, id: Keys.mapNavigationKey);
  }
}
