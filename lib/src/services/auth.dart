import '../configs/export_config.dart';
import '../constants/export_constants.dart';
import '../widgets/export_widgets.dart';
import 'package:http/http.dart' as http;

import 'http.dart';

class AuthenticationService extends HttpService {
  Future<http.Response> sendOTP(Object data) async {
    try {
      var httpRequest =
          makeRequest(RequestMethod.post, ApiUrl.sendOTP, data: data);
      return httpRequest;
    } catch (e) {
      debugPrint("Auth Error: $e");
      rethrow;
    }
  }

  Future<http.Response> verifyPhone(Object data) async {
    try {
      var httpRequest =
          makeRequest(RequestMethod.post, ApiUrl.verifyPhone, data: data);
      return httpRequest;
    } catch (e) {
      debugPrint("Auth Error: $e");
      rethrow;
    }
  }

  Future<http.Response> verifyEmail(Object data) async {
    try {
      var httpRequest =
          makeRequest(RequestMethod.post, ApiUrl.verifyEmail, data: data);
      return httpRequest;
    } catch (e) {
      debugPrint("Auth Error: $e");
      rethrow;
    }
  }

  Future<http.Response> registerUser(Object data) async {
    try {
      var httpRequest =
          makeRequest(RequestMethod.post, ApiUrl.registerUser, data: data);
      return httpRequest;
    } catch (e) {
      debugPrint("Auth Error: $e");
      rethrow;
    }
  }

  Future<http.Response> tokenAuth(Object data) async {
    try {
      var httpRequest =
          makeRequest(RequestMethod.post, ApiUrl.tokenAuth, data: data);
      return httpRequest;
    } catch (e) {
      debugPrint("Login Error: $e");
      rethrow;
    }
  }
}
