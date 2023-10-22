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

  Booking(
      {this.id,
      required this.check_in,
      required this.check_out,
      required this.number_of_people,
      required this.campsite,
      required this.status,
      required this.price,
      required this.thumbnail_image});

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}