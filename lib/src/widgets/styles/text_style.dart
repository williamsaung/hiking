import '../../configs/export_config.dart';
import '../export_widgets.dart';

TextStyle textStyle({Color? color}) {
  return TextStyle(
      fontWeight: fontWeightNormal(), color: color ?? AppTheme.black);
}

FontWeight fontWeightNormal() {
  return FontWeight.w500;
}

TextStyle textStyleWithFont({Color? color}) {
  return TextStyle(
      fontWeight: fontWeightNormal(),
      color: color ?? AppTheme.black,
      fontFamily: "Prompt");
}
