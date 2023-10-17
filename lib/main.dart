import 'package:flutter/material.dart';
import 'package:hiking/src/configs/export_config.dart';
import 'package:hiking/src/constants/export_constants.dart';
import 'src/app.dart';
import 'src/pages/auth/export_auth.dart';

void main() {
  Environments.setEnvironment(Environment.local);
  runApp(App());
}
