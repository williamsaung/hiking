import 'dart:convert';
import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../configs/export_config.dart';
import '../constants/export_constants.dart';
import '../models/export_models.dart';
import '../widgets/export_widgets.dart';

class HttpService {
  Duration timeOut = const Duration(seconds: 120);
  Duration timeOutFileUpload = const Duration(seconds: 240);
  final client = http.Client();

  void close() {
    debugPrint("Close Request");
    client.close();
  }

  Map<String, String> get headers {
    var header = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    if (UserConfig.session != null) {
      header.addAll({
        'Authorization': 'Bearer ${UserConfig.session!.token}',
      });
    }
    debugPrint("header: $header");
    return header;
  }

  // Future<void> refreshSession() async {
  //   try {
  //     Object data = {"refresh": UserConfig.session!.token};
  //     String body = jsonEncode(data);
  //     Uri uri = checkEnvironment(url: ApiUrl.tokenRefresh);

  //     var response = await client
  //         .post(uri,
  //             headers: {'Content-type': 'application/json; charset=UTF-8'},
  //             body: body)
  //         .timeout(timeOut);
  //     var jsonString = jsonDecode(utf8.decode(response.bodyBytes));
  //     if (response.statusCode == 200) {
  //       TokenRefreshModel newToken = TokenRefreshModel.fromJson(jsonString);
  //       UserConfig.session!.token = newToken.access;
  //       SharedPreferencesUtil.setTokenAuth(UserConfig.session!);
  //     } else {
  //       throw jsonString;
  //     }
  //   } catch (e) {
  //     debugPrint("refreshSession error: $e");
  //     rethrow;
  //   }
  // }

  Future<http.Response> makeRequest(RequestMethod method, String url,
      {Object? data,
      bool isMocki = false,
      Map<String, dynamic>? queryParameters}) async {
    Uri uri = checkEnvironment(
        url: url, queryParameters: queryParameters, isMocki: isMocki);
    String body = jsonEncode(data);
    late Future<http.Response> httpRequest;

    try {
      switch (method) {
        case RequestMethod.get:
          httpRequest = client.get(uri, headers: headers).timeout(timeOut);
          break;
        case RequestMethod.post:
          httpRequest =
              client.post(uri, headers: headers, body: body).timeout(timeOut);
          break;
        case RequestMethod.patch:
          httpRequest =
              client.patch(uri, headers: headers, body: body).timeout(timeOut);
          break;
        case RequestMethod.put:
          httpRequest =
              client.put(uri, headers: headers, body: body).timeout(timeOut);
          break;
        case RequestMethod.delete:
          httpRequest = client.delete(uri, headers: headers).timeout(timeOut);
          break;
        default:
          httpRequest = client
              .get(uri, headers: headers)
              .timeout(const Duration(seconds: 120));
          break;
      }
      debugPrint("url: $uri");
      log("body: $body");
      return httpRequest;
    } catch (e) {
      debugPrint("makeRequest: $e");
      throw e.toString();
    }
  }

  Future<http.Response> makeRequestWithFile(RequestMethod method, String url,
      {required Map<String, String>? data,
      required List<File>? fileList,
      required String fileKey,
      bool isMocki = false,
      Map<String, dynamic>? queryParameters}) async {
    Uri uri = checkEnvironment(url: url, queryParameters: queryParameters);
    String body = jsonEncode(data);
    late Future<http.Response> httpRequest;

    try {
      var request = method == RequestMethod.post
          ? http.MultipartRequest("POST", uri)
          : http.MultipartRequest("PATCH", uri);
      request.fields.addAll(data as Map<String, String>);
      if (fileList!.isNotEmpty) {
        await Future.forEach(fileList, (File element) async {
          debugPrint("file - > ${element.path}");
          request.files
              .add(await http.MultipartFile.fromPath(fileKey, element.path));
        });
      }
      request.headers.addAll(headers);
      var streamRequest = await request.send().timeout(timeOutFileUpload);
      debugPrint("request: ${request.fields} ${request.files}");
      httpRequest = http.Response.fromStream(streamRequest);
      debugPrint("body: $body");
      return httpRequest;
    } catch (e) {
      debugPrint("makeRequest: $e");
      throw e.toString();
    }
  }

  String errorStatus(int resCode, String? text) {
    return kDebugMode
        ? "StatusCode: $resCode\n${text ?? defaultText(resCode)}"
        : "Error: ${text ?? defaultText(resCode)}";
  }

  String defaultText(int statusCode) {
    switch (statusCode) {
      case 200:
        return 'The request has been received.';

      case 201:
        return 'The request has been created.';

      case 202:
        return 'The request has been accepted.';

      case 204:
        return 'The response had no content.';

      case 400:
        return 'The request has an invalid format.';

      case 401:
        return 'Not found user please check your username and password.';

      case 403:
        return 'You don\'t have permission to do this.';

      case 404:
        return 'The entity of you request is not found.';

      case 409:
        return 'There is a conflicting request.';

      default:
        return 'Server error.';
    }
  }

  Uri checkEnvironment(
      {required String url,
      bool isMocki = false,
      Map<String, dynamic>? queryParameters}) {
    final baseUrl = Environments.getBaseUrl();
    switch (Environments.getEnvironment) {
      case Environment.local:
        return Uri.http(
            baseUrl,
            (isMocki ? ApiUrl.backendMocki : ApiUrl.backend) + url,
            queryParameters);
      case Environment.dev:
        return Uri.https(
            baseUrl,
            (isMocki ? ApiUrl.backendMocki : ApiUrl.backend) + url,
            queryParameters);
      case Environment.uat:
        return Uri.https(
            baseUrl,
            (isMocki ? ApiUrl.backendMocki : ApiUrl.backend) + url,
            queryParameters);
      case Environment.prod:
        return Uri.https(
            baseUrl,
            (isMocki ? ApiUrl.backendMocki : ApiUrl.backend) + url,
            queryParameters);
      default:
        return Uri.https(
            baseUrl,
            (isMocki ? ApiUrl.backendMocki : ApiUrl.backend) + url,
            queryParameters);
    }
  }

  Future<void> returnResponse(
    Future<http.Response> httpRequest, {
    bool showDialog = false,
    bool showOverlay = false,
    void Function(dynamic json)? onSuccess,
    void Function(ErrorResponseData errorResponseData)? onUnsuccess,
    void Function()? onPressedSuccess,
    void Function()? onPressedUnsuccess,
  }) async {
    try {
      showOverlay ? LoadingCustom.showOverlay() : null;
      var response = await httpRequest;
      showOverlay ? LoadingCustom.hideOverlay() : null;

      debugPrint("resCode: ${response.statusCode}");
      debugPrint("response: ${utf8.decode(response.bodyBytes)}");

      if ([200, 201, 204].contains(response.statusCode)) {
        if (response.bodyBytes.isNotEmpty) {
          var jsonString = jsonDecode(utf8.decode(response.bodyBytes));
          onSuccess?.call(jsonString);
        } else {
          onSuccess?.call(null);
        }
        showDialog
            ? DialogCustom.showBasicAlertSuccess(onPressed: onPressedSuccess)
            : null;
      } else {
        String textError = "";
        DetailModel detailModel = DetailModel(detail: "", code: "");
        try {
          var jsonString = jsonDecode(utf8.decode(response.bodyBytes));
          detailModel = DetailModel.fromJson(jsonString);
          textError = errorStatus(response.statusCode, detailModel.detail);
        } catch (e) {
          try {
            textError = errorStatus(response.statusCode, response.reasonPhrase);
          } catch (e) {
            textError = errorStatus(response.statusCode, null);
          }
        }
        detailModel.detail = textError;
        debugPrint("textError: $textError");

        ErrorResponseData errorResponseData = ErrorResponseData(
            resCode: response.statusCode, detailModel: detailModel);
        onUnsuccess?.call(errorResponseData);
        throw detailModel.detail ?? '';
      }
    } catch (e, stacktrace) {
      showOverlay ? LoadingCustom.hideOverlay() : null;
      if (e is SocketException) {
        debugPrint("SocketException: $e");
        showDialog
            ? DialogCustom.showBasicAlertUnsuccess(e.toString(),
                onPressed: onPressedUnsuccess)
            : null;
        rethrow;
      } else if (e is TimeoutException) {
        debugPrint("TimeOutException: $e");
        showDialog
            ? DialogCustom.showBasicAlertUnsuccess(e.toString(),
                onPressed: onPressedUnsuccess)
            : null;
        rethrow;
      } else {
        debugPrint("Error: $e $stacktrace");
        showDialog
            ? DialogCustom.showBasicAlertUnsuccess(e.toString(),
                onPressed: onPressedUnsuccess)
            : null;
        rethrow;
      }
    }
  }

  void showSuccessDialog() {
    DialogCustom.showBasicAlertSuccess();
  }

  void showUnsuccessDialog(String errorText) {
    DialogCustom.showBasicAlertUnsuccess(errorText);
  }
}

class DataPagination {
  dynamic data;
  bool hasMore;
  DataPagination({required this.data, required this.hasMore});
}

class ErrorResponseData {
  int resCode;
  DetailModel detailModel;
  ErrorResponseData({required this.resCode, required this.detailModel});
}
