import 'package:floor/floor.dart';
import 'package:projeto_atividade/base/dao/base_dao.dart';
import 'package:projeto_atividade/model/entity/locations/locations.dart';

@dao
abstract class LocationDao extends BaseDao<Location> {
  @Query('SELECT * FROM ${Location.TABLE_NAME}')
  Future<List<Location>> findAll();
  
  @Query('UPDATE ${Location.TABLE_NAME} SET ${Location.FIELD_COMPANY_ID}=:companyId WHERE ${Location.FIELD_ID}=:id')
  Future<void> updateCompanIdById(String companyId, String id);
}
