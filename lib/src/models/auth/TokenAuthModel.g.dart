// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenAuthModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenAuthModel _$TokenAuthModelFromJson(Map<String, dynamic> json) =>
    TokenAuthModel(
      id: json['id'] as int?,
      prefix: json['prefix'] as String,
      token: json['token'] as String,
      expiration: json['expiration'] as int,
    );

Map<String, dynamic> _$TokenAuthModelToJson(TokenAuthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'token': instance.token,
      'expiration': instance.expiration,
    };
