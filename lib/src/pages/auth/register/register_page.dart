import 'package:hiking/src/widgets/export_widgets.dart';

import '../../../configs/export_config.dart';
import 'register_ctrl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(RegisterController(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        context,
        mainText: "Register",
        subText: "Back",
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 40, right: 40, top: MediaQuery.of(context).size.height / 4),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(15),
            textFieldWithLabel(
                Texts.texts.name, controller.reigsterTextController.name,
                validate: controller.reigsterTextController.isValidName()),
            verticalSpace(20),
            textFieldWithLabel(
                Texts.texts.email, controller.reigsterTextController.email,
                validate: controller.reigsterTextController.isValidEmail()),
            verticalSpace(20),
            textFieldWithLabel(Texts.texts.password,
                controller.reigsterTextController.password,
                validate: controller.reigsterTextController.isValidPassword()),
            ElevatedButton(
              child: const Text("Register User"),
              onPressed: () {
                controller.onClickRegister();
              },
            ),
          ],
        ),
      ),
    );
  }
}
