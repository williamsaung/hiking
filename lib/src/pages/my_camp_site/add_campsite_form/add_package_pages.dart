import 'package:flutter/material.dart';

import '../../../configs/export_config.dart';
import 'add_campsite_form_ctrl.dart';
import 'add_package_ctrl.dart';

class AddPackagePage extends StatelessWidget {
  final AddCampsiteFormPageController addCampsitecontroller; // Add this line

  // Modify the constructor
  AddPackagePage({required this.addCampsitecontroller});

  final AddPackagePageController controller =
      Get.put(AddPackagePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Package'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.name,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Package Name',
              ),
            ),
            TextFormField(
              controller: controller.price,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Package Price',
              ),
            ),
            TextFormField(
              controller: controller.description,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Package Description',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.addPackage();
                // Add logic to handle adding package
              },
              child: const Text('Add Package'),
            ),
          ],
        ),
      ),
    );
  }
}
