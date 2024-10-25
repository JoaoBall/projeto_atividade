import 'package:json_annotation/json_annotation.dart';

part 'companies_response.g.dart';

@JsonSerializable(createToJson: false)
class CompaniesResponse {
  String id;
  String name;

  // Constructor
  CompaniesResponse(
    this.id,
    this.name,
  );

  // JSON
  factory CompaniesResponse.fromJson(Map<String, dynamic> json) => _$CompaniesResponseFromJson(json);
}
