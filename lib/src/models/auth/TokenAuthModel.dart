// ignore_for_file: non_constant_identifier_names, file_names

import 'package:json_annotation/json_annotation.dart';

part 'TokenAuthModel.g.dart';

@JsonSerializable()
class TokenAuthModel {
  String prefix, token;
  int expiration;

  TokenAuthModel({
    required this.prefix,
    required this.token,
    required this.expiration,
  });

  factory TokenAuthModel.fromJson(Map<String, dynamic> json) =>
      _$TokenAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenAuthModelToJson(this);
}
