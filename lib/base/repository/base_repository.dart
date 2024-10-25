import 'package:projeto_atividade/model/database/appdatabase.dart';

class BaseRepository {
  late AppDatabase instance;

  bool isInitilized = false;

  getInstance() async {
    instance = await AppDatabase.getInstance();

    isInitilized = true;
  }
}
