import 'package:flutter/material.dart';
import 'package:get/get.dart';

showNotFoundDialog({
  required String title,
  required String middleText,
}) {
  Get.defaultDialog(
    title: title,
    middleText: middleText,
    titlePadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    backgroundColor: Colors.white,
    titleStyle: const TextStyle(color: Colors.black),
    middleTextStyle: const TextStyle(color: Colors.black),
  );
}

showErrSnackBar({
  required String errText,
  required String message,
}) {
  Get.snackbar(errText, message,
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
}
