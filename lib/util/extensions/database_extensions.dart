import 'package:projeto_atividade/model/database/appdatabase.dart';

extension DatabaseExtensions on AppDatabase {
    Future<int> countBy({
    required String table,
    String? where,
  }) async {
    List<Map<String, Object?>> result;

    if (where != null) {
      result = await database.rawQuery('SELECT COUNT(*) FROM $table WHERE $where');
    } else {
      result = await database.rawQuery('SELECT COUNT(*) FROM $table');
    }

    return result.first['COUNT(*)'] as int;
  }
}
