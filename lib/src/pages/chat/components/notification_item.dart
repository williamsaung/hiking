import 'package:flutter/material.dart';

import '../../../constants/export_constants.dart';
import '../../../models/export_models.dart';

class NotificationItem extends StatelessWidget {
  final bool isEnabled;
  final Booking booking;
  const NotificationItem(
      {super.key, this.isEnabled = true, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.4,
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              // Checkbox(value: false, onChanged: (value) {}),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    color: Colors.lightBlue,
                    child: Image.network(
                      booking.thumbnail_image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Booking ID: ${booking.booking_number ?? booking.id}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF2E7),
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${BookingStatusExtension.fromInt(booking.status).text}',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Text(
                      'Price: ${booking.price.toString()}',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Checkin date: ${booking.check_in}',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      'Checkout date: ${booking.check_out}',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
