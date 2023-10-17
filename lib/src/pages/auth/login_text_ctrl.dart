import 'package:hiking/src/configs/export_config.dart';
import '../../constants/export_constants.dart';
import '../../widgets/export_widgets.dart';

class LoginTextController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final validations = <String>[].obs;

  bool? isValidEmail() {
    return validations.isEmpty ? null : isValidField(0);
  }

  bool? isValidPassword() {
    return validations.isEmpty ? null : isValidField(1);
  }

  bool isValidField(int index) {
    if (validations.isNotEmpty) {
      return validations[index].isEmptyString() ? true : false;
    } else {
      return true;
    }
  }

  bool isDataValid() {
    validations.assignAll(['', '']);
    email.text.isEmptyString()
        ? setValidation(0, Keys.isRequired)
        : setValidation(0, '');
    password.text.isEmptyString()
        ? setValidation(1, Keys.isRequired)
        : setValidation(1, '');
    return validations.every((element) => element == '');
  }

  void setValidation(int index, String validationString) {
    validations[index] = validationString;
  }

  void dispose() {
    email.dispose();
    password.dispose();
  }
}
