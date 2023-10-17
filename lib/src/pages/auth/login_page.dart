import 'package:flutter/material.dart';
import '../../widgets/export_widgets.dart';
import '../../configs/export_config.dart';
import 'login_ctrl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(LoginController(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 40, right: 40, top: MediaQuery.of(context).size.height / 4),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(15),
            textFieldWithLabel(
                Texts.texts.email, controller.loginTextController.email,
                validate: controller.loginTextController.isValidEmail()),
            verticalSpace(20),
            textFieldWithLabel(
                Texts.texts.password, controller.loginTextController.password,
                validate: controller.loginTextController.isValidPassword()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("Login"),
                  onPressed: () {
                    controller.onClickLogin();
                    // TODO: Implement login logic
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  child: const Text("Register"),
                  onPressed: () {
                    controller.navigatorPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
