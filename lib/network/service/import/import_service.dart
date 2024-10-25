import 'package:dio/dio.dart';
import 'package:projeto_atividade/util/exceptions/exceptions.dart';
import 'package:projeto_atividade/network/api/import/import_api.dart';
import 'package:projeto_atividade/network/api/builder/api_builder.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';
import 'package:projeto_atividade/model/repository/import/import_repository.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

class ImportService {
  // API
  final _api = ImportApi(ApiBuilder.createService());

  // Repositories
  final _importRepository = ImportRepository();

  List<AssetResponse> assets = [];
  List<LocationsResponse> locations = [];

  Future<void> companies() async {
    try {
      // Response Form
      final response = await _api.companies();

      // Response Data
      final data = response;

      if (data.isNotEmpty) {
        // Updates
        await _importRepository.importCompanies(data);
      }
    } catch (e) {
      if (e is DioException) {
        throw ServerConnectionException(message: e.message, dioErrorType: e.type);
      } else {
        rethrow;
      }
    }
  }

  Future<List<AssetResponse>> importAssets(String company) async {
    try {
      // Response Form
      final responseAssets = await _api.assets(company);

      if (responseAssets.isNotEmpty) {
        // Updates
        assets = await _importRepository.importAssets(responseAssets, company);
      }

      return assets;
    } catch (e) {
      if (e is DioException) {
        throw ServerConnectionException(message: e.message, dioErrorType: e.type);
      } else {
        rethrow;
      }
    }
  }

  Future<List<LocationsResponse>> importLocations(String company) async {
    try {
      // Response Form
      final responseLocation = await _api.locations(company);

      if (responseLocation.isNotEmpty) {
        // Updates
        locations = (await _importRepository.importLocation(responseLocation, company))!;
      }
      return locations;
    } catch (e) {
      if (e is DioException) {
        throw ServerConnectionException(message: e.message, dioErrorType: e.type);
      } else {
        rethrow;
      }
    }
  }
}
