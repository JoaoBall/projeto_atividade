import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:projeto_atividade/base/model/base_model.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';
import 'package:projeto_atividade/network/service/import/import_service.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

class MainModel extends BaseModel {
  final _service = ImportService();

  late List<AssetResponse> assets = [];
  late List<LocationsResponse> locations = [];

  Future<void> find(String company) async {
    assets = await _service.importAssets(company);
    locations = await _service.importLocations(company);
  }

 
}
