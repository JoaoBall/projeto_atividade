import 'package:floor/floor.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';

@Entity(tableName: Asset.TABLE_NAME)
class Asset {
  @primaryKey
  @ColumnInfo(name: FIELD_ID)
  String id;

  @ColumnInfo(name: FIELD_NAME)
  String? name;

  @ColumnInfo(name: FIELD_LOCATIONID)
  String? locationId;

  @ColumnInfo(name: FIELD_SENSORTYPE)
  String? sensorType;

  @ColumnInfo(name: FIELD_STATUS)
  String? status;

  @ColumnInfo(name: FIELD_PARENTID)
  String? parentId;

  @ColumnInfo(name: FIELD_COMPANY_ID)
  String? companyId;

  // Table
  static const String TABLE_NAME = 'ASSET';
  static const String FIELD_ID = 'ID';
  static const String FIELD_NAME = 'FIELD_NAME';
  static const String FIELD_LOCATIONID = 'FIELD_LOCATIONID';
  static const String FIELD_SENSORTYPE = 'FIELD_SENSORTYPE';
  static const String FIELD_STATUS = 'FIELD_STATUS';
  static const String FIELD_PARENTID = 'FIELD_PARENTID';
  static const String FIELD_COMPANY_ID = 'FIELD_COMPANY_ID';

  // Constructor
  Asset(
    this.id,
    this.name,
    this.locationId,
    this.sensorType,
    this.status,
    this.parentId,
    String? companyId,
  );

  // Factories
  factory Asset.fromResponse(AssetResponse response, String? companyId) => Asset(
        response.id,
        response.name,
        response.locationId,
        response.sensorType,
        response.status,
        response.parentId,
        companyId,
      );
}
