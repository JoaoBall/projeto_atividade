import 'package:projeto_atividade/model/entity/companies/companies.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

class Global {
  static List<Companies> companies = [];
  static List<AssetResponse> assets = [];
  static List<LocationsResponse> locations = [];
}
