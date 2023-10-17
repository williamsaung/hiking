import 'package:hiking/src/widgets/export_widgets.dart';

import '../../../configs/export_config.dart';
import 'phone_verification_ctrl.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  late PhoneVerificationController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(PhoneVerificationController(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        context,
        mainText: "Phone Verification",
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
                controller.callphoneVerifyAPI();
              },
            ),
          ],
        ),
      ),
    );
  }
}
