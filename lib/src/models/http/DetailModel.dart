// ignore_for_file: non_constant_identifier_names, file_names

import 'package:json_annotation/json_annotation.dart';
part 'DetailModel.g.dart';

@JsonSerializable()
class DetailModel {
  String? detail;
  String? code;

  DetailModel({required this.detail, required this.code});

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);
}
