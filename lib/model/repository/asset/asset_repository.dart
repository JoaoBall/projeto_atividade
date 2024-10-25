import 'dart:developer';
import 'package:projeto_atividade/model/entity/asset/asset.dart';
import 'package:projeto_atividade/model/dao/asset/asset_dao.dart';
import 'package:projeto_atividade/base/repository/base_repository.dart';


class AssetRepository extends BaseRepository {
  late AssetDao _assetDao;

  @override
  getInstance() async {
    if (!super.isInitilized) {
      await super.getInstance();

      _assetDao = instance.assetDao;
    }
  }

  Future<List<Asset>> findAll() async {
    var entities = <Asset>[];

    try {
      await getInstance();

      entities = await _assetDao.findAll();

    } catch (e) {
      log(e.toString());
    }

    return entities;
  }
}
