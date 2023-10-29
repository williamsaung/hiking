// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookingModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      id: json['id'] as int?,
      check_in: json['check_in'] as String,
      check_out: json['check_out'] as String,
      number_of_people: json['number_of_people'] as int,
      campsite: json['campsite'] as int,
      status: json['status'] as int,
      price: (json['price'] as num).toDouble(),
      thumbnail_image: json['thumbnail_image'] as String,
      created_user_id: json['created_user_id'] as int?,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'check_in': instance.check_in,
      'check_out': instance.check_out,
      'number_of_people': instance.number_of_people,
      'campsite': instance.campsite,
      'status': instance.status,
      'thumbnail_image': instance.thumbnail_image,
      'price': instance.price,
      'created_user_id': instance.created_user_id,
    };
