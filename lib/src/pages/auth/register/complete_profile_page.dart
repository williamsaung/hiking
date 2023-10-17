import 'package:hiking/src/widgets/export_widgets.dart';

import '../../../configs/export_config.dart';
import 'complete_profile_ctrl.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  late CompleteProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CompleteProfileController(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        context,
        mainText: "Complete your profile",
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 40, right: 40, top: MediaQuery.of(context).size.height / 4),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(15),
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align children vertically
              children: [
                Transform.translate(
                  offset:
                      Offset(0, 10), // Move the "+66" text 19 pixels downward
                  child: Text(
                    "+66", // Default phone number prefix
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 8), // Add some spacing
                Expanded(
                  child: textFieldWithLabel(
                    Texts.texts.phoneNumber,
                    controller.phoneNumber,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            // textFieldWithLabel(Texts.texts.phoneNumber, controller.phoneNumber,
            //     keyboardType: TextInputType.number),
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: () {
                controller.callsendOTPAPI();
              },
            ),
          ],
        ),
      ),
    );
  }
}
