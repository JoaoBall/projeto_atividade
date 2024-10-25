import 'dart:developer';
import 'package:projeto_atividade/base/repository/base_repository.dart';
import 'package:projeto_atividade/model/dao/location/location_dao.dart';
import 'package:projeto_atividade/model/entity/locations/locations.dart';

class LocationRepository extends BaseRepository {
  late LocationDao _locationDao;

  @override
  getInstance() async {
    if (!super.isInitilized) {
      await super.getInstance();

      _locationDao = instance.locationDao;
    }
  }

  Future<List<Location>> findAll() async {
    var entities = <Location>[];

    try {
      await getInstance();

      entities = await _locationDao.findAll();
    } catch (e) {
      log(e.toString());
    }

    return entities;
  }
}
