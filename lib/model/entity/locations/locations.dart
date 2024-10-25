import 'package:floor/floor.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

@Entity(tableName: Location.TABLE_NAME)
class Location {
  @primaryKey
  @ColumnInfo(name: FIELD_ID)
  String id;

  @ColumnInfo(name: FIELD_NAME)
  String? name;

  @ColumnInfo(name: FIELD_PARENTID)
  String? parentId;

  @ColumnInfo(name: FIELD_COMPANY_ID)
  String? companyId;

  //Table
  static const String TABLE_NAME = 'LOCATIONS';
  static const String FIELD_ID = 'FIELD_ID';
  static const String FIELD_NAME = 'FIELD_NAME';
  static const String FIELD_PARENTID = 'FIELD_PARENTID';
  static const String FIELD_COMPANY_ID = 'FIELD_COMPANY_ID';

  // Constructor
  Location(
    this.id,
    this.name,
    this.parentId,
    String? companyId,
  );

  // Factories
  factory Location.fromResponse(LocationsResponse response, String? companyId) => Location(
        response.id,
        response.name,
        response.parentId,
        companyId,
      );


}
