import 'package:json_annotation/json_annotation.dart';

part 'asset_response.g.dart';

@JsonSerializable(createToJson: false)
class AssetResponse {
  String id;
  String? name;
  String? locationId;
  String? sensorType;
  String? status;
  String? parentId;

  // Constructor
  AssetResponse(
    this.id,
    this.name,
    this.locationId,
    this.sensorType,
    this.status,
    this.parentId,
  );

  // JSON
  factory AssetResponse.fromJson(Map<String, dynamic> json) => _$AssetResponseFromJson(json);

  // Overrides
  @override
  String toString() {
    return "$id $name $status $sensorType".toLowerCase();
  }
}
