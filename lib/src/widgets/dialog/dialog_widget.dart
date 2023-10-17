import '../../configs/export_config.dart';
import '../export_widgets.dart';

class DialogCustom {
  static showBasicAlert(String message,
      {String? title,
      bool dismissible = false,
      void Function()? onPressed}) async {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: text(title ?? Texts.texts.alert,
              fontSize: AppFontSize.mediumL, maxLine: 1),
          content: text(message, fontSize: AppFontSize.mediumS, maxLine: 4),
          actions: <Widget>[
            Center(
              child: Container(
                height: 45,
                width: 120,
                padding: const EdgeInsets.only(bottom: 10),
                child: roundButton(Texts.texts.ok,
                    fontSize: AppFontSize.mediumM, onPressed: () {
                  Get.back();
                  if (onPressed != null) {
                    onPressed();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void showBasicAlertSuccess(
      {void Function()? onPressed, String? text}) async {
    DialogCustom.showBasicAlertWithIcon(text ?? Texts.texts.saveSuccess,
        onPressed: () {
      Get.back();
      onPressed?.call();
    });
  }

  static void showBasicAlertUnsuccess(String errorText,
      {void Function()? onPressed, bool showUnsuccess = false}) async {
    DialogCustom.showBasicAlertWithIcon(
        showUnsuccess ? Texts.texts.saveUnsuccess : Texts.texts.error,
        onPressed: () {
      Get.back();
      onPressed?.call();
    }, errorText: errorText);
  }

  static showBasicAlertWithIcon(String message,
      {String? title,
      String? errorText,
      bool dismissible = false,
      void Function()? onPressed}) async {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: text(title ?? Texts.texts.alert,
              fontSize: AppFontSize.mediumL, maxLine: 1),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  errorText == null
                      ? const Icon(
                          Icons.check_circle,
                          color: AppTheme.green,
                        )
                      : const Icon(
                          Icons.cancel,
                          color: AppTheme.red,
                        ),
                  horizontalSpace(5),
                  text(message, fontSize: AppFontSize.mediumS, maxLine: 4),
                ],
              ),
              verticalSpace(5),
              errorText != null
                  ? text(errorText, fontSize: AppFontSize.mediumS, maxLine: 4)
                  : Container()
            ],
          ),
          actions: <Widget>[
            Center(
              child: Container(
                height: 45,
                width: 120,
                padding: const EdgeInsets.only(bottom: 10),
                child: roundButton(Texts.texts.ok,
                    fontSize: AppFontSize.mediumM, onPressed: () {
                  Get.back();
                  if (onPressed != null) {
                    onPressed();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static showBasicAlertOkCancel(String message,
      {String? title,
      bool dismissible = false,
      String? textButton,
      void Function()? onPressed,
      void Function()? onBackPressed}) async {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: text(title ?? Texts.texts.alert,
              fontSize: AppFontSize.mediumL, maxLine: 1),
          content: text(message, fontSize: AppFontSize.mediumS, maxLine: 4),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 120,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: roundButton(Texts.texts.cancel,
                      side: true,
                      fontSize: AppFontSize.mediumM,
                      buttonColor: AppTheme.white,
                      textColor: AppTheme.blue,
                      onPressed: onBackPressed ??
                          () {
                            Get.back();
                          }),
                ),
                horizontalSpace(20),
                Container(
                  height: 45,
                  width: 120,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: roundButton(textButton ?? Texts.texts.ok,
                      fontSize: AppFontSize.mediumM,
                      onPressed: onPressed ??
                          () {
                            Get.back();
                          }),
                ),
              ],
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static showBasicAlertWithTextFeild(
      String title, TextEditingController controller,
      {bool dismissible = false,
      required void Function() onPressed,
      void Function()? onPressedBack,
      String? text1,
      String? text2,
      Color? text1ButtonColor,
      Color? text1Color,
      bool showTextBox = true,
      String title2 = '',
      String title3 = ''}) async {
    double top = (showTextBox == false) ? 30 : 0;
    double bottom = (showTextBox == false) ? 30 : 0;
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: Padding(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            child: RichText(
              maxLines: 3,
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                textSpanCustom(title,
                    fontSize: AppFontSize.mediumL, fontWeight: FontWeight.w500),
                textSpanCustom(title2, fontSize: AppFontSize.mediumL),
                textSpanCustom(title3,
                    fontSize: AppFontSize.mediumL, fontWeight: FontWeight.w500)
              ]),
            ),
          ),
          content:
              showTextBox ? textFieldBox('', controller: controller) : null,
          actionsPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          actions: <Widget>[
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: roundButton(text1 ?? Texts.texts.cancel,
                        side: true,
                        fontSize: AppFontSize.mediumM,
                        buttonColor: text1ButtonColor ?? AppTheme.white,
                        textColor: text1Color ?? AppTheme.blue, onPressed: () {
                      controller.clear();
                      Get.back();
                      if (onPressedBack != null) {
                        onPressedBack();
                      }
                    }),
                  ),
                  horizontalSpace(20),
                  Flexible(
                    flex: 1,
                    child: roundButton(text2 ?? Texts.texts.save,
                        fontSize: AppFontSize.mediumM,
                        onPressed: onPressed,
                        buttonColor: AppTheme.orange),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static showSnackBar({String? title, required String message}) {
    Get.snackbar("", "",
        titleText: text(
          title ?? Texts.texts.alert,
          fontSize: AppFontSize.mediumL,
        ),
        messageText:
            text(message, fontSize: AppFontSize.mediumM, color: AppTheme.red),
        backgroundColor: AppTheme.white);
  }

  static showBasicAlertCenterText(String message,
      {String? title,
      bool dismissible = false,
      void Function()? onPressed}) async {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: text(title ?? Texts.texts.alert,
              fontSize: AppFontSize.mediumL,
              maxLine: 3,
              textAlign: TextAlign.center),
          content: text(message,
              fontSize: AppFontSize.mediumS,
              maxLine: 4,
              textAlign: TextAlign.center),
          actions: <Widget>[
            Center(
              child: Container(
                height: 45,
                width: 120,
                padding: const EdgeInsets.only(bottom: 10),
                child: roundButton(Texts.texts.ok,
                    fontSize: AppFontSize.mediumM, onPressed: () {
                  Get.back();
                  if (onPressed != null) {
                    onPressed();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}

dialogWithTwoButtons(
    {required String title,
    // required String middleText,
    required Widget content,
    required String button1Text,
    required String button2Text,
    required Function button1Func,
    required Function button2Func,
    Color? button2Color,
    Color? button2TextColor}) {
  Get.defaultDialog(
    title: title,
    content: content,
    titlePadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
    backgroundColor: Colors.white,
    titleStyle: const TextStyle(color: Colors.black),
    middleTextStyle: const TextStyle(color: Colors.black),
    confirm: SizedBox(
      width: 120,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.orange, // Background color
          ),
          onPressed: () {
            button1Func();
          },
          child: Text(
            button1Text,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )),
    ),
    cancel: SizedBox(
      width: 120,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                button2Color ?? AppTheme.orange, // Background color
          ),
          onPressed: () {
            button2Func();
          },
          child: Text(
            button2Text,
            style: TextStyle(
                color: button2TextColor ?? Colors.white, fontSize: 12),
          )),
    ),
  );
}

class AlertPopUp {
  static showAlertIncorrectDate() {
    DialogCustom.showSnackBar(
        title: Texts.texts.alert, message: Texts.texts.plsSelectStartEndTime);
  }

  static showAlertIncorrecrtTime() {
    DialogCustom.showSnackBar(
        title: Texts.texts.alert, message: Texts.texts.incorrectDate);
  }
}
