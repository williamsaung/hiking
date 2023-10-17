import '../../../configs/export_config.dart';
import '../../../models/export_models.dart';
import '../../../widgets/export_widgets.dart';

class BookCampsitePageController extends GetxController {
  TextEditingController fromCtrl = TextEditingController();
  TextEditingController toCtrl = TextEditingController();
  final Campsite campsite;
  BookCampsitePageController({required this.campsite});

  setFromCtrl(String date) {
    fromCtrl.text = date;
    update();
  }

  setToCtrl(String date) {
    toCtrl.text = date;
    update();
  }
}
