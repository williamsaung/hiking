import 'package:flutter/material.dart';

import '../../../configs/export_config.dart';
import 'add_payment_form_ctrl.dart';

class AddPaymentFormPage extends StatelessWidget {
  final AddPaymentFormPageController controller =
      Get.put(AddPaymentFormPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiration Date (MM/YY)',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
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
