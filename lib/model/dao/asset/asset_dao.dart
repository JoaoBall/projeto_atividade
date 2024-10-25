import 'package:floor/floor.dart';
import 'package:projeto_atividade/base/dao/base_dao.dart';
import 'package:projeto_atividade/model/entity/asset/asset.dart';

@dao
abstract class AssetDao extends BaseDao<Asset> {
  @Query('SELECT * FROM ${Asset.TABLE_NAME}')
  Future<List<Asset>> findAll();

  @Query('UPDATE ${Asset.TABLE_NAME} SET ${Asset.FIELD_COMPANY_ID}=:companyId WHERE ${Asset.FIELD_ID}=:id')
  Future<void> updateCompanIdById(String companyId, String id);
}
