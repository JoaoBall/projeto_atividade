import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:projeto_atividade/util/constants.dart';
import 'package:projeto_atividade/model/entity/asset/asset.dart';
import 'package:projeto_atividade/model/dao/asset/asset_dao.dart';
import 'package:projeto_atividade/model/dao/location/location_dao.dart';
import 'package:projeto_atividade/model/entity/companies/companies.dart';
import 'package:projeto_atividade/model/entity/locations/locations.dart';
import 'package:projeto_atividade/model/dao/companies/companies_dao.dart';

part 'appdatabase.g.dart';

@Database(version: 1, entities: [
  Asset,
  Location,
  Companies,
])
abstract class AppDatabase extends FloorDatabase {
  static Future<AppDatabase>? _database;

  AssetDao get assetDao;
  LocationDao get locationDao;
  CompaniesDao get companiesDao;

  static Future<AppDatabase> getInstance() {
    _database ??= _buildDatabaseInstance();

    return _database!;
  }

  static Future<AppDatabase> _buildDatabaseInstance() {
    return $FloorAppDatabase.databaseBuilder(Constants.DB_NAME).build();
  }
}
