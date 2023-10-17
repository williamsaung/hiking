import 'dart:ui';
import '../models/export_models.dart';
import 'export_config.dart';

class UserConfig {
  static TokenAuthModel? session;
  static DeviceType? deviceType;
  static Locale locale = const Locale('en', 'EN');
  static String font = prompt;

  static void clearData() {
    session = null;
  }
}
