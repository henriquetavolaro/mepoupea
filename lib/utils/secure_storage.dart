import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  final storage = const FlutterSecureStorage();

  final keyToken = 'jwt';

  Future setToken(String token) async {
    return await storage.write(key: keyToken, value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: keyToken);
  }

  Future removeToken() async {
    return await storage.write(key: keyToken, value: "");
  }

}