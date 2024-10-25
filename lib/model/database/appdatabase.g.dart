// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AssetDao? _assetDaoInstance;

  LocationDao? _locationDaoInstance;

  CompaniesDao? _companiesDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ASSET` (`ID` TEXT NOT NULL, `FIELD_NAME` TEXT, `FIELD_LOCATIONID` TEXT, `FIELD_SENSORTYPE` TEXT, `FIELD_STATUS` TEXT, `FIELD_PARENTID` TEXT, `FIELD_COMPANY_ID` TEXT, PRIMARY KEY (`ID`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `LOCATIONS` (`FIELD_ID` TEXT NOT NULL, `FIELD_NAME` TEXT, `FIELD_PARENTID` TEXT, `FIELD_COMPANY_ID` TEXT, PRIMARY KEY (`FIELD_ID`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `COMPANIES` (`ID` TEXT NOT NULL, `FIELD_NAME` TEXT NOT NULL, PRIMARY KEY (`ID`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AssetDao get assetDao {
    return _assetDaoInstance ??= _$AssetDao(database, changeListener);
  }

  @override
  LocationDao get locationDao {
    return _locationDaoInstance ??= _$LocationDao(database, changeListener);
  }

  @override
  CompaniesDao get companiesDao {
    return _companiesDaoInstance ??= _$CompaniesDao(database, changeListener);
  }
}

class _$AssetDao extends AssetDao {
  _$AssetDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _assetInsertionAdapter = InsertionAdapter(
            database,
            'ASSET',
            (Asset item) => <String, Object?>{
                  'ID': item.id,
                  'FIELD_NAME': item.name,
                  'FIELD_LOCATIONID': item.locationId,
                  'FIELD_SENSORTYPE': item.sensorType,
                  'FIELD_STATUS': item.status,
                  'FIELD_PARENTID': item.parentId,
                  'FIELD_COMPANY_ID': item.companyId
                }),
        _assetUpdateAdapter = UpdateAdapter(
            database,
            'ASSET',
            ['ID'],
            (Asset item) => <String, Object?>{
                  'ID': item.id,
                  'FIELD_NAME': item.name,
                  'FIELD_LOCATIONID': item.locationId,
                  'FIELD_SENSORTYPE': item.sensorType,
                  'FIELD_STATUS': item.status,
                  'FIELD_PARENTID': item.parentId,
                  'FIELD_COMPANY_ID': item.companyId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Asset> _assetInsertionAdapter;

  final UpdateAdapter<Asset> _assetUpdateAdapter;

  @override
  Future<List<Asset>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM ASSET',
        mapper: (Map<String, Object?> row) => Asset(
            row['ID'] as String,
            row['FIELD_NAME'] as String?,
            row['FIELD_LOCATIONID'] as String?,
            row['FIELD_SENSORTYPE'] as String?,
            row['FIELD_STATUS'] as String?,
            row['FIELD_PARENTID'] as String?,
            row['FIELD_COMPANY_ID'] as String?));
  }

  @override
  Future<void> updateCompanIdById(
    String companyId,
    String id,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE ASSET SET FIELD_COMPANY_ID=?1 WHERE ID=?2',
        arguments: [companyId, id]);
  }

  @override
  Future<int> create(Asset entity) {
    return _assetInsertionAdapter.insertAndReturnId(
        entity, OnConflictStrategy.fail);
  }

  @override
  Future<int> update(Asset entity) {
    return _assetUpdateAdapter.updateAndReturnChangedRows(
        entity, OnConflictStrategy.fail);
  }

  @override
  Future<int> createOrUpdate(Asset entity) async {
    if (database is sqflite.Transaction) {
      return super.createOrUpdate(entity);
    } else {
      return (database as sqflite.Database)
          .transaction<int>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        return transactionDatabase.assetDao.createOrUpdate(entity);
      });
    }
  }
}

class _$LocationDao extends LocationDao {
  _$LocationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _locationInsertionAdapter = InsertionAdapter(
            database,
            'LOCATIONS',
            (Location item) => <String, Object?>{
                  'FIELD_ID': item.id,
                  'FIELD_NAME': item.name,
                  'FIELD_PARENTID': item.parentId,
                  'FIELD_COMPANY_ID': item.companyId
                }),
        _locationUpdateAdapter = UpdateAdapter(
            database,
            'LOCATIONS',
            ['FIELD_ID'],
            (Location item) => <String, Object?>{
                  'FIELD_ID': item.id,
                  'FIELD_NAME': item.name,
                  'FIELD_PARENTID': item.parentId,
                  'FIELD_COMPANY_ID': item.companyId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Location> _locationInsertionAdapter;

  final UpdateAdapter<Location> _locationUpdateAdapter;

  @override
  Future<List<Location>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM LOCATIONS',
        mapper: (Map<String, Object?> row) => Location(
            row['FIELD_ID'] as String,
            row['FIELD_NAME'] as String?,
            row['FIELD_PARENTID'] as String?,
            row['FIELD_COMPANY_ID'] as String?));
  }

  @override
  Future<void> updateCompanIdById(
    String companyId,
    String id,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE LOCATIONS SET FIELD_COMPANY_ID=?1 WHERE FIELD_ID=?2',
        arguments: [companyId, id]);
  }

  @override
  Future<int> create(Location entity) {
    return _locationInsertionAdapter.insertAndReturnId(
        entity, OnConflictStrategy.fail);
  }

  @override
  Future<int> update(Location entity) {
    return _locationUpdateAdapter.updateAndReturnChangedRows(
        entity, OnConflictStrategy.fail);
  }

  @override
  Future<int> createOrUpdate(Location entity) async {
    if (database is sqflite.Transaction) {
      return super.createOrUpdate(entity);
    } else {
      return (database as sqflite.Database)
          .transaction<int>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        return transactionDatabase.locationDao.createOrUpdate(entity);
      });
    }
  }
}

class _$CompaniesDao extends CompaniesDao {
  _$CompaniesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _companiesInsertionAdapter = InsertionAdapter(
            database,
            'COMPANIES',
            (Companies item) =>
                <String, Object?>{'ID': item.id, 'FIELD_NAME': item.name}),
        _companiesUpdateAdapter = UpdateAdapter(
            database,
            'COMPANIES',
            ['ID'],
            (Companies item) =>
                <String, Object?>{'ID': item.id, 'FIELD_NAME': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Companies> _companiesInsertionAdapter;

  final UpdateAdapter<Companies> _companiesUpdateAdapter;

  @override
  Future<List<Companies>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM COMPANIES',
        mapper: (Map<String, Object?> row) =>
            Companies(row['ID'] as String, row['FIELD_NAME'] as String));
  }

  @override
  Future<Companies?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM COMPANIES WHERE ID=?1',
        mapper: (Map<String, Object?> row) =>
            Companies(row['ID'] as String, row['FIELD_NAME'] as String),
        arguments: [id]);
  }

  @override
  Future<int> create(Companies entity) {
    return _companiesInsertionAdapter.insertAndReturnId(
        entity, OnConflictStrategy.fail);
  }

  @override
  Future<int> update(Companies entity) {
    return _companiesUpdateAdapter.updateAndReturnChangedRows(
        entity, OnConflictStrategy.fail);
  }

  @override
  Future<int> createOrUpdate(Companies entity) async {
    if (database is sqflite.Transaction) {
      return super.createOrUpdate(entity);
    } else {
      return (database as sqflite.Database)
          .transaction<int>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        return transactionDatabase.companiesDao.createOrUpdate(entity);
      });
    }
  }
}
