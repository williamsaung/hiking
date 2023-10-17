import '../../configs/export_config.dart';
import '../export_widgets.dart';

Widget text(String text,
    {Color color = AppTheme.black,
    double? fontSize,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration decoration = TextDecoration.none,
    TextAlign textAlign = TextAlign.left,
    int? maxLine,
    TextOverflow? overflow,
    FontStyle? fontStyle,
    String? fontFamily,
    double? height}) {
  return Text(text,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
          fontSize: fontSize ?? AppFontSize.mediumM,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          height: height));
}

TextSpan textSpanCustom(String text,
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextSpan(
      text: text,
      style: TextStyle(
          color: color ?? AppTheme.black,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontFamily: UserConfig.font,
          fontSize: fontSize ?? AppFontSize.mediumM));
}

Widget textAutoSizeII(String text,
    {Color color = AppTheme.black,
    double? fontSize,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration decoration = TextDecoration.none,
    TextAlign textAlign = TextAlign.left,
    int? maxLine}) {
  return AutoSizeText(text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
          decoration: decoration,
          color: color,
          fontSize: fontSize ?? AppFontSize.mediumM,
          fontWeight: fontWeight));
}
