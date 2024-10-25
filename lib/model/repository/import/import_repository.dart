import 'package:projeto_atividade/global.dart';
import 'package:projeto_atividade/base/repository/base_repository.dart';
import 'package:projeto_atividade/model/entity/companies/companies.dart';
import 'package:projeto_atividade/model/dao/companies/companies_dao.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';
import 'package:projeto_atividade/network/response/companies/companies_response.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

class ImportRepository extends BaseRepository {
  late CompaniesDao _companiesDao;

  @override
  getInstance() async {
    if (!super.isInitilized) {
      await super.getInstance();

      _companiesDao = instance.companiesDao;
    }
  }

  Future<void> importCompanies(List<CompaniesResponse> responses) async {
    try {
      await getInstance();

      for (var response in responses) {
        await _companiesDao.createOrUpdate(Companies.fromResponse(response));
      }

      // Update na instância global da lista
      Global.companies = await _companiesDao.findAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AssetResponse>> importAssets(List<AssetResponse> responses, String company) async {
    List<AssetResponse> entity;
    try {
      await getInstance();

      entity = responses;

      /* for (var response in responses) {
        await _assetDao.createOrUpdate(Asset.fromResponse(response, company));
        await _assetDao.updateCompanIdById(company, response.id);
      }*/
    } catch (e) {
      rethrow;
    }
    return entity;
  }

  Future<List<LocationsResponse>?> importLocation(List<LocationsResponse> responses, String company) async {
    List<LocationsResponse>? entity;
    try {
      await getInstance();

      entity = responses;

      /* for (var response in responses) {
        await _locationDao.createOrUpdate(Location.fromResponse(response, company));
        await _locationDao.updateCompanIdById(company, response.id);
      }*/
    } catch (e) {
      rethrow;
    }
    return entity;
  }
}
