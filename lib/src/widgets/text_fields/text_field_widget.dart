import '../export_widgets.dart';
import '../../configs/export_config.dart';
import 'package:flutter/services.dart';

Widget textFieldWithLabel(String title, TextEditingController controller,
    {bool obscureText = false,
    Function(String)? onChanged,
    Widget? textWidget,
    TextInputType? keyboardType,
    Widget? icon,
    int? maxLength,
    bool? validate,
    bool addPadding = false,
    Color colorsTitle = AppTheme.black}) {
  return Padding(
    padding: EdgeInsets.only(top: addPadding ? 15 : 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget ??
            text(title, color: colorsTitle, fontSize: AppFontSize.mediumS),
        verticalSpace(10),
        SizedBox(
          height: 50,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: obscureText,
            maxLength: maxLength,
            style: TextStyle(fontWeight: fontWeightNormal()),
            decoration: InputDecoration(
              fillColor: AppTheme.grey,
              filled: true,
              counterText: "",
              errorText: validate == false ? "" : null,
              errorStyle: const TextStyle(height: 0),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: AppTheme.grey_3, width: 1.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: AppTheme.greyBorder, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: AppTheme.red, width: 1.0),
              ),
              suffixIcon: icon,
            ),
          ),
        ),
        verticalSpace(5),
        validate == false
            ? text("${Texts.texts.plsEnter} ${title.toLowerCase()}",
                color: AppTheme.red, fontSize: AppFontSize.mediumS)
            : Container(),
      ],
    ),
  );
}

Widget textFieldBox(String title,
    {TextEditingController? controller,
    List<TextInputFormatter>? inputFormatters,
    void Function(String)? onChanged}) {
  return Container(
    width: 100,
    height: 55,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: AppTheme.blue_3,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.greyBorder, width: 1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(title, fontSize: AppFontSize.mediumS, color: AppTheme.greyText),
        TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: AppFontSize.mediumM,
            ),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
            inputFormatters: inputFormatters)
      ],
    ),
  );
}

Widget textFormFieldWithHintText({
  required String hintText,
  required TextEditingController? controller,
  required TextInputType keyboardType,
  void Function(String)? onChanged,
  void Function()? onEditingComplete,
  void Function(String)? onSaved,
  String? Function(String?)? validation,
  bool? readonly,
}) {
  return TextFormField(
    key: Key(hintText),
    readOnly: readonly ?? false,
    controller: controller,
    onChanged: onChanged,
    keyboardType: keyboardType,
    onEditingComplete: onEditingComplete,
    onFieldSubmitted: onSaved,
    validator: validation,
    autovalidateMode: AutovalidateMode.always,
    decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black))),
  );
}
