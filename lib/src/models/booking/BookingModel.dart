import 'package:json_annotation/json_annotation.dart';
import '../../constants/export_constants.dart';
part 'BookingModel.g.dart';

@JsonSerializable()
class Booking {
  int? id;
  String check_in;
  String check_out;
  int number_of_people;
  int campsite;
  int status;
  String thumbnail_image;
  double price;
  int? created_user_id;
  String? bank_name;
  String? bank_number;
  String? payment_slip;
  String? booking_number;

  Booking(
      {this.id,
      required this.check_in,
      required this.check_out,
      required this.number_of_people,
      required this.campsite,
      required this.status,
      required this.price,
      required this.thumbnail_image,
      this.created_user_id,
      this.bank_name,
      this.bank_number,
      this.payment_slip,
      this.booking_number});

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
