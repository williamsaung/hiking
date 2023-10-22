import '../../../configs/export_config.dart';
import '../../../constants/export_constants.dart';
import '../../../models/export_models.dart';
import '../../../services/export_services.dart';
import '../../../widgets/export_widgets.dart';
import '../../bottom_bar/bottom_bar_pages_ctrl.dart';

class BookCampsitePageController extends GetxController {
  TextEditingController checkIn = TextEditingController();
  TextEditingController checkOut = TextEditingController();
  final TextEditingController numberOfPeople = TextEditingController();
  final Campsite campsite;
  BookCampsitePageController({required this.campsite});
  List multipleSelected = [];
  late CampsiteService bookCampsiteService;
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
    checkIn.text = date;
    update();
  }

  setToCtrl(String date) {
    checkOut.text = date;
    update();
  }

  @override
  void onInit() {
    bookCampsiteService = CampsiteService();
    super.onInit();
  }

  void navigateAfterBookingPage() {
    Get.offAllNamed(Routes.start, id: Keys.profileNavigationKey);
    final boottomController = Get.find<BottomBarPagesController>();
    boottomController.currentIndex(0);
  }

  void clickBooking() async {
    var response = bookCampsiteService.bookCampsite(
      checkIn: checkIn.text,
      checkOut: checkOut.text,
      numberOfPeople: int.parse(numberOfPeople.text),
      campsiteID: campsite.id!,
    );
    try {
      await bookCampsiteService.returnResponse(
        response,
        onSuccess: (responseJson) {
          navigateAfterBookingPage();
        },
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
