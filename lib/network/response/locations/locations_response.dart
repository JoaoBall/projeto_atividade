import 'package:json_annotation/json_annotation.dart';

part 'locations_response.g.dart';

@JsonSerializable(createToJson: false)
class LocationsResponse {
  String id;
  String? name;
  String? parentId;

  // Constructor
  LocationsResponse({
    required this.id,
    this.name,
    this.parentId,
  });

  // JSON
  factory LocationsResponse.fromJson(Map<String, dynamic> json) => _$LocationsResponseFromJson(json);

  // Overrides
  @override
  String toString() {
    return "$id $name".toLowerCase();
  }
}
