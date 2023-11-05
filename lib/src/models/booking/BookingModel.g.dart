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
      status: json['status'] as int,
      price: (json['price'] as num).toDouble(),
      thumbnail_image: json['thumbnail_image'] as String,
      created_user_id: json['created_user_id'] as int?,
      bank_name: json['bank_name'] as String?,
      bank_number: json['bank_number'] as String?,
      payment_slip: json['payment_slip'] as String?,
      booking_number: json['booking_number'] as String?,
      campsite: json['campsite'] == null
          ? null
          : Campsite.fromJson(json['campsite'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'check_in': instance.check_in,
      'check_out': instance.check_out,
      'number_of_people': instance.number_of_people,
      'status': instance.status,
      'thumbnail_image': instance.thumbnail_image,
      'price': instance.price,
      'created_user_id': instance.created_user_id,
      'bank_name': instance.bank_name,
      'bank_number': instance.bank_number,
      'payment_slip': instance.payment_slip,
      'booking_number': instance.booking_number,
      'campsite': instance.campsite,
    };
