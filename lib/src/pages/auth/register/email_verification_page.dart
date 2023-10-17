import 'package:hiking/src/widgets/export_widgets.dart';

import '../../../configs/export_config.dart';
import 'email_verification_ctrl.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  late EmailVerificationController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(EmailVerificationController(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        context,
        mainText: "Email Verification",
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
                Texts.texts.verificationNumber, controller.verificationNumber),
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: () {
                controller.callemailVerifyAPI();
              },
            ),
          ],
        ),
      ),
    );
  }
}
