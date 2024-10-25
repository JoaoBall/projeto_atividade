import 'package:projeto_atividade/base/model/base_model.dart';
import 'package:projeto_atividade/model/entity/companies/companies.dart';
import 'package:projeto_atividade/model/repository/companies/companies_repository.dart';

class ProjetosModel extends BaseModel {
  final _companiesRepository = CompaniesRepository();

  List<Companies> entities = [];
  List<Companies> filtered = [];

  Future<List<Companies>> findCompany() async {
    if (!getSearchState()) {
      entities = await _companiesRepository.findAll();

      filtered = entities;
    }
    return entities;
  }
}
