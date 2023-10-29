import 'package:flutter/material.dart';
import 'package:hiking/src/configs/export_config.dart';

import 'add_bank_info_page_ctrl.dart';

class AddBankInfoPage extends StatelessWidget {
  final AddBankInfoPageController controller =
      Get.put(AddBankInfoPageController());

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
              decoration: InputDecoration(
                labelText: 'Bank Number',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Bank Name',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                await controller.navigateAfterBookingPage();
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
