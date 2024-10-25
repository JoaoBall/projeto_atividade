import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponse<T> {
  String? message;
  bool success;
  T? data;

  // Constructor
  BaseResponse(
    this.message,
    this.success,
    this.data,
  );

  // JSON
  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
