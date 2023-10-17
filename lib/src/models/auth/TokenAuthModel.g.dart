// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenAuthModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenAuthModel _$TokenAuthModelFromJson(Map<String, dynamic> json) =>
    TokenAuthModel(
      prefix: json['prefix'] as String,
      token: json['token'] as String,
      expiration: json['expiration'] as int,
    );

Map<String, dynamic> _$TokenAuthModelToJson(TokenAuthModel instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
      'token': instance.token,
      'expiration': instance.expiration,
    };
