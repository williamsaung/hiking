// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CampsiteModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campsite _$CampsiteFromJson(Map<String, dynamic> json) => Campsite(
      id: json['id'] as int?,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      phone_number: (json['phone_number'] as num).toDouble(),
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      thumbnail_image: json['thumbnail_image'] as String,
      status: json['status'] as int,
    )
      ..is_premium = json['is_premium'] as bool?
      ..facilities = (json['facilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$CampsiteToJson(Campsite instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'phone_number': instance.phone_number,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'thumbnail_image': instance.thumbnail_image,
      'status': instance.status,
      'is_premium': instance.is_premium,
      'facilities': instance.facilities,
    };
