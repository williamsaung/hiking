import '../../configs/export_config.dart';
import '../export_widgets.dart';

AppBar appBarCustom(
  BuildContext context, {
  String mainText = '',
  String subText = '',
  IconData? icon,
  Function? onTab,
  Color color = AppTheme.blue,
  bool backButtonExisted = true,
  List<Widget>? actionWidgets,
}) {
  return AppBar(
    centerTitle: true,
    leading: backButtonExisted
        ? GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 16,
                ),
                Text(
                  subText,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ))
        : null,
    automaticallyImplyLeading: false,
    title: Text(
      mainText,
      style: const TextStyle(fontSize: 18),
    ),
    backgroundColor: color,
    actions: actionWidgets,
  );
}

AppBar appBarCustomWithFunction(
  BuildContext context, {
  String mainText = '',
  String subText = '',
  IconData? icon,
  required VoidCallback onClick,
  Color color = AppTheme.blue_1,
  bool backButtonExisted = true,
  List<Widget>? actionWidgets,
}) {
  return AppBar(
    centerTitle: true,
    leading: backButtonExisted
        ? GestureDetector(
            onTap: () {
              onClick();
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 16,
                ),
                Text(
                  subText,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ))
        : null,
    automaticallyImplyLeading: false,
    title: Text(
      mainText,
      style: const TextStyle(fontSize: 18),
    ),
    backgroundColor: color,
    actions: actionWidgets,
  );
}
