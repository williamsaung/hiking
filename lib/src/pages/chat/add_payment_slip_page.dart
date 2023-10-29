import 'package:flutter/material.dart';
import '../../configs/export_config.dart';
import '../../widgets/export_widgets.dart';
import 'add_payment_slip_page_ctrl.dart';

class AddPaymentSlipPage extends StatefulWidget {
  final int bookingID;

  const AddPaymentSlipPage({
    super.key,
    required this.bookingID,
  });

  @override
  State<AddPaymentSlipPage> createState() => _AddPaymentSlipPageState();
}

class _AddPaymentSlipPageState extends State<AddPaymentSlipPage> {
  late AddPaymentSlipPageController controller;

  @override
  void dispose() {
    Get.delete<AddPaymentSlipPageController>();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      AddPaymentSlipPageController(
        bookingID: widget.bookingID,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment Slip Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              child: Text('Select Payment Slip'),
              onPressed: () {
                controller.getImageFromGallery();
              },
            ),
            Obx(() {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: controller.selectedImagePath.value.isEmpty
                      ? Text('No Image selected')
                      : Image.file(File(controller.selectedImagePath.value)),
                ),
              );
            }),
            verticalSpace(15),
            ElevatedButton(
              child: const Text('Upload'),
              onPressed: () async {
                await controller.callAPIUploadSlip();
              },
            ),
          ],
        ),
      ),
    );
  }
}
