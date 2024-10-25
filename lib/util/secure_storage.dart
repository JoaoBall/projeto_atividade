import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  static Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  static Future<int> readInt(String key) async {
    var value = await storage.read(key: key);

    if (value == null) return -1;

    return int.parse(value);
  }

  static Future<Map<String, String>> readAll() async {
    return await storage.readAll();
  }

  static write(String key, String? value) async {
    await storage.write(key: key, value: value);
  }

  static delete(String key) async {
    await storage.delete(key: key);
  }

  static deleteAll() async {
    await storage.deleteAll();
  }
}
