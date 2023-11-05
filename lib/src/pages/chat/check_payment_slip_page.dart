import 'package:flutter/material.dart';
import 'package:hiking/src/pages/chat/check_payment_slip_page_ctrl.dart';
import '../../configs/export_config.dart';
import '../../widgets/export_widgets.dart';
import 'add_payment_slip_page_ctrl.dart';

class CheckPaymentSlipPage extends StatefulWidget {
  final String paymentSlip;

  const CheckPaymentSlipPage({
    super.key,
    required this.paymentSlip,
  });

  @override
  State<CheckPaymentSlipPage> createState() => _CheckPaymentSlipPageState();
}

class _CheckPaymentSlipPageState extends State<CheckPaymentSlipPage> {
  late CheckPaymentSlipPageController controller;

  @override
  void dispose() {
    Get.delete<CheckPaymentSlipPageController>();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      CheckPaymentSlipPageController(
        paymentSlip: widget.paymentSlip,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Payment Slip Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(15),
            // show bank name and bank number
            Container(
              foregroundDecoration: BoxDecoration(
                color: Colors.black26,
                image: DecorationImage(
                    image: NetworkImage(controller.paymentSlip),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 500,
            ),
            verticalSpace(15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor:
                    Colors.blue, // You can change the color for Button 2
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
              ),
              child: const Text(
                "Approve",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                print('haha');
                // controller.goBook();
                // Add your onPressed logic for Button 2
              },
            )
          ],
        ),
      ),
    );
  }
}
