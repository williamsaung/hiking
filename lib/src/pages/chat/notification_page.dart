import 'package:flutter/material.dart';
import 'package:hiking/src/pages/chat/components/notification_item.dart';
import '../../configs/export_config.dart';
import 'notification_page_ctrl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
  });

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
                  return GestureDetector(
                    onTap: () {
                      if (controller.userId !=
                              controller.bookingList[index].created_user_id! &&
                          controller.bookingList[index].status == 2) {
                        controller.checkPaymentSlip(
                            controller.bookingList[index].payment_slip!,
                            controller.bookingList[index].id!);
                      } else if (controller.userId !=
                              controller.bookingList[index].created_user_id! &&
                          controller.bookingList[index].status != 3) {
                        controller
                            .addBankInfo(controller.bookingList[index].id!);
                      } else if (controller.userId ==
                              controller.bookingList[index].created_user_id! &&
                          controller.bookingList[index].status == 1) {
                        controller.addPaymentSlip(
                            controller.bookingList[index].id!,
                            controller.bookingList[index].bank_name!,
                            controller.bookingList[index].bank_number!);
                      } else if (controller.userId ==
                          controller.bookingList[index].created_user_id!) {
                        controller
                            .seeBookingDetails(controller.bookingList[index]);
                      }
                    },
                    child: NotificationItem(
                      isEnabled: true,
                      booking: controller.bookingList[index],
                    ),
                  );
                },
                itemCount: controller.bookingList.length,
              ),
            ),
          ),
        ]));
  }
}
