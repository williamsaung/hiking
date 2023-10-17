import 'package:flutter/material.dart';
import '../../configs/export_config.dart';
import 'profile_page_ctrl.dart'; // Don't forget to import material.dart

class profilePage extends StatelessWidget {
  final ProfilePageController controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            // Profile Picture
            CircleAvatar(
              radius: 50, // Adjust the size as needed
              backgroundImage: NetworkImage(
                  'https://ichef.bbci.co.uk/news/976/cpsprodpb/16620/production/_91408619_55df76d5-2245-41c1-8031-07a4da3f313f.jpg'), // Replace with your actual image URL
            ),
            SizedBox(height: 20),
            // Name
            Text(
              'Welcome Wai Yan Aung',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
                height:
                    20), // Add some space between the profile picture and the buttons
            // List of buttons
            ListTile(
              title: Text('Edit Profile'),
              leading: Icon(Icons.edit),
              onTap: () {
                // Add functionality for edit profile
              },
            ),
            ListTile(
              title: Text('Switch to Campsite Owner'),
              leading: Icon(Icons.switch_account),
              onTap: () {
                controller.switchToCampsiteOwner();
                // Add functionality for edit profile
              },
            ),
            ListTile(
              title: Text('Payment Information'),
              leading: Icon(Icons.payment),
              onTap: () {
                // Add functionality for payment information
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                // Add functionality for logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
