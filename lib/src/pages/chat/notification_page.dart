import 'package:flutter/material.dart';
import 'package:hiking/src/pages/chat/components/notification_item.dart';
import '../../configs/export_config.dart';
import 'notification_page_ctrl.dart';

class NotificationPage extends StatelessWidget {
  final NotificationPageController controller =
      Get.put(NotificationPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification Page'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(height: 2);
                },
                itemBuilder: (context, index) {
                  return NotificationItem(
                    isEnabled: true,
                    booking: controller.bookingList[index],
                  );
                },
                itemCount: controller.bookingList.length,
              ),
            ),
          ),
        ]));
  }
}
