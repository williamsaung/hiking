import '../../../configs/export_config.dart';
import '../../../constants/export_constants.dart';
import '../../../models/export_models.dart';
import '../../../widgets/export_widgets.dart';

class CampsiteHistoryDetailsPageController extends GetxController {
  final Booking booking;
  final Campsite campsite;
  CampsiteHistoryDetailsPageController(
      {required this.booking, required this.campsite});

  goBook() async {
    Get.toNamed(Routes.bookCampsite,
        id: Keys.mapNavigationKey, arguments: {'booking': booking});
  }
}
