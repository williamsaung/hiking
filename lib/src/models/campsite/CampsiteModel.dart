import 'package:json_annotation/json_annotation.dart';

import '../../constants/export_constants.dart';
part 'CampsiteModel.g.dart';

class Package {
  String name;
  double price;
  String description;
  List<String> images;

  Package({
    required this.name,
    required this.price,
    required this.description,
    required this.images,
  });
}

@JsonSerializable()
class Campsite {
  int? id;
  String name;
  double price;
  String description;
  double phone_number;
  String address;
  double latitude;
  double longitude;
  String thumbnail_image;
  int status;
  bool? is_premium;
  List<String>? facilities;

  Campsite({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.phone_number,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.thumbnail_image,
    required this.status, // Add this line
  });

  factory Campsite.fromJson(Map<String, dynamic> json) =>
      _$CampsiteFromJson(json);

  Map<String, dynamic> toJson() => _$CampsiteToJson(this);
}
