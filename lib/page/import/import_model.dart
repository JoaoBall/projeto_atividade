import 'package:projeto_atividade/base/model/base_model.dart';
import 'package:projeto_atividade/network/service/import/import_service.dart';

class ImportModel extends BaseModel {
  final _service = ImportService();

  Future<void> import() async {
    try {
      await _service.companies();
    } catch (e) {
      rethrow;
    }
  }
}
