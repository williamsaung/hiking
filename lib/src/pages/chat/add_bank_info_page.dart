import 'package:flutter/material.dart';
import 'package:hiking/src/configs/export_config.dart';
import 'add_bank_info_page_ctrl.dart';

class AddBankInfoPage extends StatefulWidget {
  final int bookingID;

  const AddBankInfoPage({
    super.key,
    required this.bookingID,
  });

  @override
  State<AddBankInfoPage> createState() => _AddBankInfoPageState();
}

class _AddBankInfoPageState extends State<AddBankInfoPage> {
  late AddBankInfoPageController controller;

  @override
  void dispose() {
    Get.delete<AddBankInfoPageController>();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      AddBankInfoPageController(
        bookingID: widget.bookingID,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.bankNumber,
              decoration: InputDecoration(
                labelText: 'Bank Number',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: controller.bankName,
              decoration: InputDecoration(
                labelText: 'Bank Name',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                await controller.submitBankInfo();
                // Add logic to process credit card information
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
