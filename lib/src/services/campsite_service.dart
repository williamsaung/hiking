import '../configs/export_config.dart';
import '../constants/export_constants.dart';
import '../widgets/export_widgets.dart';
import 'export_services.dart';
import 'package:http/http.dart' as http;

class CampsiteService extends HttpService {
  Future<http.Response> addCampsite(
      Map<String, String> data, selectedImages) async {
    try {
      var httpRequest = makeRequestWithFile(RequestMethod.post, ApiUrl.campsite,
          data: data, fileList: selectedImages, fileKey: 'images');
      return httpRequest;
    } catch (e) {
      debugPrint("Save Error: $e");
      rethrow;
    }
  }

  Future<http.Response> getCampsiteList() async {
    try {
      var httpRequest = makeRequest(
        RequestMethod.get,
        ApiUrl.campsite,
      );
      return httpRequest;
    } catch (e) {
      debugPrint("Campsite Error: $e");
      rethrow;
    }
  }
}