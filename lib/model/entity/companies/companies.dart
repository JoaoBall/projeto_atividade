import 'package:floor/floor.dart';
import 'package:projeto_atividade/network/response/companies/companies_response.dart';

@Entity(tableName: Companies.TABLE_NAME)
class Companies {
  @primaryKey
  @ColumnInfo(name: FIELD_ID)
  String id;

  @ColumnInfo(name: FIELD_NAME)
  String name;

  // Table
  static const String TABLE_NAME = 'COMPANIES';
  static const String FIELD_ID = 'ID';
  static const String FIELD_NAME = 'FIELD_NAME';

  // Constructor
  Companies(
    this.id,
    this.name,
  );

  // Factories
  factory Companies.fromResponse(CompaniesResponse response) => Companies(
        response.id,
        response.name,
      );

  // Overrides
  @override
  String toString() {
    return "$id $name".toLowerCase();
  }
}
