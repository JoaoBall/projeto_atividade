import 'package:json_annotation/json_annotation.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

part 'import_response.g.dart';

@JsonSerializable(createToJson: false)
class ImportResponse {
  List<AssetResponse> assets;
  List<LocationsResponse> locations;

  // Constructor
  ImportResponse(
    this.assets,
    this.locations,
  );

  // JSON
  factory ImportResponse.fromJson(Map<String, dynamic> json) => _$ImportResponseFromJson(json);
}
