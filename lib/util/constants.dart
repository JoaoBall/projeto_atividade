import 'package:uuid/uuid.dart';

class Constants {
  // App
  static const String APP_NAME = 'Lista';
  static const String APP_PREFIX = 'Lista';

  // Database
  static const String DB_NAME = 'lista';

  // API
  static const String API_HEADER_KEY = '';
  static const String API_HEADER_VALUE = '';

  // URLs
  static const String API_URL = 'https://fake-api.tractian.com/';

  // Routes
  static const String ROUTE_MAIN_PAGE = '/main';
  static const String ROUTE_PESSOA_PAGE = '/pessoa';
  static const String ROUTE_PROJETOS_PAGE = '/projetos';

  // UUID
  static String uuid() {
    return const Uuid().v4();
  }

  // Functions
  static String getApiUrl() {
    return API_URL;
  }

  static String getApiLookup() {
    return API_URL;
  }
}
