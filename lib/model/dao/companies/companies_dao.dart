import 'package:floor/floor.dart';
import 'package:projeto_atividade/base/dao/base_dao.dart';
import 'package:projeto_atividade/model/entity/companies/companies.dart';

@dao
abstract class CompaniesDao extends BaseDao<Companies> {
  @Query('SELECT * FROM ${Companies.TABLE_NAME}')
  Future<List<Companies>> findAll();

  @Query('SELECT * FROM ${Companies.TABLE_NAME} WHERE ${Companies.FIELD_ID}=:id')
  Future<Companies?> findById(int id);
}
