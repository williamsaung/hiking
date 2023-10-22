import '../../../configs/export_config.dart';
import '../../../models/export_models.dart';
import '../../../widgets/export_widgets.dart';

class BookCampsitePageController extends GetxController {
  TextEditingController fromCtrl = TextEditingController();
  TextEditingController toCtrl = TextEditingController();
  final Campsite campsite;
  BookCampsitePageController({required this.campsite});
  List multipleSelected = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Checklist 1",
    },
    {
      "id": 1,
      "value": false,
      "title": "Checklist 2",
    },
    {
      "id": 2,
      "value": false,
      "title": "Checklist 3",
    },
    {
      "id": 3,
      "value": false,
      "title": "Checklist 4",
    },
    {
      "id": 4,
      "value": false,
      "title": "Checklist 5",
    },
  ];

  setFromCtrl(String date) {
    fromCtrl.text = date;
    update();
  }

  setToCtrl(String date) {
    toCtrl.text = date;
    update();
  }
}
