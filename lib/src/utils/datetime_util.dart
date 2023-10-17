import '../configs/export_config.dart';
import '../widgets/http_widgets/httpErrWidget.dart';

bool validateDateTimeRange({
  required String from,
  required String to,
}) {
  if (from.isEmpty || to.isEmpty) {
    return true;
  }
  DateTime fromDate = from.strToDate();
  DateTime toDate = to.strToDate();
  if (toDate.isBefore(fromDate) || fromDate.isAfter(toDate)) {
    showNotFoundDialog(title: Texts.texts.incorrectDatePicked, middleText: '');
    return false;
  } else {
    return true;
  }
}

extension ToDate on DateTime {
  String toStringDate({String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(this);
  }
}

extension StringExtension on String {
  DateTime strToDate({String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).parse(this);
  }

  String stringDateToDateTime(
      {String format = 'yyyy-MM-ddTHH:mm:ss', bool isEndTime = false}) {
    DateTime dateTime = DateTime.parse(this);
    return isEndTime
        ? DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 0)
            .toIso8601String()
        : dateTime.toIso8601String();
  }
}
