import 'package:hiking/src/configs/export_config.dart';
import '../../../constants/export_constants.dart';
import '../../../widgets/export_widgets.dart';

class RegisterTextController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final validations = <String>[].obs;

  bool? isValidEmail() {
    return validations.isEmpty ? null : isEmailValid();
  }

  bool? isValidPassword() {
    return validations.isEmpty ? null : isValidField(2);
  }

  bool? isValidName() {
    return validations.isEmpty ? null : isValidField(0);
  }

  bool isValidField(int index) {
    if (validations.isNotEmpty) {
      return validations[index].isEmptyString() ? true : false;
    } else {
      return true;
    }
  }

  bool isEmailValid() {
    // The regular expression to match a valid email address.
    final regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

    // Return true if the string matches the regular expression, false otherwise.
    return regex.hasMatch(email.text);
  }

  bool isDataValid() {
    validations.assignAll(['', '', '']);
    email.text.isEmptyString()
        ? setValidation(1, Keys.isRequired)
        : setValidation(1, '');
    password.text.isEmptyString()
        ? setValidation(2, Keys.isRequired)
        : setValidation(2, '');
    name.text.isEmptyString()
        ? setValidation(0, Keys.isRequired)
        : setValidation(0, '');
    return validations.every((element) => element == '');
  }

  void setValidation(int index, String validationString) {
    validations[index] = validationString;
  }

  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
  }
}
