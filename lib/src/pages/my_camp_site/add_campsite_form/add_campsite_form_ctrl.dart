import 'dart:convert';

import 'package:map_location_picker/map_location_picker.dart';

import '../../../configs/export_config.dart';
import '../../../models/export_models.dart';
import '../../../services/export_services.dart';
import '../../../widgets/export_widgets.dart';
import '../../../widgets/http_widgets/httpErrWidget.dart';
import 'add_package_pages.dart';

class AddCampsiteFormPageController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final addressField = TextEditingController().obs;
  final picker = ImagePicker();
  List<XFile>? selectedImages = [];
  List<String> selectedImagesPath = [];
  var selectedImageCount = 0.obs;
  late CampsiteService campsiteService;
  var address = ''.obs;
  var selectedLatitute = 13.6795146.obs;
  var selectedLongitude = 100.6154628.obs;
  List<Marker> allMarkers = <Marker>[].obs; // Inside Map View Controller
  Rx<LatLng> initialPosition = LatLng(13.6795146, 100.6154628).obs;
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Campfire Area",
    },
    {
      "id": 1,
      "value": false,
      "title": "Picnic Tables",
    },
    {
      "id": 2,
      "value": false,
      "title": "Restrooms/Showers",
    },
    {
      "id": 3,
      "value": false,
      "title": "Water Source",
    },
    {
      "id": 4,
      "value": false,
      "title": "Electric Hookups",
    },
    {
      "id": 5,
      "value": false,
      "title": "Trash/Recycling Stations",
    },
    {
      "id": 6,
      "value": false,
      "title": "Hiking Trails",
    },
  ];
  List multipleSelected = [];
  var packageType = true.obs;
  var packages = <Package>[].obs;

  @override
  void onInit() {
    campsiteService = CampsiteService();
    super.onInit();
  }

  void selectMultipleImage() async {
    selectedImages = await picker.pickMultiImage();
    if (selectedImages != null) {
      for (XFile file in selectedImages!) {
        selectedImagesPath.add(file.path);
      }
    } else {
      Get.snackbar('Fail', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
    }

    selectedImageCount.value = selectedImagesPath.length;
  }

  Future<void> selectLocation(context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MapLocationPicker(
            apiKey: "AIzaSyBXGsKppD2h_5tI2l6Mo2mmQcIKTxytoyE",
            popOnNextButtonTaped: true,
            currentLatLng: const LatLng(0, 0),
            onNext: (GeocodingResult? result) {
              if (result != null) {
                initialPosition.value = LatLng(0.0, 0.0);
                selectedLatitute.value = result.geometry.location.lat;
                selectedLongitude.value = result.geometry.location.lng;
                address.value = result.formattedAddress ?? "";
                addressField.value.text = result.formattedAddress ?? "";
                print(initialPosition.value);
                print(selectedLongitude.value);
                var _marker = Marker(
                    consumeTapEvents: true,
                    markerId: MarkerId('selected-location'),
                    position: LatLng(result.geometry.location.lat,
                        result.geometry.location.lng),
                    onTap: () {
                      //do something here
                    });
                allMarkers.add(_marker);
              }
            },
          );
        },
      ),
    );
  }

  void addPackage(controller) async {
    var newPackage =
        await Get.to(() => AddPackagePage(addCampsitecontroller: controller));
    print(newPackage.name);
    packages.add(newPackage);
  }

  void updateInitialPosition() {
    initialPosition.value = LatLng(0.0, 0.0);
    print(initialPosition.value);
  }

  void onClickAddCampsite() async {
    await callAPIAddCampsite();
  }

  Future callAPIAddCampsite() async {
    String titlesString =
        multipleSelected.map((item) => item['title']).join(', ');

    // print(titles);
    List<File> selectedFiles = [];

    List<Map<String, dynamic>> packagesList = [];

    for (Package package in packages) {
      packagesList.add({
        "name": package.name,
        "price": package.price,
        "description": package.description,
        // Add other properties as needed
      });
    }

    for (var xFile in selectedImages!) {
      File file = File.fromUri(Uri.parse(xFile.path));
      selectedFiles.add(file);
    }
    Map<String, String> data = {
      "name": name.text.trim(),
      "phone_number": phoneNumber.text.trim(),
      "address": addressField.value.text.trim(),
      "description": description.text.trim(),
      "latitude": selectedLatitute.value.toString(),
      "longitude": selectedLongitude.value.toString(),
      "price": price.text.trim(),
      "facilities": titlesString,
      "packages": jsonEncode(packagesList),
    };
    print(data);
    try {
      var response = campsiteService.addCampsite(data, selectedFiles);
      await campsiteService.returnResponse(response, showOverlay: true,
          onSuccess: (jsonString) {
        navigatorPage();
      });
    } catch (e) {
      debugPrint('Login $e');
      showNotFoundDialog(title: Texts.texts.failToSave, middleText: '');
    }
  }

  void navigatorPage() {
    Get.back();
  }
}
