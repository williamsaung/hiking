import '../configs/export_config.dart';
import '../constants/export_constants.dart';
import '../models/export_models.dart';
import 'dart:convert';

class SharedPreferencesUtil {
  static Future setTokenAuth(TokenAuthModel tokenAuthModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Keys.tokenAuth, jsonEncode(tokenAuthModel).encrypting());
  }
}
