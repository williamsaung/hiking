import '../configs/export_config.dart';

class TextFormatUtil {
  static var textFormat = TextFormatUtil();

  String formatCurrentDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String formatPrice(double? price) {
    if (price != null) {
      return NumberFormat.simpleCurrency(locale: 'ja', decimalDigits: 0)
          .format(price);
    } else {
      return '¥ 0';
    }
  }

  String formatNumber(int number) {
    NumberFormat formatter = NumberFormat.decimalPattern('hi');
    return formatter.format(number).toString();
  }
}
