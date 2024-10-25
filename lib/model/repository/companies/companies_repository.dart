import 'dart:developer';
import 'package:projeto_atividade/base/repository/base_repository.dart';
import 'package:projeto_atividade/model/entity/companies/companies.dart';
import 'package:projeto_atividade/model/dao/companies/companies_dao.dart';

class CompaniesRepository extends BaseRepository {
  late CompaniesDao _companiesDao;

  @override
  getInstance() async {
    if (!super.isInitilized) {
      await super.getInstance();

      _companiesDao = instance.companiesDao;
    }
  }

  Future<List<Companies>> findAll() async {
    var entities = <Companies>[];

    try {
      await getInstance();

      entities = await _companiesDao.findAll();
    } catch (e) {
      log(e.toString());
    }

    return entities;
  }
}
