import '../../configs/export_config.dart';
import '../export_widgets.dart';

Widget roundButton(String title,
    {Color buttonColor = AppTheme.blue,
    required void Function()? onPressed,
    double? fontSize,
    Color textColor = AppTheme.white,
    bool? side = false,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    FontWeight? fontWeight}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: buttonColor,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
          side: side != false
              ? BorderSide(color: borderColor ?? textColor, width: 1)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0),
          ),
          minimumSize: const Size(
              double.maxFinite, 45) // put the width and height you want
          ),
      onPressed: onPressed,
      child: text(title,
          color: onPressed == null ? AppTheme.grey : textColor,
          fontSize: fontSize ?? AppFontSize.mediumM,
          fontWeight: fontWeight ?? FontWeight.bold,
          textAlign: TextAlign.center));
}

Widget roundButtonWithFrontIcon(String title,
    {Color buttonColor = AppTheme.blue,
    required void Function()? onPressed,
    required double fontSize,
    Color textColor = AppTheme.white,
    bool? side = false,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Widget? icon,
    Widget? frontIcon}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: buttonColor,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
          side: side != false
              ? BorderSide(color: borderColor ?? textColor, width: 1)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0),
          ),
          minimumSize: const Size(double.maxFinite, 45)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          frontIcon ?? Container(),
          text(title,
              color: onPressed == null ? AppTheme.grey : textColor,
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.bold,
              textAlign: textAlign ?? TextAlign.center),
          const Spacer(),
          icon ?? Container()
        ],
      ));
}

Widget roundButtonWithIcon(String title,
    {Color buttonColor = AppTheme.blue,
    required void Function() onPressed,
    double? fontSize,
    required Icon icon,
    Color textColor = AppTheme.white,
    Color? borderColor,
    double? fixTextSize}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: buttonColor,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(double.maxFinite, 45),
        side: borderColor != null
            ? BorderSide(color: borderColor, width: 1)
            : null, // put the width and height you want
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          horizontalSpace(5),
          fixTextSize != null
              ? SizedBox(
                  width: fixTextSize,
                  child: textAutoSizeII(title,
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold),
                )
              : text(title,
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
        ],
      ));
}

Widget elevatedButtonCustom(
    {void Function()? onPressed, Widget? child, Color color = AppTheme.white}) {
  return SizedBox(
    width: 80.w,
    height: 6.h,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: color,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            disabledForegroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: child),
  );
}

Widget roundElevatedButton(
    {void Function()? onPressed,
    Widget? child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0)}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadowStyles.addShadow,
      ],
    ),
    child: elevatedButtonCustom(
        onPressed: onPressed,
        child: Padding(
          padding: padding,
          child: child,
        )),
  );
}

Widget radioButtonCustom(dynamic value, dynamic groupValue,
    {required void Function(dynamic)? onChanged}) {
  return SizedBox(
      width: 30,
      height: 30,
      child: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: AppTheme.blue,
      ));
}

class RoundButtonWithIconAndCount extends StatelessWidget {
  final String title;
  final String? count;
  final Color? buttonColor;
  final void Function()? onPressed;
  final double? fontSize;
  final Icon icon;
  final Color? textColor;
  final Color? borderColor;
  const RoundButtonWithIconAndCount(
      {Key? key,
      required this.title,
      this.count,
      this.buttonColor,
      this.onPressed,
      this.fontSize,
      required this.icon,
      this.textColor,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: buttonColor ?? AppTheme.blue,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: const Size(double.maxFinite, 45),
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: 1)
              : null, // put the width and height you want
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              text(title,
                  color: textColor ?? AppTheme.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
              count != null
                  ? text(count!,
                      color: textColor ?? AppTheme.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold)
                  : Container()
            ],
          ),
        ));
  }
}

Widget twoLongButton(
  BuildContext context, {
  String leftText = '',
  String rightText = '',
  Function? leftFunction,
  Function? rightFunction,
}) {
  return Expanded(
    child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: SizedBox(
          width: double.infinity,
          height: 6.h,
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 5.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.orange,
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        leftFunction != null ? leftFunction() : Container();
                      },
                      child: Text(
                        leftText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(14),
                Expanded(
                  child: SizedBox(
                    height: 5.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.orange,
                      ),
                      onPressed: () {
                        rightFunction != null ? rightFunction() : Container();
                      },
                      child: Text(
                        rightText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget cartTwoLongButton(
  BuildContext context, {
  String leftText = '',
  String rightText = '',
  Function? leftFunction,
  Function? rightFunction,
}) {
  return Expanded(
    child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 5.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.orange,
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        leftFunction != null ? leftFunction() : Container();
                      },
                      child: Text(
                        leftText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(14),
                Expanded(
                  child: SizedBox(
                    height: 5.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.orange,
                      ),
                      onPressed: () {
                        rightFunction != null ? rightFunction() : Container();
                      },
                      child: Text(
                        rightText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
